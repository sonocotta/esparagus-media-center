#!/bin/bash
#
# Mass-flash ESPHome factory firmware over USB, mirroring
# _flash-target-usb.sh's "keep polling / flash whatever shows up" loop,
# but for the merged firmware.factory.bin images built by
# build-esphome-factory-firmware.yml (docs/artifacts/binaries/esphome/<slug>/).
#
# Unlike _flash-target-usb.sh (which takes a device glob and CONFIG as
# positional args and re-scans it every loop), this script asks once up
# front for the device model and the USB port, then keeps reusing that
# same port for every unit you plug in during the session - so you can
# flash a batch of one board model back to back on the same cable
# without re-selecting anything.

GREEN='\033[0;32m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ARTIFACTS_DIR="$REPO_ROOT/docs/artifacts/binaries/esphome"
MANIFEST_DIR="$REPO_ROOT/docs/artifacts"
BAUDRATE=460400

if ! command -v jq >/dev/null 2>&1; then
    echo "jq is required (used to read the chip family out of the flash manifest). Install it and re-run."
    exit 1
fi

if command -v esptool >/dev/null 2>&1; then
    ESPTOOL=esptool
elif command -v esptool.py >/dev/null 2>&1; then
    ESPTOOL=esptool.py
elif [ -x "$REPO_ROOT/firmware/esphome/.venv/bin/esptool" ]; then
    ESPTOOL="$REPO_ROOT/firmware/esphome/.venv/bin/esptool"
else
    echo "esptool not found on PATH and no firmware/esphome/.venv - install esptool or set up the esphome venv."
    exit 1
fi

# ===== 1. Pick the device model =====
DEVICE_SLUGS=()
while IFS= read -r bin; do
    DEVICE_SLUGS+=("$(basename "$(dirname "$bin")")")
done < <(find "$ARTIFACTS_DIR" -mindepth 2 -maxdepth 2 -name firmware.factory.bin | sort)

if [ ${#DEVICE_SLUGS[@]} -eq 0 ]; then
    echo "No built factory firmware found under $ARTIFACTS_DIR - build it first (see build-esphome-factory-firmware.yml)."
    exit 1
fi

echo -e "${GREEN}Known devices:${NC}"
PS3="Select a device to flash: "
select SLUG in "${DEVICE_SLUGS[@]}"; do
    if [ -n "$SLUG" ]; then
        break
    fi
    echo "Invalid selection, try again."
done

FACTORY_BIN="$ARTIFACTS_DIR/$SLUG/firmware.factory.bin"
MANIFEST_JSON="$MANIFEST_DIR/manifest-${SLUG}-esphome-latest.json"

if [ ! -f "$MANIFEST_JSON" ]; then
    echo "No manifest found at $MANIFEST_JSON - can't determine chip family."
    exit 1
fi

CHIP_FAMILY=$(jq -r '.builds[0].chipFamily' "$MANIFEST_JSON")
case "$CHIP_FAMILY" in
    ESP32-S3) ESPTOOL_CHIP=esp32s3 ;;
    ESP32-S2) ESPTOOL_CHIP=esp32s2 ;;
    ESP32-C3) ESPTOOL_CHIP=esp32c3 ;;
    ESP32-C6) ESPTOOL_CHIP=esp32c6 ;;
    ESP32) ESPTOOL_CHIP=esp32 ;;
    *)
        echo "Unrecognized chipFamily '$CHIP_FAMILY' in $MANIFEST_JSON"
        exit 1
        ;;
esac

echo -e "${GREEN}Targeting $SLUG ($CHIP_FAMILY)${NC}"

# ===== 2. Pick the USB port =====
PORT_CANDIDATES=(/dev/cu.usbserial* /dev/cu.usbmodem* /dev/cu.SLAB* /dev/cu.wchusbserial* /dev/ttyUSB* /dev/ttyACM*)
PORTS=()
for p in "${PORT_CANDIDATES[@]}"; do
    [ -e "$p" ] && PORTS+=("$p")
done

if [ ${#PORTS[@]} -eq 0 ]; then
    echo "No connected serial ports found. Plug the device in over USB and re-run."
    exit 1
fi

echo -e "${GREEN}Connected ports:${NC}"
PS3="Select the USB port to use for this session: "
select PORT in "${PORTS[@]}"; do
    if [ -n "$PORT" ]; then
        break
    fi
    echo "Invalid selection, try again."
done

echo -e "${GREEN}Using $PORT for every flash in this session.${NC}"

# ===== 3. Flash loop - reuses the same PORT for each unit plugged in =====
while :
do
    if [ -e "$PORT" ]; then
        echo ""
        echo "Device found on $PORT, flashing $SLUG.."
        "$ESPTOOL" -b $BAUDRATE --port "$PORT" --chip "$ESPTOOL_CHIP" \
            --before default-reset --after hard-reset \
            write-flash -z 0x0 "$FACTORY_BIN"

        echo -n "Flashed, waiting for disconnect.."
        while :
        do
            if [ -e "$PORT" ]; then
                echo -n "."
            else
                echo " disconnected!"
                break
            fi
            sleep 1
        done
    else
        echo -n "Waiting for next device on $PORT.."
        while :
        do
            if [ -e "$PORT" ]; then
                break
            else
                echo -n "."
            fi
            sleep 1
        done
    fi
done
