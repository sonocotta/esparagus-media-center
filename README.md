# Esparagus Media Center

![Open Source Hardware](/images/open-source-hardware-logo.png)
![Open Source Software](/images/open-source-software-logo.png)
<a href="https://www.tindie.com/stores/sonocotta/?ref=offsite_badges&utm_source=sellers_andrey-malyshenko&utm_medium=badges&utm_campaign=badge_medium"><img src="https://d2ss6ovg47m0r5.cloudfront.net/badges/tindie-mediums.png" alt="I sell on Tindie" width="150" height="78"></a>
<br />
[![Dev Chat](https://img.shields.io/discord/1233306441469657140?logo=discord&label=discord&style=flat-square)](https://discord.gg/PtnaAaQMpS)

![DSC_0724](https://github.com/sonocotta/esparagus-media-center/assets/5459747/a4294682-0a17-4e0d-a833-5988d88172b6)

Esparagus Media Center is a series of ESP32-based media center devices. They all run [Squeezelite-ESP32](https://github.com/sle118/squeezelite-esp32) software and have similar media capabilities, but are aimed at different use cases. They share a similar look, and compared to my earlier designs, they have a great-looking aluminum case.

![image](https://github.com/user-attachments/assets/5d884668-91a0-46bf-9253-0f609236fedd)

## Table of Contents

- [Esparagus Media Center](#esparagus-media-center)
  - [Table of Contents](#table-of-contents)
  - [Why Esparagus](#why-esparagus)
  - [Motivation](#motivation)
  - [Esparagus HiFi MediaLink](#esparagus-hifi-medialink)
  - [Loud Esparagus](#loud-esparagus)
  - [Louder Esparagus](#louder-esparagus)
  - [Amped Esparagus](#amped-esparagus)
  - [Esparagus Audio Brick (prototype)](#esparagus-audio-brick-prototype)
  - [Which device is right for me](#which-device-is-right-for-me)
  - [Features](#features)
    - [Onboard PSRAM](#onboard-psram)
  - [Board Pinout](#board-pinout)
    - [Common to every board](#common-to-every-board)
    - [Peripheral (Loud Esparagus \& Esparagus HiFi MediaLink )](#peripheral-loud-esparagus--esparagus-hifi-medialink-)
    - [Rotary encoder (Amped Esparagus)](#rotary-encoder-amped-esparagus)
    - [TAS5805M DAC (Louder Esparagus)](#tas5805m-dac-louder-esparagus)
    - [Peripheral - OLED Screen and W5500 Ethernet (Louder Esparagus)](#peripheral---oled-screen-and-w5500-ethernet-louder-esparagus)
    - [Other Peripheral (Louder Esparagus)](#other-peripheral-louder-esparagus)
  - [Which software is right for me](#which-software-is-right-for-me)
  - [Software samples](#software-samples)
    - [Platformio IDE](#platformio-ide)
    - [Arduino IDE](#arduino-ide)
  - [Using Esparagus Media Center with the Home Assistant](#using-esparagus-media-center-with-the-home-assistant)
    - [Configuring Home Assistant](#configuring-home-assistant)
    - [Home Assistant: LMS or Airplay](#home-assistant-lms-or-airplay)
      - [Native HA integration](#native-ha-integration)
      - [Integrate into Music Assistant directly](#integrate-into-music-assistant-directly)
    - [Home Assistant: ESPHome](#home-assistant-esphome)
    - [Home Assistant: Snapcast](#home-assistant-snapcast)
  - [Squeezelite-ESP32](#squeezelite-esp32)
    - [How to flash and configure](#how-to-flash-and-configure)
    - [Squeezelite-esp32 Bug causing boot loop](#squeezelite-esp32-bug-causing-boot-loop)
    - [Squeezelite-esp32 reboots and connection drops](#squeezelite-esp32-reboots-and-connection-drops)
  - [Hardware](#hardware)
    - [Boxed](#boxed)
    - [PCB](#pcb)
    - [BTL and PBTL mode (TAS5805M DAC)](#btl-and-pbtl-mode-tas5805m-dac)
    - [TAS5805M DSP capabilities](#tas5805m-dsp-capabilities)
    - [Louder and Amped Esparagus power considerations](#louder-and-amped-esparagus-power-considerations)
      - [Louder and Amped Esparagus NOPD](#louder-and-amped-esparagus-nopd)
      - [Louder and Amped Esparagus DUAL](#louder-and-amped-esparagus-dual)
      - [External voltage selection](#external-voltage-selection)
    - [Speakers selection](#speakers-selection)
    - [OLED screen (soldered in)](#oled-screen-soldered-in)
      - [OLED models](#oled-models)
    - [OLED screen (solder-less)](#oled-screen-solder-less)
      - [OLED models](#oled-models-1)
      - [Software side](#software-side)
    - [Audio Brick details](#audio-brick-details)
    - [Relay Driver](#relay-driver)
    - [Errata](#errata)
  - [Where to buy](#where-to-buy)

## Why Esparagus

ChatGPT made me call it that way. I only asked if there is a fruit or vegetable that is phonetically close to ESP32, which is the heart of this device.

## Motivation

I did a few audio projects in the past, some using [ESP32](https://hackaday.io/project/173620-loud-esp), some using larger [Orange Pi](https://hackaday.io/project/191936-orange-pi-home-media-center) and [Raspberry Pi](https://hackaday.io/project/162373-orangepi-zero-pulse-music-server-using-i2s-dac) devices. Each has its pros and cons, and with each iteration, I'm trying to focus on the details that were working best for me, while actually using them. 

What I like about the ESP32 is how lightweight it is. It barely draws power, so you may not care to turn it off at all. It boots in seconds and is ready for use in a snap. Still, it is capable and works at par with Linux SBC solutions for audio applications, while costing a fraction of their price. Combined with a proper Hi-Fi DAC, you would not tell a difference between commercial devices standing side by side and costing much more.

Over the last few years, I have seen a few amazing software products created to deliver audio on the ESP32, like [squeezelite-esp32](https://github.com/sle118/squeezelite-esp32) or  [euphonium](https://github.com/muvox-io/euphonium). Esparagus media center devices are designed specifically to run these great pieces of software and bring new life into aging audio equipment that most of us have at home but do not use that much these days, since it is not working with Spotify and the family.

## Esparagus HiFi MediaLink

Esparagus HiFi MediaLink is a handy low-cost media device that will upgrade your legacy audio system with cutting-edge internet streaming capabilities and enhance your audio experience. It exposes line-level output that you can plug into a stereo amplifier. It uses the legendary PCM51 series DAC with supreme audio quality.

![DSC_0702](https://github.com/sonocotta/esparagus-hifi-medialink/assets/98712315/3ef311c6-2fbc-4969-aa99-4fed7e1e1dd5)

## Loud Esparagus

Loud Esparagus is aimed to be paired with small-to-medium-sized speakers in a small room. It uses a dual MAX98357 Hi-Fi DAC that will output 3W per speaker. Admittedly not much, but well enough for a kid's room or workplace. Due to the D-class amp, it barely uses power and can be paired with a standard USB wall charger.   

![DSC_0689](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/7635cb2a-6ef1-43e8-8396-c27ef5387a25)

## Louder Esparagus

Louder Esparagus is a top-of-the-range model that uses a modern, highly capable TAS5805M DAC and is aimed to be paired with medium-to-large speaker systems. With 25W per channel stereo output, it packs a punch and can easily enliven living quarters or dorm rooms. It is highly efficient, but much more demanding for power when cranked; therefore, it uses USB-C Power Delivery to pull up to 65W from the wall power adapter. It can be used both with Wi-Fi and Ethernet (to make sure bad Wi-Fi does not interrupt the stream)

The latest update allows a direct power through barrel jack as an alternative to the USB-PD to provide an alternative and allow more precise control over the power source for your audio 

![DSC_0009](https://github.com/user-attachments/assets/538e0165-d973-4222-81e7-64d4013869d6)

## Amped Esparagus

The last in the family, Amped Esparagus, is a device based on PCM5100 HiFi DAC (just like HiFi Esparagus) but adds a powerful and efficient D-class amp (TPA3110D2) so it can drive speakers directly. It has similar power capabilities to the Louder Esparagus, but it is much simpler to set up and use, since this DAC doesn't need any configuration steps to get going, just a valid I2S audio stream. Simplicity comes at a price, it doesn't have a DSP unit either. Since it has an analog stage, you can use it either with a built-in amp or with an external amp, if you prefer so.

![DSC_0022](https://github.com/user-attachments/assets/e9481545-e98d-4d6a-b0eb-a993ab151dc8)

With the Amped Esparagus, I'm implementing and testing a new updated look with every board equipped with a semi-transparent front face as standard. Behind it, there is a front-facing IR reader and an 8-LED RGB strip (that can be used for audio visualization or power state). Most noticeably, there is a rotary encoder with a push-button that allows quick change of volume or play/pause action.  

## Esparagus Audio Brick (prototype)

The Esparagus Audio Brick is a new addition to the Esparagus line of ESP32-based audio hardware. Similar to the Louder Esparagus boards for the most part, the Audio Brick uses the newer TAS5825M DAC/amp, which is a considerably more capable chip with considerably better efficiency figures. It is designed with Home Assistant in mind, so it is a little less about look, and a little more about longevity and practicality.

<img width="2288" height="1237" alt="image" src="https://github.com/user-attachments/assets/924644a5-4834-44c5-8c4c-e8f3ce479baa" />

Unlike previous boards, which were mostly intended for table-top use, the Audio Brick is optimized for DIN-rail mounting and modular expansion. Thermal management has been improved for enclosed installs, the power stage has been reworked for efficiency, and the design has been cost-reduced to make multi-unit deployments more practical.

At this moment, I'm preparing a Crowd Supply campaign to support the development of the new DAC driver and the first production batch of the units.

## Which device is right for me

<img width="1047" height="1112" alt="Esparagus Lineup-Device Select Map (ESP32) drawio (1)" src="https://github.com/user-attachments/assets/79e9bcd5-f621-416e-8a61-c49d2770f2e1" />

## Features

|  | [HiFi Esparagus](https://www.tindie.com/products/sonocotta/esparagus-hifi-medialink/) | [Loud Esparagus](https://www.tindie.com/products/sonocotta/loud-esparagus-media-center/) | [Louder Esparagus](https://www.tindie.com/products/sonocotta/louder-esparagus-media-center/) | [Amped Esparagus](https://www.tindie.com/products/sonocotta/amped-esparagus-media-center/) | Esparagus Audio Brick |
|---|---|---|---|---|---|
| Image | ![DSC_0709](https://github.com/sonocotta/esparagus-hifi-medialink/assets/98712315/ea45f1d2-32b5-4f12-a63c-a8e403cb22db) | ![DSC_0706](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/2556b8ff-1827-4e03-8e28-31e40199943c) | ![DSC_0713](https://github.com/sonocotta/esparagus-media-center/assets/5459747/14d54647-2b7e-4b1a-9a8e-135a1598eb02) | ![DSC_0022](https://github.com/user-attachments/assets/e9481545-e98d-4d6a-b0eb-a993ab151dc8) | <img width="2214" height="1217" alt="image" src="https://github.com/user-attachments/assets/89792e6c-e530-4c2b-8e8a-6ce86c9a98dc" /> |
| MCU | ESP32-WROVER-N8R8 | ESP32-WROVER-N8R8 | ESP32-WROVER-N16R8 | ESP32-WROVER-N16R8 | ESP32-WROVER-N16R8 |
| DAC | PCM5100A 32bit Stereo DAC -100 dB typical noise level | Dual I2S DAC ([MAX98357](https://www.analog.com/en/products/max98357a.html)) with built in D-Class amp | Stereo I2S DAC ( [TAS5805M](https://www.ti.com/product/TAS5805M) ) with built in D-Class amp | [PCM5100A](https://www.ti.com/product/PCM5100A) 32bit Stereo DAC working with   [TPA3110D2](https://www.ti.com/product/TPA3110D2) D-Class amp | Stereo I2S DAC (  [TAS5825M](https://www.ti.com/product/TAS5825M)  ) with built in D-Class amp |
| Power | 5V over USB-C, 2x [LP5907](https://www.ti.com/lit/ds/symlink/lp5907.pdf) 3.3 V Ultra-Low-Noise LDO for analog section | 5V from USB-C | Up to 20V from USB-C PD or up to 26V from generic power adapter | Up to 20V from USB-C PD or up to 26V from generic power adapter | Up to 26V from a generic power adapter |
| Output, 4Ω | Non-amplified stereo output | 2x 3W | 2x 32W (4Ω, 1% THD+N) | 2x 22W (4Ω, 1% THD+N) at 16V   1x 40W (4Ω, 1% THD+N) at 20V | 2x 10W at 12V at 4Ω, THD+N = 1% (Efficiency mode) 1x 20W at 12V at 3Ω, THD+N = 1% (Efficiency mode) 1x 65W at 24V at 4Ω, THD+N = 1% (Power mode) |
| Output, 8Ω | - | 2x 5W | 2x 22W (8Ω, 1% THD+N) | 2x 25W (8Ω, 1% THD+N) at 22V | 2x 30W at 24V at 8Ω, THD+N = 1% (Power mode) |
| PSRAM | 8MB PSRAM (4MB usable) | 8MB PSRAM (4MB usable) | 8MB PSRAM (4MB usable) | 8MB PSRAM (4MB usable) | 8MB PSRAM (4MB usable) |
| Peripheral | WS2812B RGB Led   SSD1306 128x64 OLED screen (optional) | WS2812B RGB Led   SSD1306 128x64 OLED screen (optional) | WS2812B RGB Led   SSD1306 128x64 OLED screen (optional) | 8xWS2812B RGB Led   SSD1306 128x64 OLED screen (optional)   Rotary encoder with push button | 1xWS2812B RGB Led   SSD1306 128x64 OLED screen (optional) |
| Connectivity | WiFi   BT4.2   BLE | WiFi   BT4.2   BLE | WiFi   BT4.2   BLE   W5500 Ethernet | WiFi   BT4.2   BLE   W5500 Ethernet | WiFi   BT4.2   BLE   W5500 Ethernet |
| Size | 80 x 50 x 20mm | 80 x 50 x 20mm | 100 x 80 x 38mm | 100 x 80 x 38mm | 90 x 90 x 40mm |
| Software support | Arduino samples, squeezelite-esp32, snapcast, ESPhome config | Arduino samples, squeezelite-esp32, snapcast, ESPhome config | Arduino samples, squeezelite-esp32, snapcast, ESPhome config | Arduino samples, squeezelite-esp32, snapcast, ESPhome config | Arduino samples, squeezelite-esp32, snapcast, ESPhome config |

### Onboard PSRAM

Audio streaming requires proper buffering to work; even with the ESP32 500K of RAM, it is a challenging task. All Esparagus boards are based on WROVER modules that have an onboard PSRAM chip.

## Board Pinout

### Common to every board

|       | I2S CLK | I2S DATA | I2S WS | PSRAM CE | PSRAM CLK |  DAC EN (MAX98357A) 
|-------|---------|----------|--------|----------|-----------|-----------|
| ESP32 | 26      | 22       | 25     | 16       | 17        | 13

### Peripheral (Loud Esparagus & Esparagus HiFi MediaLink )

|       | SPI HOST| SPI CLK  |SPI MOSI| SPI MISO | OLED DC   | OLED CS   | OLED RST  |  WS2812 RGB LED |  RELAY EN |
|-------|---------|----------|--------|----------|-----------|-----------|-----------|---------|----------|
| ESP32 |    2    |  18      |  23    |   19     |   4       | 5         | 32        |     33  |  21      |

### Rotary encoder (Amped Esparagus)

|       | A        | B       |  SW    |  
|-------|----------|---------|--------|
| ESP32 |    27    |  33     |  34    |


### TAS5805M DAC (Louder Esparagus)

|       | I2C CLK | I2C DATA |  PWDN  |  FAULT   |
|-------|---------|----------|--------|----------|
| ESP32 |    27    |  21     |  33    |  34

### Peripheral - OLED Screen and W5500 Ethernet (Louder Esparagus)

|       | SPI HOST| SPI CLK  |SPI MOSI| SPI MISO | LAN RES   | LAN CS    | LAN INT   | OLED DC   | OLED CS   | OLED RST  |
|-------|---------|----------|--------|----------|-----------|-----------|-----------|-----------|-----------|-----------|
| ESP32 |    2    |  18      |  23    |   19     |  14       |  5        |  35       |    4      |   15      |    32     |

### Other Peripheral (Louder Esparagus)

|       | USB-PD EN | USB-PD POWER GOOD | IR INPUT |   WS2812 RGB LED
|-------|---------|----------|--------|----------|
| ESP32 |    13   |   36     |    39  | 12       | 

## Which software is right for me

<img width="1062" height="852" alt="image" src="https://github.com/user-attachments/assets/77612aca-5ca4-4052-b1b4-3467b012ad30" />

## Software samples

In the [software](/firmware) section, two firmware examples are provided.

- [esp32-i2s-bare](/firmware/esp32-i2s-bare/) is base I2S implementation based on ESP-IDF implementation directly.
- [esp32-i2s-esp8266audio](/firmware/esp32-i2s-esp8266audio/) is based on excellent [ESP8266Audio](https://github.com/earlephilhower/ESP8266Audio) library (it works with the whole ESP range, don't get fooled by the name), providing minimum code implementation. 
- [esp32-i2s-web-radio](/firmware/esp32-i2s-web-radio/) is based on the [same library](https://github.com/earlephilhower/ESP8266Audio), providing minimum web-readio stream player. It expects a playlist as input in the 'data' folder. 

### Platformio IDE
 
All samples are provided as [Platformio IDE](https://platformio.org/platformio-ide) projects. After installing it, open the sample project. Select the proper environment based on your dock. Run the `Build` and `Upload` commands to install necessary tools and libraries, and build and upload the project to the board. Communication and proper upload method selection will be handled by the IDE automatically. 

### Arduino IDE

Follow the [ESP8266Audio](https://github.com/earlephilhower/ESP8266Audio) library guide.

## Using Esparagus Media Center with the Home Assistant

There are several ways Esprargus Media Center devices can be integrated into the Home Assistant setup. Each of them gives a unique feature, losing some other in return. As usual, there is no perfect solution for everyone, but perhaps there is one for you. 
Below is the summary table of the methods known to me and tested by me.

| Integration type                                                                                                          | Tested  | Description                                                                                                                      | Pros                                                                                                                   | Cons                                                                                                    |
|---------------------------------------------------------------------------------------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| [LMS/Airplay](https://github.com/sle118/squeezelite-esp32)                                                                 | Yes     | Connect to Music Assistant as external protocol device. Can play your media library and internet radio                           | Still can use squeezelite, i.e., use Spotify Connect and Apple Airplay when HA is not using the device                  | No native integration into HA, only works with Music Assistant                                          |
| [ESPHome way](https://www.espthings.io/index.php/2024/04/07/louder-esp32-a-hi-fi-class-d-audio-amplifier-running-esphome/) | Yes     | Connect as HA media device. Can be used with any HA integration, including Music Assistant, Text-to-Speech announcements, alarms, etc | More integrations with HA, more flexibility in use case                                                                | No longer works as Spotify, Airplay, etc.                                                                |
| [Snapcast way](https://github.com/CarlosDerSeher/snapclient/issues/70#issuecomment-2034700037)                             | Yes | Connect to Music Assistant as snapcast protocol device. Can play your media library and internet radio.                          | Perfect for multiroom sync (Sonos-like, perhaps even better). Can be used with other Snapcast servers around the house | No longer works with Spotify, Airplay, etc. No native integration into HA only works with Music Assistant |

Below are specific steps that you need to follow to spin up the Esparagus Media Center in Home Assistant

### Configuring Home Assistant

I prefer to use HA with the Music Assistant. This way, you can integrate both your media library and internet radio and have a nice UI/UX at the same time (including a mobile app).

Generally, you need to have a supported HA (native) installation and follow [these steps](https://music-assistant.io/integration/installation/). I will place here a short version to have a reminder for future self

<details>
  <summary>Install instructions</summary>

| Step | Screenshot |
|------|------------|
| **Add SSH Addon** <br/> <br/> Navigate to Settings > Addons > Add Addon <br/> Search for SSH and install it. <br/> Enable `Show in sidebar` switch while you there | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/867a74db-7c50-472d-93da-d0e044818211)
| **Start SSH Addon** <br/> <br/> SSH addon won't start until you add at least one SSH public key to it. So navigate to SSH Addon Settings and add a key (or password) to the config <br/> It should be able to start now | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/962e6a8d-7f7f-41ba-8545-ac747099940f)
| **[Install Community Store](https://hacs.xyz/docs/setup/download/)** <br/> <br/> Run this command in the Terminal session <br> <code>wget -O - https://get.hacs.xyz &#124; bash -</code> <br/> You need to restart your HA after that | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/95eb9454-c7bf-43d2-b166-2a3dfd178479)
| **[Add HACS](https://hacs.xyz/docs/configuration/basic)** <br/> <br/> Navigate to Settings > Devices as Services > Integrations > Add Integration, search for HACS, and add it to the HA </br> You'll need to authorize your extension to your GitHub account | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/5ac72cee-a2f8-413f-9e26-b77f269c172c)
| **[Install Music Assistant via HACS](https://music-assistant.io/integration/installation/)** <br/> <br/> From the HACS menu, search for Music Assistant and press the Download button <br/> You need to restart HA again <br/> In the Settings > Addons, you should be able to see MA and enable sidebar navigation for it. | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/770c7087-fa02-4a08-9987-4b29eb8c06bd)
| **Configure Music Assistant** <br/> <br/> Before you enable Integration (that will in turn add speaker devices), you need to enable MA providers <br/> Go to MA > Settings > Providers and enable both Music providers and Player providers that interests you. If not sure, enable all of them; you can disable them later on. | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/562a5619-4925-4daa-9af4-1eb766f93ea0)
| **Add Music Assistant Integration** <br /> <br/> Navigate to HA Settings > Devices & services > Integrations. Click the big + ADD INTEGRATION button, look for Music Assistant, and click to add it. <br/> It should discover and add media devices based on the providers you're enabled in the previous step | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/3c2a0f95-5fdd-4513-b36d-3c662fc0f6fd)
| **Add Music Devices discovered by MA** <br/> <br/> You should be able to add and use discovered devices. More details in below sections | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/bbf91ed0-3c91-4555-8119-fa9b45deb0af) 

</details>
  
### Home Assistant: LMS or Airplay

[gh://sle118/squeezelite-esp32](https://github.com/sle118/squeezelite-esp32)

When you have squeezelite-esp32 installed on your Esparagus device (either stock or manually going through [steps](https://github.com/sonocotta/esparagus-media-center?tab=readme-ov-file#squeezelite-esp32)), it will announce itself by multiple protocols in the network:

- Bluetooth
- LMS or slimproto - auto-discovered by HA
- Apple AirPlay - auto-discovered by HA
- Spotify Connect

The power of this method is that you can use all four ways outside of HA, for example, using your smartphone and the Spotify app, and still have it integrated into HA at the same time.

<details>
  <summary>Install instructions</summary>
  
#### Native HA integration

Make sure your MA Slimproto provider is disabled; it will conflict with the native HA integration 

| Step | Screenshot |
|------|------------|
| **Add SlimProto Integration** <br/> <br/> Navigate to HA Settings > Devices & services > Integrations. Click the big + ADD INTEGRATION button, look for  SlimProto, and install it. | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/67c0efec-6774-404b-b63d-e13151025147)
| **Add HA MediaPlayers provider to MA** | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/f652a565-05a1-4143-9e78-60ba3830ba5c)

#### Integrate into Music Assistant directly 

Disable SlimProto integration in the HA if you want to go the MA way. If you enabled SlimProto and AirPlay providers in the MA, you should find your device as both a Slimproto device and an AirPlay device. It is up to you which protocol to use; generally, they both work perfectly well.

</details>

### Home Assistant: ESPHome

[Louder-ESP32 running ESPHome](https://www.espthings.io/index.php/2024/04/07/louder-esp32-a-hi-fi-class-d-audio-amplifier-running-esphome/)

Please find specific ESPHome configs in the [firmware](/firmware/esphome/) folder. It should be noted that generally esp-idf-based configurations are preferred over the Arduino counterparts, since they are lighter, faster, and more stable, which is important for audio streaming. However, many components do not work with esp-idf; thus, Arduino examples are also provided. Due to the complexity of the TAS5805M driver, it only exists in the esp-idf variant.

- [hifi-esparagus-arduino](/firmware/esphome/hifi-esparagus-arduino.yaml) and [hifi-esparagus-idf](/firmware/esphome/hifi-esparagus-idf.yaml) for HiFi-Esparagus
- [loud-esparagus-arduino](/firmware/esphome/loud-esparagus-arduino.yaml) and [loud-esparagus-idf](/firmware/esphome/loud-esparagus-idf.yaml) for Loud-Esparagus
- [amped-esparagus-arduino](/firmware/esphome/amped-esparagus-arduino.yaml) and [amped-esparagus-idf](/firmware/esphome/amped-esparagus-idf.yaml) for Amped-Esparagus
- [louder-esparagus-idf](/firmware/esphome/louder-esparagus-idf.yaml) for Louder-Esparagus

Also, experimental snapclient configs

- [hifi-esparagus-idf-snapclient](/firmware/esphome/hifi-esparagus-idf-snapclient.yaml)
- [loud-esparagus-idf-snapclient](/firmware/esphome/loud-esparagus-idf-snapclient.yaml)
- [amped-esparagus-idf-snapclient](/firmware/esphome/amped-esparagus-idf-snapclient.yaml)
- [louder-esparagus-idf-snapclient](/firmware/esphome/louder-esparagus-idf-snapclient.yaml)

<details>
  <summary>Install instructions</summary>

| Step | Screenshot |
|------|------------|
| **Add ESPHome Addon** <br/> <br/> Navigate to HA Settings > Addons > Add Addon <br/> Search for SSH and install it.  <br/> Enable `Show in sidebar` switch while you there | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/9d9d0a44-ba2a-491f-bff8-e1c08b8754e0)
| **Prepare Esparagus for ESPHome onboarding** <br/> <br/> Use [Web Flasher](https://web.esphome.io/?dashboard_wizard) to flash stock ESPHome into device | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/8ad222e8-d992-4a75-9a93-596d67ac8cb0)
| **Onboard Esparagus ESPHome device into HA** <br/> <br/> Go to the HA ESPHome page, and you should be able to find a new device. You need to onboard it with the below config (feel free to change names) <br/> This will take a moment or two | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/32b0c26a-3be1-4e15-b749-1176d46ff011)
| **Validate device in the ESPHome** | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/92df6029-c777-47ce-8ff9-debec70f7e05)
| **Add ESPHome Integration** <br /> <br/> Navigate to HA Settings > Devices & services > Integrations. Click the big + ADD INTEGRATION button, look for ESPHome, and click to add it. <br/> It should discover and add ESPHome media devices based on the previous step | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/c5d3bb12-8b07-4c49-a9e9-cdf2e6cad8ba)
| **Use your media device in the HA** | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/40067959-04ad-498c-a64d-4353e3f96228)
| **Use your media device in the MA** <br/> <br/> Add Music Assistant HA MediaPlayers provider to discover new Media device | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/6d19a972-83cf-4997-868c-1af0e4175c9b)

</details>

The latest changes in the ESPHome (deprecation of the custom components) triggered a work to implement an external [TAS5805M DAC ESPHome component](https://github.com/mrtoy-me/esphome-tas5805m). It took some time, but this driver implements a few very important features of the TAS5805M DAC that can not only be used in the device configuration but also in various automations and complex logic. Worth noting:

- Possibility to configure Analog Gain (depending on the power supply you have, more details [here](https://github.com/sonocotta/esp32-tas5805m-dac/#digital-volume-and-analog-gain)) | 
- Advanced digital volume configuration (set minimum, maximum, and step value)
- <img width="252" height="324" alt="image" src="https://github.com/user-attachments/assets/ea81f985-ef8d-48c7-8a52-b3d22d1eea2b" />
- Automatic powersave modes based on playback state
- DAC mode: 2 channel, or 1 channel bridged mode (more details [here](https://github.com/sonocotta/esp32-tas5805m-dac/#setting-and-getting-dac-mode))
- Mixer mode: MONO, STEREO, INVERTED, LEFT, RIGHT (more details [here](https://github.com/sonocotta/esp32-tas5805m-dac/#mixer-controls))
- My favorite: 15 band equalizer with [-15 dB .. +15 dB] range, which is an absolute treat to configure your speakers to your audio taste
- <img width="252" height="619" alt="image" src="https://github.com/user-attachments/assets/9400f057-3e42-441e-aa96-14f551bb9c3e" />
- For the first time: read and reset fault states, no need to reboot the device. Not only reports them back to HA, but also example of automatic correction is provided (slowly reduce volume on overheat)
- <img width="252" height="515" alt="image" src="https://github.com/user-attachments/assets/6863d353-dac2-40b3-8782-4747f04e729d" />

We have some plans for further development of the ESPHome driver, implementing subwoofer and satellite profiles (for 2.1 and bi-amp configs), enabling soft-clipping, and perhaps even unleashing the power of all BQ-parameters (to enable speaker-specific compensation of the DAC). Stay tuned!

### Home Assistant: Snapcast

Snapcast is a multi-room audio player that synchronizes playback across multiple devices, ensuring that audio streams play simultaneously in perfect sync. It consists of a server, which distributes audio streams, and clients, which receive and play the audio. There is a [snapcast](https://github.com/sonocotta/esparagus-snapclient) fork that was created to implement Esparagus-specific configuration on top of the ESP32 Snapcast client. This allows us to build flexible and extendable setups connected to various sources, like Mopidy, MPD, or Home Assistant. 

<details>
  <summary>Install instructions</summary>

| Step | Screenshot |
|------|------------|
| **[Flash Snapcast to the Esparagus board](https://sonocotta.github.io/esparagus-snapclient/)** using web-flashing tool <br/> |  ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/47600e5e-16bf-4f4e-b4a5-e5ea531b64fb)
| **Enable Snapcast in the MA** <br/> <br /> Got to the Ma and enable Snapcast provider. Your speaker will be discovered automatically, as long as it is running | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/ef87f8cf-3318-47c9-98b1-1a88ef4647b0)
| **Use your media device in the MA** <br/> <br/> Play your audio into new device | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/9bc81bee-c412-4e00-a8dd-f63f4a412bf0)
| **Use a group of speakers for multi-room setup** <br/><br/> In the MA settings > Players create a new group player and add as many Eparagus players as you need. Use that group speaker to get a synced audio | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/b371fb08-c900-451f-a1c9-35e25c8ae73b)

</details>

As of mid-2025 work is ongoing ([1](https://github.com/c-MM/esphome-snapclient/), [2](https://github.com/esphome/esphome/pull/8350)) to add snapcast component to ESPHome. This is based on the [original implementation](https://github.com/CarlosDerSeher/snapclient) done by CarlosDerSeher. This has the benefit of enabling all the DAC features implemented by the ESPHome driver. At the moment of writing, there are quite a few issues to be solved in the code before it can be merged, but having tested this myself on a few S3-based boards as long as Louder-Esparagus and Louder-ESP32 boards, I can say it is stable and works really well. Also
- This is the only implementation that works with ESP32-S3 (exciting!)
- This implementation allows using advanced TAS5805M DAC features available in the Esphome driver, like bridge mode and 15-band EQ. If you have Home Assistant already, that's no brainer

## Squeezelite-ESP32

Squeezelite-ESP32 is a multimedia software suite that started as a renderer (or player) of LMS (Lyrion Music Server, formerly Logitech Media Server). Now it is extended with 
- **Spotify** over-the-air player using SpotifyConnect (thanks to cspot)
- **AirPlay** controller (iPhone, iTunes ...) and enjoy synchronization multiroom as well (although it's AirPlay 1 only)
- Traditional **Bluetooth** device (iPhone, Android)

And LMS itself
- Streams your local music and connects to all major online music providers (Spotify, Deezer, Tidal, Qobuz) using Lyrion Music Server - a.k.a LMS with **multi-room** audio synchronization.
- LMS can be extended by numerous plugins and can be controlled using a Web browser or dedicated applications (iPhone, Android).
- It can also send audio to UPnP, Sonos, Chromecast, and AirPlay speakers/devices.

All Esparagus boards are tested with [Squeezelite-ESP32](https://github.com/sle118/squeezelite-esp32) software. It can be flashed using nothing but a web browser. You can use [Squeezelite-ESP32 installer](https://sle118.github.io/squeezelite-esp32-installer/) for that purpose.

### How to flash and configure

Use [Esparagus Squeezelite-ESP32 installer](https://sonocotta.github.io/esparagus-media-center/) to flash the firmware. It has been preconfigured to work with Esparagus boards and will configure all hardware automatically. 

<details>
  <summary>Install instructions</summary>

|   |   |
|---|---|
| Select correct device first | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/d5543eed-e6d6-4cb3-a1ca-c1de495bab6c)
| Connect the device to the USB port and select it from the list | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/dc508db5-0530-4d54-b078-a267aafc6698) ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/2e67cc5a-640d-4820-8dde-ca1c81f33e34)
| Press `Flash` and wait around 2 minutes  | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/04773ec8-f4b6-4186-9f9b-f0d6c52d4eaf)
| (Optional) You may enter the serial console to get more information, like device IP and boot logs | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/e74d3d5f-5c17-4d12-873a-058c3a753477)
| Device is in recovery mode. Connect to `squeezelite-299fac` wifi network with `squeezelite` password (your network name suffix will be different) | ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/2763663c-dbc9-4c71-af12-0a6fb9c2d94d) |
| When redirected to the captive portal let the device scan wifi network and provide valid credentials | <img src="https://github.com/sonocotta/esp32-audio-dock/assets/5459747/d2540ffb-d1d1-4441-a2b1-bbd6b8ad608f" width="30%" /> <img src="https://github.com/sonocotta/esp32-audio-dock/assets/5459747/b21f30e6-8899-46bc-b047-23281cae52b8" width="30%" /> <img src="https://github.com/sonocotta/esp32-audio-dock/assets/5459747/5dd1a1f6-0c6d-4045-b135-1d8cdd077161" width="30%" /> |
| You can use provided IP address (http://192.168.1.99/ on the screenshot) to access settings page |  ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/e3bbf910-1a5c-4c58-bd4e-c348ef0a91e5)
| (Optional) You may change device names to something close to your heart| ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/f3756d7e-7979-4347-a7af-3ca6320a3b83)
| Exit recovery | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/4b2b4a01-1bbf-4397-91f9-56f8192e7cba)
  
You can use it now
| Bluetooth  | Spotify Connect  | AirPlay | LMS Renderer  |
|---|---|---|---|
| ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/cd0e7cb2-4a15-48fc-b308-0281e414619e)| ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/edcb5a3b-bead-44d8-b51d-4c36ed19b7da)| ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/20586bb4-bc51-4cfb-802a-c6072987c1da)| ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/dfdb89dd-755b-42fe-a381-a92011f9c681)

</details>

### Squeezelite-esp32 Bug causing boot loop

Before version 1681, squeezelite-esp32 had a [bug](https://github.com/sle118/squeezelite-esp32/issues/414) that caused a boot loop with certain LMS servers when the RGB LED was used for visualizations. It seems to be fixed in 1681, but the quick workaround is to clear the `led_vu_config` NVS setting.

### Squeezelite-esp32 reboots and connection drops

The default configuration of the squeezelite-esp32 runs automatic discovery of the available LMS server nearby. In fact, it depends on it so much that in case the LMS service is not found on the network, it will reboot automatically (every few minutes). 

![image](https://github.com/user-attachments/assets/7b91f9ef-054e-42a1-81ab-693315fb3b88)

In many cases, if you use squeezelite for AirPlay and Spotify only and don't have an LMS server, you need to disable discovery altogether. Currently, disabling Squeezelite in the GUI does not work correctly; it places too many spaces between the commands in the autoexec command. Following `autoexec1` NVS setting can be used to disable it:

```
squeezelite -o i2s -s -disable -b 500:2000 -C 30 -d all=sdebug
```

![image](https://github.com/user-attachments/assets/6b4096bd-0793-458b-a0fe-3282418f773f)

## Hardware

|| Esparagus HiFi MediaLink  | Loud Esparagus  | Louder Esparagus | Amped Esparagus |
|---|---|---|---|---|
| Base variant | ![DSC_0711](https://github.com/sonocotta/esparagus-hifi-medialink/assets/98712315/66f565f3-7342-42aa-95e4-bad0437aa887) | ![DSC_0702](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/00d540a8-6dce-48dd-9d11-d70992451068) | ![DSC_0712 (copy 1)](https://github.com/user-attachments/assets/a408fe3c-f9d4-4b33-b587-3e6bedaa225f) | coming soon
| NOPD variant | NA | NA | ![image](https://github.com/user-attachments/assets/832d4c29-7e32-4073-b04d-3a0eea0355c1) | ![DSC_0033](https://github.com/user-attachments/assets/aff9b364-57e8-4f42-b7f4-aeee7e7a90fc)


Please visit the [hardware](/hardware/) section for board schematics and PCB designs. Note that PCBs are shared as multi-layer PDFs as well as Gerber archives.

### Boxed

| Esparagus HiFi MediaLink  | Loud Esparagus  | Louder Esparagus | Louder Esparagus NOPD | Amped Esapragus
|---|---|---|---|---|
| ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/c4765189-de0e-44bd-8163-b19ddd6f68d1) | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/8e2819a1-d496-456d-a180-b554787e6a0f) | ![DSC_0717 (copy 1) JPG-mh](https://github.com/sonocotta/esparagus-media-center/assets/5459747/905a0712-e43a-4fb9-b585-d95334cd98b3) | ![image](https://github.com/user-attachments/assets/cedf9854-5952-47f1-96fc-2826b6fd9815) | ![image](https://github.com/user-attachments/assets/b6994a4d-4d38-48c5-a6a8-65f735ad2659)


### PCB

| Esparagus HiFi MediaLink  | Loud Esparagus  | Louder Esparagus | Amped Esparagus
|---|---|---|---|
| ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/d56ff3b7-633c-4f67-a82f-5084cfeb4144) | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/f355598b-bf33-43a8-87a1-130de3d1e3b2) | ![DSC_0712 (copy 1) JPG-mh (1)](https://github.com/sonocotta/esparagus-media-center/assets/5459747/a14e9af8-f835-4d23-9772-84217a39a5ec) | ![image](https://github.com/user-attachments/assets/8d4b40c4-b86d-4fa6-834b-d453d9c81f94)

### BTL and PBTL mode (TAS5805M DAC)

[TAS5805M DAC](https://www.ti.com/lit/ds/symlink/tas5805m.pdf?ts=1701767947387) Allows 2 modes of operation - BTL (stereo) and PBTL (parallel, or mono). In Mono amp will use a completely different modulation scheme and basically will fully synchronize output drivers. Jumpers on the board allow both output drivers to connect to the same speaker. The most important step is to inform the Amp to change modulation in the first place via I2C comman. In the case of sqeezelite DAC controlsset value is the following:
```
dac_controlset: `{"init":[{"reg":3,"val":2},{"reg":3,"val":3},{"reg":2,"val":4}],"poweron":[{"reg":3,"val":3}],"poweroff":[{"reg":3,"val":0}]}`
```
compared to default:
```
dac_controlset: `{"init":[{"reg":3,"val":2},{"reg":3,"val":3}],"poweron":[{"reg":3,"val":3}],"poweroff":[{"reg":3,"val":0}]}`

```

One can test audio with a single speaker connected between the L and R terminals (plus on one side and minus on the other). Optionally, jumpers on the board will effectively connect the second driver in parallel, doubling the current capability.

Important point, this will send only one channel to the output, that’s just how the DAC works. True mono as (L+R)/2 is possible via more in-depth configuration (very poorly documented), but I haven’t managed to configure that on the stand. I’m still working on that. (Along with a few more really cool DSP features that this DAC has, like EQ, subwoofer mode, and tone compensation settings)

|  | BTL | PBTL |
|---|---|---|
| Descriotion | Bridge Tied Load, Stereo | Parallel Bridge Tied Load, Mono |
| Rated Power | 2×23W (8-Ω, 21 V, THD+N=1%) | 45W (4-Ω, 21 V, THD+N=1%) |
| Schematics | ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/e7ada8c0-c906-4c08-ae99-be9dfe907574) | ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/55f5315a-03eb-47c8-9aea-51e3eb3757fe)
| Speaker Connection | ![image](https://github.com/user-attachments/assets/6f6542c6-8e7f-4cc1-b306-1ffdd5f6a90c) | ![image](https://github.com/user-attachments/assets/476fdd80-be47-419d-931b-49d33ecc3abe)


Starting from Rev E, an additional header is exposed to allow datasheet-specified connectivity

| Image  | Legend  |
|---|---|
| Stereo Mode - leave open | ![image](https://github.com/user-attachments/assets/c99137a1-c04b-46c3-bc47-9b269bd905ca) |
| Mono (PBTL) Mode, close horisontally | ![image](https://github.com/user-attachments/assets/0b724400-877e-4faa-be5b-610cc5df055b)

### TAS5805M DSP capabilities

The TAS5805M DAC has a very powerful DSP, which allows doing lots of data processing on the silicon, that otherwise would take a considerable part of your CPU time. As of the moment of writing, it is mostly an undiscovered part of the DAC, since unfortunately, TI is not making it very easy for developers. (A minute of complaint) To be more specific, you need to be (A) a proven hardware manufacturer to get access to the configuration software, namely PurePath. (B) You need to apply for a personal license and go through an approval process, and after a few weeks of waiting, you get access to the DAC configuration you asked for. (C) You find out that it will work with TI's own evaluation board, which will set you back $250 if you are able to find one. Otherwise, all you have is a list of I2C commands that you need to transfer to the device at your own cost. No wonder no one knows how to use it.

But moanings aside, what do you get after:

- Flexible input mixer with gain corrections
- 15 EQ with numerous filter configurations
- 3-band Dynamic Range Compression with flexible curve configuration
- Automatic Gain Limiter with flexible configuration
- Soft clipper
- and a few other things

At this moment, it is very experimental. In the perfect world, you should be able to adjust all of those settings to make your speaker-enclosure setup work the best it can, and even apply your room factors into the equation. But with the above disclaimer, I can only delivera  limited set of configurations corresponding to the most common use cases:

- Stereo mode with enabled DRC (Loudness) and AGL settings
- Full range Mono mode with DRC (Loudness) and AGL settings
- Subwoofer Mono mode with a few filter frequency options
- Bi-Amp configuration with a few crossover frequency options

All of the above are available right now for experimentation. I'm keen to hear your feedback while I move forward with porting this to other software options

- [X] - Bare [I2S TAS5805M library](https://github.com/sonocotta/esp32-tas5805m-dac)
- [X] - [espragus-snapclient](https://sonocotta.github.io/esparagus-snapclient/) software (You may use Louder-ESP32 firmware for the Louder-Esparagus)
- [ ] - [squeezelite-esp32](https://sonocotta.github.io/esp32-audio-dock/) <- to do
- [ ] - flexible configurations with on-the-fly configuration changes


### Louder and Amped Esparagus power considerations

The Louder and Amped Espragus can be quite power-hungry devices; simply using 5V over the USB-C is clearly not an option. The intention for using a PD-enabled power adapter to run the board is simplicity and ease of use for customers. Ideally, you should supply a 20V 3.25 Amp capable power source, which is common for modern laptops (Dell, HP, and Lenovo have all tested and work perfectly). However, pretty much any 9V/12V/20V PD-enabled power adapter will work, most typically phone chargers with a quick charge option. The smallest of the family is a 25W model, which is plenty enough for a living space.

The interesting part was all the phone and laptop chargers I used for the test (around five different makes of each), which sounded great, with no hissing, no popping. (Apart from the Apple ones, they didn’t work. Likely, they have an Apple-specific PD protocol). This is probably because modern devices have become so noise-sensitive that manufacturers have been forced to do good work on noise levels.

<details>
  <summary>Tested and perfectly working models are (others may be available)</summary>

| Model   | Image   |
|-------------------------------|---------------------------------|
| [65W USB-C Lenovo ThinkPad Laptop Charger Replacement Power Adapter](https://www.aliexpress.com/item/1005005994445557.html)  | ![image](https://github.com/sonocotta/orange-pi-media-center/assets/5459747/27614db3-de35-4054-8450-9845a09f6381)
| [65W 45W 20V 3.25A Type-C PD Laptop Charger](https://www.aliexpress.com/item/1005006086701848.html) | ![image](https://github.com/sonocotta/orange-pi-media-center/assets/5459747/266a9bed-dde5-4869-aa31-84176b0a6608)
| [Belkin BoostCharge Pro 65W Dual USB-C GaN Wall Charger, Multi-Port Charger w/ 2X USB-C PD 3.0](https://www.amazon.com/Belkin-BoostCharge-Charger-Multi-Port-MacBook/dp/B0BQH9L44B/?th=1)<br/> (Reported by customer, not tested myself) | ![image](https://github.com/user-attachments/assets/674eb4f8-da6a-4649-83d6-c69bd6680571)
| [120W Gan Type-C PD Charger](https://www.aliexpress.com/item/1005006806666186.html) | ![image](https://github.com/sonocotta/orange-pi-media-center/assets/5459747/f42d4c8c-879b-494c-ac18-dd18ace322e7)
| [45W Type-C PD Mobile Phone Wall Adapter](https://www.aliexpress.com/item/1005006713008533.html) | ![image](https://github.com/sonocotta/orange-pi-media-center/assets/5459747/110bb6f9-7014-4dfc-8fd8-3bc99b269e9c)

</details>

<details>
  <summary>Tested, but NOT wroking</summary>

| Model   | Image   |
|-------------------------------|---------------------------------|
| [Amazon Basics 65W One-Port GaN USB-C Wall Charger with Power Delivery PD for Laptops, Tablets & Phones](https://www.amazon.com/AmazonBasics-One-Port-Charger-Laptops-Delivery/dp/B087MFLLCR?th=1)  | ![image](https://github.com/user-attachments/assets/6d2d5819-f933-4e27-9562-6728635fa788)

</details>

Because USB-PD is a bit of the Wild West in terms of standards, sometimes not everything goes as designed. Some people have run into this with power adapters that aren’t fully PD-standard compliant. In most cases, the worst that happens is the PD chip doesn’t trigger the 20V mode, so the Esparagus runs at around 5W per channel (which you might not even notice). One person reported that an older adapter somehow triggered just 1V on the USB-C power line, shutting down the Esparagus shortly after plugging in. Thankfully, we’ve confirmed that it works correctly with newer laptop adapters.

#### Louder and Amped Esparagus NOPD

The “hammer-style” solution I came up with is a new NOPD version of the Louder Esparagus that lets you use a barrel power jack to supply raw voltage directly. The catch? Standard 2mm pins can’t handle high currents, so I’ve gone with a 2.5mm pin instead — it’s a bit unusual but still common enough in the laptop world.

![image](https://github.com/user-attachments/assets/59acba9e-b447-4724-a6a1-bf777f053787)

With this setup, you can supply more than the 20V limit of PD, giving you a bit more power for the speakers. You probably won’t hear much difference (thanks to the way human hearing works), but it could help larger speakers that need a bit more to really “open up." Other than that, the NOPD version works just like the PD version — no software changes are needed.

#### Louder and Amped Esparagus DUAL

In May 2025, I came up with a power mux schematic that is designed to automatically switch between an external power source and a UCB-PD-enabled power source, depending on which one provides higher voltage. So you can either use an external power adapter over the barrel jack and use USB-C for programming and debugging, or simply use USB-C for both power and data. 

![DSC_0003](https://github.com/user-attachments/assets/f891e126-1cba-4af1-99d2-2f299a820316)

This eliminates the need for PD and NOPD revisions, so I will slowly replace all products with a single DUAL option.

Because of the limited space on the back panel, I moved the IR reader and RGB LEDs (now eight of them) to the front panel, offering a semi-transparent optional panel, in case you're planning to use them.

#### External voltage selection

The power adapter specs depend on the speaker you're planning to use. DAC efficiency is close to 100%, so just take the power rating of your speaker (say 2x10w), and impedance (say 8 ohms), and you'd need at least `sqrt(10W * 8Ω) ≈ 9V` rated at `9V / 8Ω ≈ 1.2A` per channel, round up to 3 total Amps. 

It is not recommended to go beyond the voltage your speakers can handle; otherwise, the amp will blow your speakers in no time. 

The absolute maximum voltage for the TAS5805M DAc is 30V, but it is not guaranteed to be thermally stable in this condition. 

### Speakers selection

When choosing speakers, focus on realistic power ratings rather than the often-inflated numbers printed on labels.

A good reference point is 10 watts at 1% THD (Total Harmonic Distortion) — this provides clean, pleasant audio without noticeable distortion. Many manufacturers, however, market their speakers based on higher distortion levels or theoretical peaks:
	•	Nominal Power (e.g., 20W) — This is often measured at around 10% THD, which produces harsh, phone-like distortion.
	•	Rated or “Maximum” Power (e.g., 40W) — The level a speaker can handle continuously, but without limiting distortion; sound quality is not measured. It is simply a scenario where speaker is used as a room heater.
	•	Peak Power (e.g., 80–100W) — The absolute maximum a speaker can withstand for a very short burst (milliseconds), not suitable for sustained playback.

In short, when a speaker claims “100W,” it typically translates to about 10W of clean, listenable power in real use. Always prioritize low-distortion ratings over inflated wattage numbers for the best listening experience.

### OLED screen (soldered in)

All boards have an OLED screen header. Originally, I had plans to have it as a feature (It is quite nice when using squeezelite since you can get quite a lot with existing plugins and settings). Later on, I disregarded this as a generally available feature, since it is quite a time-consuming task to solder it in place, and I had no really good idea how to fix the screen in place. Despite that, the header is present on every board revision, and it works. 

At this moment, one can solder the compatible OLED screen and use it with the transparent front panel as a bedside clock or to display the current track (I prefer smoked glass for the final look). It takes a few minutes for a skilled engineer to solder it in place and a small strap of double-sided adhesive to fix it mechanically.

| A | B | C |
|---|---|---|
| ![DSC_0107](https://github.com/user-attachments/assets/74b72617-f7c8-4e7c-8f39-96c83af6af6f) | ![DSC_0109](https://github.com/user-attachments/assets/cd55ecc0-f884-4a85-827e-e0dea42fe750) | ![DSC_0111](https://github.com/user-attachments/assets/697ca174-d1ab-4376-8fbc-f7fa966cfd18)

The final result is a nice and finished look

![DSC_0101](https://github.com/user-attachments/assets/1404f035-0554-4969-87dd-745ff6022150)

#### OLED models

Most of the 64x128 pixel OLED screen models that are very common among hobbyists will use a compatible 30-pin ribbon connector with 0.7mm pin spacing, and they are really easy to desolder.

![image](https://github.com/user-attachments/assets/711c8085-8d32-48c6-a58e-6f68809e8b97)

You can also find bare screens if you spend a minute. Below are the tested models, although there are plenty more out there.

|  Model | Image |
|---|---|
| [0.96" OLED Display 128X64 SSD1306](https://www.aliexpress.com/item/1005001836449023.html) |  ![image](https://github.com/user-attachments/assets/815ce45e-8413-4455-bb7f-8f6c2651a1e2)
| [1.3" OLED Display 128X64 SH1106](https://www.aliexpress.com/item/1005001836449023.html) | ![image](https://github.com/user-attachments/assets/bb228e84-07ab-45b5-af5b-ecae94656be8)

### OLED screen (solder-less)

Starting May 2025, all boards (starting from DUAL revision) will have an OLED screen with a solder-less connector. I managed to find the right model of the screen and corresponding connector for a reasonable price, and decided to equip every board with the connector as standard. 

At this moment, one can simply throw in a compatible OLED screen and use a small strap of double-sided adhesive to fix it mechanically. The final result is a nice and finished look

| A | B | C |
|---|---|---|
| ![DSC_0011](https://github.com/user-attachments/assets/8f3f9045-7118-4043-a2d6-95db5f193ad2) | ![DSC_0013](https://github.com/user-attachments/assets/037fd177-e650-485d-a47e-e9e37ad62bd9) | ![DSC_0014](https://github.com/user-attachments/assets/798fc8c8-d7bc-4c0b-86a4-35c69bc1ecc0)

The final result is a nice and finished look

![DSC_0009](https://github.com/user-attachments/assets/3584eecb-4c9e-44ab-9c3c-126e3abb49c2)

I admit, mechanically it might be a challenge to secure it in place the right way, and I'm looking for a better solution.

#### OLED models

Most of the 64x128 pixel OLED screen models that are very common among hobbyists will use a compatible 30-pin ribbon connector with 0.5mm pin spacing, and they are really easy to find.

|  Model | Image |
|---|---|
| [1.3" OLED Screen 128x64 SH1106 30Pin](https://www.aliexpress.com/item/1005003801387081.html) | ![image](https://github.com/user-attachments/assets/78b44c8d-484a-4c07-9f9f-fb1f86689fac)

#### Software side

Although you're free to use it your way, using the pinout above, I'd expect the most common case to be squeezelite, thus here are the steps you'd need to do

| # | Description | Image |
|---|---|---|
| 1 | Update NVS settings in the Web UI (switch to recovery mode first) <br/> `display_config` = `SPI,width=128,height=64,cs=15,reset=32,driver=SH1106,HFlip,VFlip` <br/> `spi_config` = `mosi=23,clk=18,host=2,miso=19,dc=4` <br/> You may need to replace `SH1106` with `SSD1306` depending on your model. | ![image](https://github.com/user-attachments/assets/f42af7a5-2fda-42b4-80b6-4ca025bac29b)
| 2 | In the LMS settings install the `SqueezeESP32` plugin | ![image](https://github.com/user-attachments/assets/5e32f271-cb66-4ea4-8a94-aaf1d0a73c5e)
| 3 | Update each speaker's settings in the LMS, and navigate to `Display` settings | ![image](https://github.com/user-attachments/assets/ac970067-8b98-4294-af9a-80d0274e0558)

### Audio Brick details

<img width="2210" height="1268" alt="image" src="https://github.com/user-attachments/assets/a24bc2ea-3867-4b77-80f6-911833c483cd" />

The Audio Brick is designed with a DIN-rail mount option, making it suitable not only for hobby projects but also for structured and semi-industrial installations. By mounting directly in an electrical cabinet or distribution box, it becomes easy to wire, power, and manage multiple units in a clean and reliable way. Since each device drives two channels, you can scale simply by adding more Bricks — one per room, per zone, or per speaker as needed. This modular approach makes it practical for whole-home or even small commercial audio installs where consistency and neat wiring matter. 

For added convenience, it will use plug-in connector pairs (not yet on the prototype), which simplify installation and allow quick replacement in case of maintenance or failure.

### Relay Driver

The early design of the Esparagus series has an internal driver for external relays. It has a back-facing diode to shunt any coil-inducted currents. Driver is an open-drain output with the following states

<details>
  <summary>More details</summary>

| Driver Pin State (IO21)  | Output state  | Relay connected between OUT and +5V |
|---|---|---|
| Floating (pulled low with 100K resistor) or <br/> LOW | High impedance | INACTIVE (switched OFF)
| HIGH | Pulled to GND | ACTIVE (switched ON)

Schematics:
![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/4f2aa313-a15f-4b43-957d-2c32ad6c8755)

External relay can be connected directly between OUT and +5V pins (1st and 3rd pins, mid pin being GND)

</details>

### Errata

- [CH340C 5V level issue](/errata/ch340c-5v-level-issus.md)

## Where to buy

You may support our work by ordering this product at Tindie
- HiFi Esparagus at [Tindie](https://www.tindie.com/products/sonocotta/esparagus-hifi-medialink/) and [Elecrow](https://www.elecrow.com/hifi-esparagus.html)
- [Loud Esparagus](https://www.tindie.com/products/sonocotta/loud-esparagus-media-center/)
- Louder Esparagus at [Tindie](https://www.tindie.com/products/sonocotta/louder-esparagus-media-center/) and [Elecrow](https://www.elecrow.com/louder-esparagus-media-center.html)
- [Amped Esparagus](https://www.tindie.com/products/sonocotta/amped-esparagus-media-center/) 
