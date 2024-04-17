## Using Esparagus Media Center with the Home Assistant

There is a number of ways Esprargus Media Center devices can be integrated into the Home Assistant setup. Each of them gives a unique feature, losing some other in return. As usual, there is no perfect solution for everyone, but perhaps there is one for you. 
Below is the summary table of the methods known to me and tested by me.

| Integration type                                                                                                          | Tested  | Description                                                                                                                      | Pros                                                                                                                   | Cons                                                                                                    |
|---------------------------------------------------------------------------------------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| [LMS/Airplay](https://github.com/sle118/squeezelite-esp32)                                                                 | Yes     | Connect to Music Assistant as external protocol device. Can play your media library and internet radio                           | Still can use squeezelite, i.e. use Spotify Connect and Apple Airplay when HA is not using the device                  | No native integration into HA, only works with Music Assistant                                          |
| [ESPHome way](https://www.espthings.io/index.php/2024/04/07/louder-esp32-a-hi-fi-class-d-audio-amplifier-running-esphome/) | Yes     | Connect as HA media device. Can be used with any HA integration, including Music Assistant, Text-to-Speach announcements, alarms, etc | More integrations with HA, more flexibility in use case                                                                | No longer works as Spotify, Airplay, etc.                                                                |
| [Snapcast way](https://github.com/CarlosDerSeher/snapclient/issues/70#issuecomment-2034700037)                             | Not yet | Connect to Music Assistant as snapcast protocol device. Can play your media library and internet radio.                          | Perfect for multiroom sync (Sonos-like, perhaps even better). Can be used with other Snapcast servers around the house | No longer works as Spotify, Airplay, etc. No native integration into HA only works with Music Assistant |

Below are specific steps that you need to follow to spin up Esprargus Media Center in the Home Assistant

### Configuring Home Assistant

I prefer to use HA with the Music Assistant. This way you can integrate both your media library and internet radio and have a nice UI/UX at the same time (including mobile).

Generally, you need to have supported HA (native) installation and follow [these steps](https://music-assistant.io/integration/installation/). I will place here a short version to have a reminder for future myself

| Step | Screenshot |
|------|------------|
| **Add SSH Addon** <br/> <br/> Navigate to Settings > Addons > Add Addon <br/> Search for SSH and install it. <br/> Enable `Show in sidebar` switch while you there | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/867a74db-7c50-472d-93da-d0e044818211)
| **Start SSH Addon** <br/> <br/> SSH addon won't start until you add at least one SSH public key to it. So navigate to SSH Addon Settings and add a key (or password) to the config <br/> It should be able to start now | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/962e6a8d-7f7f-41ba-8545-ac747099940f)
| **[Install Community Store](https://hacs.xyz/docs/setup/download/)** <br/> <br/> Run this command in the Terminal session <br> <code>wget -O - https://get.hacs.xyz &#124; bash -</code> <br/> You need to restart your HA after that | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/95eb9454-c7bf-43d2-b166-2a3dfd178479)
| **[Add HACS](https://hacs.xyz/docs/configuration/basic)** <br/> <br/> Navigate to Settings > Devices as Services > Integrations > Add Integration, search for HACS, and add it to the HA </br> You'll need to authorize your extension to your GitHub account | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/5ac72cee-a2f8-413f-9e26-b77f269c172c)
| **[Install Music Assistant via HACS](https://music-assistant.io/integration/installation/)** <br/> <br/> From the HACS menu search for Music Assistant and press the Download button <br/> You need to restart HA again <br/> In the Settings > Addons you should be able to see MA and enable sidebar navigation for it. | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/770c7087-fa02-4a08-9987-4b29eb8c06bd)
| **Configure Music Assistant** <br/> <br/> Before you enable Integration (that will in turn add speaker devices) you need to enable MA providers <br/> Go to MA > Settings > Providers and enable both Music providers and Player providers that interests you. If not sure, enable all of them, you can disable them later on. | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/562a5619-4925-4daa-9af4-1eb766f93ea0)
| **Add Music Assistant Integration** <br /> <br/> Navigate to HA Settings > Devices & services > Integrations. Click the big + ADD INTEGRATION button, look for Music Assistant, and click to add it. <br/> It should discover and add media devices based on the providers you're enabled in the previous step | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/3c2a0f95-5fdd-4513-b36d-3c662fc0f6fd)
| **Add Music Devices discovered by MA** <br/> <br/> You should be able to add and use discovered devices. More details in below sections | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/bbf91ed0-3c91-4555-8119-fa9b45deb0af) 

### LMS or Airplay

[gh://sle118/squeezelite-esp32](https://github.com/sle118/squeezelite-esp32)

When you have squeezelite-esp32 installed on your Esparagus device (either stock or manually going through [steps](https://github.com/sonocotta/esparagus-media-center?tab=readme-ov-file#squeezelite-esp32)), it will announce itself by multiple protocols in the network:

- Bluetooth
- LMS or slimproto - auto-discovered by HA
- Apple Airplay - auto-discovered by HA
- Spotify Connect

The power of this method is that you can use all four ways outside of HA, for example using your smartphone and Spotify app, and still have it integrated into HA at the same time.

#### Native HA integration

Make sure your MA Slimproto provider is disabled, it will conflict with the native HA integration 

| Step | Screenshot |
|------|------------|
| **Add SlimProto Integration** <br/> <br/> Navigate to HA Settings > Devices & services > Integrations. Click the big + ADD INTEGRATION button, look for  SlimProto, and install it. | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/67c0efec-6774-404b-b63d-e13151025147)
| **Add HA MediaPlayers provider to MA** | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/f652a565-05a1-4143-9e78-60ba3830ba5c)

#### Integrate into Music Assistant directly 

Disable SlimProto integration in the HA if you want to go the MA way. If you enabled SlimProto and AirPlay providers in the MA, you should find your device as both a Slimproto device and an Airplay device. It is up to you which protocol to use, generally, they both work perfectly well.

### ESPHome way

[Louder-ESP32 running ESPHome](https://www.espthings.io/index.php/2024/04/07/louder-esp32-a-hi-fi-class-d-audio-amplifier-running-esphome/)

| Step | Screenshot |
|------|------------|
| **Add ESPHome Addon** <br/> <br/> Navigate to HA Settings > Addons > Add Addon <br/> Search for SSH and install it.  <br/> Enable `Show in sidebar` switch while you there | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/9d9d0a44-ba2a-491f-bff8-e1c08b8754e0)
| **Prepare Esparagus for ESPHome onboarding** <br/> <br/> Use [Web Flasher](https://web.esphome.io/?dashboard_wizard) to flash stock ESPHome into device | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/8ad222e8-d992-4a75-9a93-596d67ac8cb0)
| **Onboard Esparagus ESPHome device into HA** <br/> <br/> Go to the HA ESPHome page and you should be able to find a new device. You need to onboard it with the below config (feel free to change names) <br/> This will take a moment or two | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/32b0c26a-3be1-4e15-b749-1176d46ff011)
| **Validate device in the ESPHome** | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/92df6029-c777-47ce-8ff9-debec70f7e05)
| **Add ESPHome Integration** <br /> <br/> Navigate to HA Settings > Devices & services > Integrations. Click the big + ADD INTEGRATION button, look for ESPHome, and click to add it. <br/> It should discover and add ESPHome media devices based on the previous step | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/c5d3bb12-8b07-4c49-a9e9-cdf2e6cad8ba)
| **Use your media device in the HA** | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/40067959-04ad-498c-a64d-4353e3f96228)
| **Use your media device in the MA** <br/> <br/> Add Music Assistant HA MediaPlayers provider to discover new Media device | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/6d19a972-83cf-4997-868c-1af0e4175c9b)

#### Esparagus HiFi and Loud Esparagus ESPHome config

```yaml
substitutions:
  name: esphome-web-e002d0
  friendly_name: loud-esparagus
  long_devicename: "Loud Esparagus"

esphome:
  name: "${friendly_name}"
  name_add_mac_suffix: false
  comment: "${long_devicename}"
  on_boot:
    priority: 800
    then:
    - media_player.volume_set:
        id: loudesp32
        volume: 10%

esp32:
  board: esp32dev
  framework:
    type: arduino

# Enable logging
logger:

# Enable Home Assistant API
api:

# Allow Over-The-Air updates
ota:

wifi:
  ssid: !secret esphome_wifi_ssid
  password: !secret esphome_wifi_password
  ap:
    ssid: "$name"
    password: password

captive_portal:

psram:
  mode: octal
  speed: 80MHz

i2s_audio:
  i2s_lrclk_pin: GPIO25
  i2s_bclk_pin: GPIO26

media_player:
  - platform: i2s_audio
    name: $long_devicename
    id: loudesp32
    dac_type: external
    i2s_dout_pin: GPIO22
    mode: stereo
```

#### Louder Esparagus ESPHome config

```yaml
substitutions:
  name: esphome-web-e002d0
  friendly_name: louder-esparagus
  long_devicename: "Louder Esparagus"

esphome:
  name: "${devicename}"
  name_add_mac_suffix: false
  comment: "${long_devicename}"
  includes:
    - louderesp32.h
  platformio_options:
    lib_deps: "Wire"
  on_boot:
    priority: 800
    then:
    ## Set a volume limit just to be safe...
    - media_player.volume_set:
        id: louderesp32
        volume: 10%

esp32:
  board: mhetesp32minikit

wifi:
  ssid: !secret esphome_wifi_ssid
  password: !secret esphome_wifi_password
  ap:
    ssid: "$devicename Fallback Hotspot"
    password: !secret esphome_ap_password

captive_portal:
### Optional if you want ethernet (then remove all wifi config) ###
#ethernet:
#  type: W5500
#  clk_pin: GPIO18
#  mosi_pin: GPIO23
#  miso_pin: GPIO19
#  cs_pin: GPIO05
#  interrupt_pin: GPIO35
#  reset_pin: GPIO14

logger:
  level: DEBUG

api:
  encryption:
    key: !secret esphome_api_key

ota:
  password: !secret esphome_ota_password

psram:
  mode: octal
  speed: 80MHz

switch:
  - platform: custom
    lambda: |-
      auto tas5805 = new TAS5805();
      App.register_component(tas5805);
      return {tas5805};
    switches:
      name: "Enable Amp"

i2c:
  sda: GPIO21
  scl: GPIO27
  scan: True
  id: i2c_component

i2s_audio:
  i2s_lrclk_pin: GPIO25
  i2s_bclk_pin: GPIO26

media_player:
  - platform: i2s_audio
    name: $long_devicename
    id: louderesp32
    dac_type: external
    i2s_dout_pin: GPIO22
    mode: stereo
```

For the last one to work you also need to place this file under `/config/esphome/louderesp32.h`

```C
//###########################################################################
//## ESPHome custom component for the Louder ESP32                         ##
//## Get it here: https://www.tindie.com/products/sonocotta/louder-esp32/  ##
//## Check the blog article on https://www.espthings.io/louder-esp32       ##
//###########################################################################
#include "esphome.h"
#include <Wire.h>
#define DEVICE_CTRL_2_REGISTER 0x03
#define PWDN_PIN 33
#define I2C_ADDR 0x2D
class TAS5805 : public Component, public Switch  {
  public:
    void setup() override {
      pinMode(PWDN_PIN, OUTPUT);
      digitalWrite(PWDN_PIN, LOW);
      delay(200);
      digitalWrite(PWDN_PIN, HIGH);
      Wire.begin();
      Wire.beginTransmission(I2C_ADDR);
      if (Wire.endTransmission() != 0) {
        ESP_LOGE("TAS5805", "TAS5805 not found at address 0x2D");
        return;
      }
      Wire.beginTransmission(I2C_ADDR);
      Wire.write(DEVICE_CTRL_2_REGISTER);
      Wire.write(0x02);
      Wire.endTransmission();
      delay(50);
      Wire.beginTransmission(I2C_ADDR);
      Wire.write(DEVICE_CTRL_2_REGISTER);
      Wire.write(0x03);
      Wire.endTransmission();
      ESP_LOGI("TAS5805", "TAS5805 initialized.");
    }
 
    void write_state(bool state) override {
      uint8_t value = state ? 0x03 : 0x00;
      Wire.beginTransmission(I2C_ADDR);
      Wire.write(DEVICE_CTRL_2_REGISTER);
      Wire.write(value);
      Wire.endTransmission();
      publish_state(state);
    }
};
```

### Snapcast way

[gh://CarlosDerSeher/snapclient/](https://github.com/CarlosDerSeher/snapclient/)

| Step | Screenshot |
|------|------------|
| **[Flash Snapcast to the Esparagus board](https://github.com/DerPicknicker/snapclient/blob/TAS5805M/doc/docker_build.md)** <br/> <br /> Don't try to build it yourself, there are too many pitfalls. The docker build process is fairly straightforward. Before flashing you need to change the wifi and audio hardware config via `idf.py menuconfig`. when done flashing your Esparagus board will reboot and look for Snapserver in the network |  ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/47600e5e-16bf-4f4e-b4a5-e5ea531b64fb)
| **Enable Snapcast in the MA** <br/> <br /> Got to the Ma and enable Snapcast provider. Your speaker will be discovered automatically, as long as it is running | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/ef87f8cf-3318-47c9-98b1-1a88ef4647b0)
| **Use your media device in the MA** <br/> <br/> Play your audio into new device | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/9bc81bee-c412-4e00-a8dd-f63f4a412bf0)
| **Use group of speakers for multi-room setup** <br/><br/> In the MA settings > Players create a new group player and add as many Eparagus players as you need. Use that group speaker to get a synced audio | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/b371fb08-c900-451f-a1c9-35e25c8ae73b)
 

#### To Do

- Create web flasher tool with hardcoded configuration for Esparagus devices.
