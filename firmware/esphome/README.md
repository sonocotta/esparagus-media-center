# ESPHome Firmware Configurations

This directory contains ESPHome firmware configurations for all Esparagus Media Center devices. Each device has multiple configuration variants optimized for different use cases.

## Table of Contents

- [ESPHome Firmware Configurations](#esphome-firmware-configurations)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Hardware Variants](#hardware-variants)
    - [1. HiFi-Esparagus](#1-hifi-esparagus)
    - [2. Loud-Esparagus](#2-loud-esparagus)
    - [3. Louder-Esparagus](#3-louder-esparagus)
    - [4. Amped-Esparagus](#4-amped-esparagus)
    - [5. Esparagus Audio Brick](#5-esparagus-audio-brick)
      - [Audio Brick (ESP32)](#audio-brick-esp32)
      - [Audio Brick S3 (ESP32-S3)](#audio-brick-s3-esp32-s3)
      - [Audio Brick TAS58XX driver](#audio-brick-tas58xx-driver)
  - [Configuration Variants](#configuration-variants)
    - [Standard Media Player](#standard-media-player)
    - [Snapclient](#snapclient)
    - [Sendspin](#sendspin)
  - [Quick Start](#quick-start)
  - [Building and Flashing](#building-and-flashing)
    - [Using VS Code Tasks (Fast, as long as you have good hardware)](#using-vs-code-tasks-fast-as-long-as-you-have-good-hardware)
    - [Using Docker CLI](#using-docker-cli)
    - [Initial Flash via Serial](#initial-flash-via-serial)
    - [GitHub Actions CI/CD](#github-actions-cicd)
  - [Configuration](#configuration)
    - [Customizing Device Name](#customizing-device-name)
    - [Customizing Pinout](#customizing-pinout)
    - [Advanced Configuration](#advanced-configuration)
  - [Secrets Management](#secrets-management)
    - [Setup Secrets File](#setup-secrets-file)
  - [Package System](#package-system)
    - [Core Packages (all devices)](#core-packages-all-devices)
    - [DAC-Specific Packages](#dac-specific-packages)
    - [Feature Packages](#feature-packages)
    - [Using Packages](#using-packages)
  - [Additional Resources](#additional-resources)
  - [Contributing](#contributing)
  - [License](#license)

---

## Overview

All configurations use:
- **ESP-IDF framework** for better audio performance and stability. I used to provide Arduino-based examples as well, but they proved to be a poor user experience.
- **Modular package system** for code reusability (see `packages/` directory)
- **Shared secrets** for Wi-Fi credentials and API keys
- **Common features**: Wi-Fi, OTA updates, API, debug logging, RGB LED, IR receiver

Each hardware variant has 2-3 firmware options depending on your use case.

---

## Hardware Variants

### 1. HiFi-Esparagus

**DAC**: PCM5100 (I2S)  
**Target**: High-quality line-level audio output, 2.1V RMS
**Features**: RGB LED, IR receiver

**Configurations:**
- `hifi-esparagus-idf.yaml` - Standard media player with mixer/resampler
- `hifi-esparagus-idf-snapclient.yaml` - Snapcast client, 2 variations - basic once and with software DSP controls
- `hifi-esparagus-idf-sendspin.yaml` - Sendspin synchronized playback, very much experimental but working quite impressively well

<img width="923" height="1224" alt="image" src="https://github.com/user-attachments/assets/add2bcec-46a6-4068-b173-084b964fcf83" />

---

### 2. Loud-Esparagus

**DAC**: Dual MAX98357A (I2S)  
**Target**: Built-in stereo amplifier for direct speaker connection (small speakers ~5W) 
**Features**: RGB LED, IR receiver, DAC enable control

**Configurations:**
- `loud-esparagus-idf.yaml` - Standard media player with mixer/resampler
- `loud-esparagus-idf-snapclient.yaml` - Snapcast client, 2 variations - basic once and with software DSP controls
- `loud-esparagus-idf-sendspin.yaml` - Sendspin synchronized playback, very much experimental but working quire impressively well

<img width="923" height="1224" alt="image" src="https://github.com/user-attachments/assets/a6aea826-c532-450e-8944-e5b7e8b16f27" />

---

### 3. Louder-Esparagus

**DAC**: TAS5805M (I2C + I2S) with built-in DSP  
**Target**: High-power output with advanced audio processing  
**Features**: RGB LED, IR receiver, optional OLED display, optional Ethernet (W5500)

**Configurations:**
- `louder-esparagus-idf.yaml` - Standard media player with TAS5805M DSP
- `louder-esparagus-idf-snapclient.yaml` - Snapcast client with DSP controls, software DSP makes less sense, since hardware DSP is much more efficient here
- `louder-esparagus-idf-sendspin.yaml` - Sendspin synchronized playback, very much experimental but working quire impressively well, especially in combination with built-in DSP

<img width="923" height="1224" alt="image" src="https://github.com/user-attachments/assets/36084c57-3cf2-4ce3-bc2d-26e8d5b52b04" />

---

### 4. Amped-Esparagus

**DAC**: PCM5100 (I2S) + TPA3110/TPA3128 amplifier  
**Target**: High-quality audio with powerful amplification  
**Features**: RGB LED, IR receiver, rotary encoder, optional Ethernet (W5500), optional OLED display

**Configurations:**
- `amped-esparagus-idf.yaml` - Standard media player with amplifier
- `amped-esparagus-j-idf.yaml` - Variant with Ethernet and OLED (Revision J/TPA3128 with MUTE amp control)
- `amped-esparagus-idf-snapclient.yaml` - Snapcast client, 2 variations - basic once and with software DSP controls
- `amped-esparagus-idf-j-snapclient.yaml` - Snapcast client (Revision J/TPA3128 with MUTE amp control)
- `amped-esparagus-idf-sendspin.yaml` - Sendspin synchronized playback
- `amped-esparagus-idf-j-sendspin.yaml` - Sendspin with Ethernet/OLED (Revision J/TPA3128 with MUTE amp control)

<img width="923" height="1224" alt="image" src="https://github.com/user-attachments/assets/2b68df50-4e4d-4217-b161-adc9de40eb6e" />

---

### 5. Esparagus Audio Brick

Two hardware versions available:

#### Audio Brick (ESP32)

**DAC**: TAS5825M (I2C + I2S) with built-in DSP  
**MCU**: ESP32  
**Target**: Compact high-quality audio module  
**Features**: RGB LED, Ethernet

**Configurations:**
- `audio-brick-idf.yaml` - Standard IDF media player
- `audio-brick-snapclient.yaml` - Snapcast client
- `audio-brick-idf-sendspin.yaml` - Sendspin synchronized playback

All examples allow 3 DSP configurations:

- 15-band EQ in ganged mode (both channels share DSP settings)
- 15-band Bi-amp (individual EQ per channel)
- Filter presets - allow applying 4th-order low or high frequency filters (60-150 Hz), mainly for bi-amp subwoofer/satellite use

#### Audio Brick S3 (ESP32-S3)

**DAC**: TAS5825M (I2C + I2S) with built-in DSP  
**MCU**: ESP32-S3 with PSRAM  
**Target**: Next-gen compact audio module with enhanced processing  
**Features**: RGB LED, IR receiver, PSRAM support

**Configurations:**
- `audio-brick-s3-idf.yaml` - Standard media player
- `audio-brick-s3-idf-snapclient.yaml` - Snapcast client
- `audio-brick-s3-idf-sendspin.yaml` - Sendspin synchronized playback

All examples allow 3 DSP configurations:

- 15-band EQ in ganged mode (both channels share DSP settings)
- 15-band Bi-amp (individual EQ per channel)
- Filter presets - allow applying 4th-order low or high frequency filters (60-150 Hz), mainly for bi-amp subwoofer/satellite use

<img width="923" height="1224" alt="image" src="https://github.com/user-attachments/assets/e36a8df6-e476-4d3b-afdf-12fc9db4cc66" />

#### Audio Brick TAS58XX driver

There is a new driver in development that supports both TAS5805M and TAS5825M DACs with a few extra DSP options. At the moment, it allows to configure 3 distinct EQ modes:

- 15-band EQ (ganged), similar to what was available for TAS5805M driver

<img width="374" height="944" alt="image" src="https://github.com/user-attachments/assets/6ef6dd41-05f2-467b-b027-c4c89d00696e" />

- 15-band EQ (individual controls per channel), allows you to fine-tune speakers in assymethrical setup

<img width="443" height="1132" alt="image" src="https://github.com/user-attachments/assets/f056cda6-a997-4b1d-a702-898c930a6932" />

- High/Low frequency profiles for bi-amp config, allows to filter out subwoofer and satellite channels with specific frequency in 60..150Hz range with 10Hz steps.

<img width="504" height="1039" alt="image" src="https://github.com/user-attachments/assets/ae53213c-0a28-4ed2-bed6-9dbcd960a8c6" />

The new driver also allows to adjust gain for both channels, which is essentially a balance for speakers that have different sensitivity and impedance.

---

## Configuration Variants

### Standard Media Player

**Files**: `*-idf.yaml`

Full-featured ESPHome media player with:

- Native Home Assistant integration
- Media player controls (play/pause/volume)
- Mixer and resampler for announcements
- Text-to-speech (TTS) support, with ducking (lowers background music during announcements)
- IR remote control
- RGB LED status indicator

**Best for**: General Home Assistant integration, TTS announcements, standard audio playback

<img width="854" height="1168" alt="image" src="https://github.com/user-attachments/assets/047d8522-06d5-46bc-834f-3104928591a5" />

---

### Snapclient

**Files**: `*-snapclient.yaml`

Snapcast client implementation with enhanced features:
- Synchronized multi-room audio playback
- 18-band equalizer (software DSP controls, works on every board)
  - Frequencies: 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 200, 315, 500, 800, 1250, 2000, 5000 Hz
  - Range: -15dB to +15dB per band
- Perfect audio synchronization across multiple devices
- Low latency streaming

**Best for**: Multi-room synchronized audio with a central Snapcast server

**Requirements**: Snapcast server (can run in Home Assistant add-on)

**Drawbacks**: Very much experimental at the moment
- do not support hardware mute
- do not support voice announcements
- limitations when using together with TAS58xx DSP (may not apply EQ if it starts without audio)
- do not support displaying audio title
- do not allow control volume from the snapclient node

<img width="872" height="1160" alt="image" src="https://github.com/user-attachments/assets/6117be69-e20f-41f3-be36-fae996044c8e" />

---

### Sendspin

**Files**: `*-sendspin.yaml`

Sendspin synchronized audio playback:

- Multi-room synchronized playback
- ESPHome native implementation
- Simplified setup compared to Snapcast
- Direct integration with Home Assistant
- Very much experimental (in beta currently)
- Allows pulling title, artist, and controlling playback

**Best for**: Multi-room audio without external server infrastructure

**Note**: Experimental feature, firmware version 2026.2.0+ required

<img width="846" height="1198" alt="image" src="https://github.com/user-attachments/assets/54a9b535-8296-4267-bf6b-4abd00b070f8" />

---

## Quick Start

1. **Choose your hardware variant** from the directories:
   - `1-hifi-esparagus/`
   - `2-loud-esparagus/`
   - `3-louder-esparagus/`
   - `4-amped-esapragus/`
   - `5-audio-brick/` or `5-audio-brick-s3/`

2. **Choose your configuration variant**:
   - Standard: `*-idf.yaml`
   - Snapclient: `*-snapclient.yaml`
   - Sendspin: `*-sendspin.yaml`

3. **Configure secrets** (see [Secrets Management](#secrets-management))

4. **Build and flash** (see [Building and Flashing](#building-and-flashing))

---

## Building and Flashing

### Using VS Code Tasks (Fast, as long as you have good hardware)

The project includes VS Code tasks for building with Docker:

1. Open any configuration YAML file
2. Run task: `Tasks > Run Build Task > ESPHome: Build Current File (Stable)`
3. For OTA updates: `ESPHome: Build and Upload OTA (Stable)`

### Using Docker CLI

```bash
# Build
docker run --rm \
  -v "$(pwd)/1-hifi-esparagus:/config" \
  -v "$(pwd)/packages:/config/packages" \
  -v "$(pwd)/secrets/secrets.yaml:/config/secrets.yaml" \
  -v "$(pwd)/.esphome-cache:/cache" \
  -e PLATFORMIO_BUILD_CACHE_DIR=/cache/.pio-cache \
  -it esphome/esphome:latest \
  compile /config/hifi-esparagus-idf.yaml

# Upload via OTA
docker run --rm \
  --network=host \
  -v "$(pwd)/1-hifi-esparagus:/config" \
  -v "$(pwd)/packages:/config/packages" \
  -v "$(pwd)/secrets/secrets.yaml:/config/secrets.yaml" \
  -it esphome/esphome:latest \
  run /config/hifi-esparagus-idf.yaml --device OTA
```

### Initial Flash via Serial

For first-time setup, flash via USB:

```bash
docker run --rm \
  --device=/dev/ttyUSB0 \
  -v "$(pwd)/1-hifi-esparagus:/config" \
  -v "$(pwd)/packages:/config/packages" \
  -v "$(pwd)/secrets/secrets.yaml:/config/secrets.yaml" \
  -it esphome/esphome:latest \
  run /config/hifi-esparagus-idf.yaml --device /dev/ttyUSB0
```

### GitHub Actions CI/CD

The project includes automated build pipeline (`.github/workflows/build-esphome.yml`) that:
- Automatically discovers all configuration files
- Builds all variants in parallel on pull requests
- Uses caching for faster builds

---

## Configuration

### Customizing Device Name

Each configuration file has substitutions at the top:

```yaml
substitutions:
  name: esphome-web-dc95a8  # Change this to your device name
  friendly_name: Hifi-Esparagus  # Change this to friendly name
```

### Customizing Pinout

All GPIO pins are defined in the `substitutions:` section. Modify these if you have your own hardware:

```yaml
substitutions:
  i2s_lrclk_pin: GPIO25
  i2s_bclk_pin: GPIO26
  i2s_dout_pin: GPIO22
  # ... more pins
```

### Advanced Configuration

Most functionality is imported from packages. To customize:

1. **Shared packages** (used by all devices): `packages/audio.yaml`, `packages/oled.yaml`
2. **DAC-specific packages**: `packages/audio-tas5805m.yaml`, `packages/audio-tas58xx.yaml`
3. **Feature packages**: `packages/sendspin-*.yaml`, `packages/ethernet-w5500.yaml`

Feel free to experiment with IR/RGB/Rotary/OLEd configuration. I on;y provide most basic configuration to get you started. Don't hesitate to extend it.

---

## Secrets Management

### Setup Secrets File

1. Copy the example: `cp secrets/secrets.yaml.example secrets/secrets.yaml`
2. Edit `secrets/secrets.yaml` with your credentials:

```yaml
# Wi-Fi credentials
esphome_wifi_ssid: "YourWiFiSSID"
esphome_wifi_password: "YourWiFiPassword"
esphome_ap_password: "YourAPPassword"
esphome_ota_password: "YourOTAPassword"
esphome_api_key: "YourAPIKey"

# Alternative naming (also supported)
wifi_ssid: "YourWiFiSSID"
wifi_password: "YourWiFiPassword"
```
---

## Package System

The package system promotes code reusability across different hardware variants:

### Core Packages (all devices)

- **`audio.yaml`**: Base audio configuration, media player, mixer, resampler
- **`light-8.yaml`**: RGB LED support (WS2812)
- **`ir_receiver.yaml`**: Infrared remote control

### DAC-Specific Packages

- **`audio-tas5805m.yaml`**: TAS5805M I2C DAC configuration
- **`audio-tas58xx.yaml`**: Generic TAS58xx family DAC support
- **`tas58xx-dac.yaml`**: TAS58xx with basic DAC config
- **`tas58xx-dac-biamp.yaml`**: TAS58xx with bi-amp configuration

### Feature Packages

- **`ethernet-w5500.yaml`**: W5500 Ethernet module support
- **`oled.yaml`**: SSD1306 OLED display
- **`sendspin-*.yaml`**: Sendspin multi-room audio variants

### Using Packages

Packages are imported at the top of each config file:

```yaml
packages:
  audio: !include ../packages/audio.yaml
  light: !include ../packages/light-8.yaml
```

This keeps device-specific configs clean and maintainable.

---

## Additional Resources

- **Main Project**: [Esparagus Media Center Repository](../../README.md)
- **ESPHome Documentation**: https://esphome.io
- **Home Assistant**: https://www.home-assistant.io
- **Snapcast**: https://github.com/badaix/snapcast
- **Discord Community**: Join our [Discord](https://discord.gg/PtnaAaQMpS) for support

---

## Contributing

ESPHome is very dynamic ecosystem at the moment, when it comes to Sendspin, things are changing literally every day. Found an issue - let me know, create PR, create issue. Help others to figure it out.

---

## License

See [LICENSE](../../LICENSE) in the root directory.
