# ESPHome Factory Firmware Architecture (build-free binary + auto-updates)

Reference notes on how ESPHome-based products (e.g. Home Assistant Voice PE) ship a
single pre-built binary that end users install via a browser and that then updates
itself automatically from GitHub — with a concrete recipe for replicating this for a
custom device.

Source repo studied: [`esphome/home-assistant-voice-pe`](https://github.com/esphome/home-assistant-voice-pe)

---

## 1. The three moving parts

"Factory firmware with built-in updates" isn't one feature — it's three separate
ESPHome mechanisms stacked together, each solving a different problem.

### 1.1 Initial flash (blank board → running firmware)

Handled entirely in the browser by **[ESP Web Tools](https://github.com/esphome/esp-web-tools)**,
a `<esp-web-install-button>` web component that talks to the board over WebSerial.

It reads a `manifest.json` that lists, per chip family, a set of binary **parts** and
the flash **offset** each goes at:

| Part | Typical ESP32 offset |
|---|---|
| bootloader | `0x1000` |
| partition table | `0x8000` |
| boot app | `0xe000` |
| application | `0x10000` |

ESPHome's compiler already produces a single **`firmware.factory.bin`** with all of
these pieces pre-merged into one image starting at offset 0, so a factory-install
manifest usually needs just one part:

```json
{
  "name": "My ESPHome Project",
  "version": "2026.9.1",
  "home_assistant_domain": "esphome",
  "funding_url": "https://example.com",
  "new_install_prompt_erase": true,
  "builds": [
    {
      "chipFamily": "ESP32-S3",
      "parts": [
        { "path": "firmware.factory.bin", "offset": 0 }
      ]
    }
  ]
}
```

```html
<esp-web-install-button manifest="manifest.json"></esp-web-install-button>
```

This is what powers the "click Install in your browser" flashing experience — zero
local toolchain required.

### 1.2 Wi-Fi onboarding (no credentials baked into the image)

Since the same binary ships to every unit, credentials can't be compiled in — they're
provisioned **after** flashing, over one of two channels, both implementing the open
[Improv](https://www.improv-wifi.com/) standard:

- **`esp32_improv`** — BLE-based. Used by Improv-compatible phone apps or the ESP Web
  Tools page itself.
- **`improv_serial`** — same protocol over the USB/UART connection already used to
  flash the device, so provisioning can happen in the same browser session before the
  cable is unplugged.

```yaml
esp32_improv:
  authorizer: my_button  # binary_sensor, or `none` to skip authorization
  authorized_duration: 1min
  status_indicator: my_status_led

improv_serial:
  next_url: https://example.com/my-project/manual?ip={{ip_address}}&name={{device_name}}&version={{esphome_version}}
```

**Caveat:** the BLE stack is heavy on ESP32 RAM. ESPHome's docs warn that combining
`esp32_improv` with memory-hungry components (voice assistant, audio) can crash the
device. Voice PE works around this by disabling BLE the moment Wi-Fi connects, and
gates provisioning behind a physical button press as the "authorizer" so no one can
inject Wi-Fi credentials over BLE without touching the device.

### 1.3 Ongoing updates (pull-based, not push)

As of **ESPHome 2024.6**, `ota:` became platform-based:

- `platform: esphome` — push-based, native protocol, used by the local Dashboard/CLI
  over LAN. Not relevant to a shipped/remote device.
- `platform: http_request` — **pull-based**: the device itself fetches a binary from
  a URL. This is the one that matters here.

Paired with it, a separate **`update:`** component (`platform: http_request`)
periodically polls a `manifest.json` (default interval: 6 hours), compares its
`version` field against the device's own compiled version, and — if newer — exposes
an "update available" entity to Home Assistant and can trigger the OTA fetch.

```yaml
ota:
  - platform: http_request
    id: ota_http_request

update:
  - platform: http_request
    name: Firmware Update
    id: update_http_request
    source: https://you.github.io/yourrepo/manifest.json
    update_interval: 6h
```

This manifest is **not** the parts-based one — it's a lighter, single-binary form:

```json
{
  "name": "My ESPHome Project",
  "version": "2026.9.1",
  "builds": [
    {
      "chipFamily": "ESP32-S3",
      "ota": {
        "md5": "<md5 of firmware.ota.bin>",
        "path": "/firmware.ota.bin",
        "release_url": "https://github.com/you/yourrepo/releases/tag/2026.9.1",
        "summary": "What changed in this release"
      }
    }
  ]
}
```

**Required fields:** `md5`, `path`, `chipFamily`. **Optional:** `release_url`, `summary`.

The binary it points to is a third build artifact:

| Artifact | Contents | Used for |
|---|---|---|
| `firmware.factory.bin` | bootloader + partition table + app, merged, offset 0 | Initial flash (ESP Web Tools, esptool) |
| `firmware.ota.bin` | app only | OTA updates (both push and pull) |
| `firmware.bin` | legacy / app-only | Older targets (e.g. ESP8266), manual download |

So one `esphome compile` run produces three distinct binaries for three distinct jobs.

---

## 2. How voice-pe assembles this (concrete example)

Repo structure (relevant files):

```
home-assistant-voice.yaml            # actual device logic
home-assistant-voice.factory.yaml    # "shippable product" layer on top
static/index.html                    # ESP Web Tools installer page
.github/workflows/gh-pages.yml       # publishes the installer page only
```

`home-assistant-voice.factory.yaml` layers on:

- `ota: platform: http_request`
- `update: platform: http_request`, with `source:` switchable between:
  - Production: `https://firmware.esphome.io/home-assistant-voice-pe/home-assistant-voice/manifest.json`
  - Beta: `https://firmware.esphome.io/home-assistant-voice-pe/home-assistant-voice/manifest-beta.json`
  - (exposed to Home Assistant as a `beta_firmware` template switch)
- `esp32_improv` authorized by the center button
- LED/BLE state machine around provisioning (BLE disabled ~5s after Wi-Fi connects)

**Important:** `.github/workflows/gh-pages.yml` in this repo does **not** compile
firmware — it only regenerates the static installer page's version dropdown from the
GitHub Releases API. The actual compile-and-publish-to-`firmware.esphome.io` pipeline
lives in Nabu Casa's internal infra and isn't public. The primitives above are exactly
what it's built from, though — you're not missing a public reference implementation
of the CI step so much as reconstructing it from documented ESPHome components.

### Dashboard adoption (orthogonal, optional)

If someone runs their own ESPHome Dashboard, `esphome.project` + `dashboard_import`
lets them one-click "adopt" your device from a GitHub-hosted YAML:

```yaml
esphome:
  name: "${name}"
  project:
    name: you.my-project
    version: "1.0"

dashboard_import:
  package_import_url: github://you/yourrepo/device.yaml@main
  import_full_config: false
```

This is unrelated to the web-installer/OTA path (it's for people who already run
ESPHome locally) but is cheap to add.

---

## 3. Recipe for a custom device

### Repo layout

```
device.yaml           # your actual hardware config
device.factory.yaml   # packages device.yaml with ota/update/improv/project
.github/workflows/release.yml
```

`device.factory.yaml` (sketch):

```yaml
packages:
  device: !include device.yaml

esphome:
  name_add_mac_suffix: true
  project:
    name: you.my-device
    version: "${version}"   # injected by CI at compile time

wifi:
  ap:
    password: "12345678"
captive_portal:

esp32_improv:
  authorizer: none   # or gate behind a real button for production

ota:
  - platform: http_request

update:
  - platform: http_request
    name: Firmware Update
    source: https://you.github.io/yourrepo/manifest.json
```

### CI (GitHub Actions, on tag push)

1. Run `ghcr.io/esphome/esphome compile device.factory.yaml` in the official ESPHome
   Docker image.
2. Pull `firmware.factory.bin` and `firmware.ota.bin` out of the build directory.
3. `md5sum` the OTA binary.
4. Template both manifests:
   - parts-based `manifest.json` for the browser flash page → `firmware.factory.bin`
   - update-component `manifest.json` for OTA → `firmware.ota.bin`
5. Commit binaries + both manifests + a static page embedding
   `<esp-web-install-button>` to a `gh-pages` branch (or use
   `actions/deploy-pages`).

### Result

- First unit: flash via the GitHub Pages install page in Chrome/Edge over USB.
- Provision Wi-Fi via Improv in that same browser session.
- From then on: device checks the Pages URL every 6 hours for a newer `version` and
  pulls `firmware.ota.bin` automatically.
- No dashboard, no local ESPHome install, ever — for you or anyone you hand a device
  to.

---

## 4. Caveats before building

- **Manifest hosting:** don't host the OTA `manifest.json` on GitHub *Releases*
  directly — release asset URLs redirect through a long signed-URL chain and tend to
  exceed `http_request`'s buffer limits. Use GitHub Pages, or raise the buffer size.
- **Secrets in a public repo:** if the repo (and thus `device.factory.yaml`) is
  public, don't commit a real `api.encryption_key` or `ota.password`. Either omit
  auth for a hobby single-user device, or inject a per-fork key via a GitHub Actions
  secret at compile time.
- **BLE + RAM:** `esp32_improv` shares RAM with everything else on the ESP32; avoid
  combining it with heavy components (voice assistant, audio) without testing.
- **Rollback:** the `ota:` component enables Safe Mode by default, which gives you
  automatic recovery if a pushed update fails to boot — no extra config needed for
  the basic case.

---

## Sources

- [Sharing ESPHome devices — ESPHome docs](https://esphome.io/guides/creators/)
- [ESPHome OTA Updates — ESPHome docs](https://esphome.io/components/ota/)
- [ESPHome `update: http_request` platform — ESPHome docs](https://esphome.io/components/update/http_request)
- [`esp32_improv` — ESPHome docs](https://esphome.io/components/esp32_improv)
- [esp-web-tools README (manifest.json schema)](https://github.com/esphome/esp-web-tools)
- [home-assistant-voice-pe repository](https://github.com/esphome/home-assistant-voice-pe)
- [Firmware Management — home-assistant-voice-pe (DeepWiki)](https://deepwiki.com/esphome/home-assistant-voice-pe/5-firmware-management)
- ["firmware.factory.bin, firmware.bin and firmware.ota.bin" — Home Assistant Community](https://community.home-assistant.io/t/firmware-factory-bin-firmware-bin-and-firmware-ota-bin/909025)
