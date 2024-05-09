# Esparagus Media Center

![Open Source Hardware](/images/open-source-hardware-logo.png)
![Open Source Software](/images/open-source-software-logo.png)

![DSC_0724](https://github.com/sonocotta/esparagus-media-center/assets/5459747/a4294682-0a17-4e0d-a833-5988d88172b6)

Esparagus Media Center is a series of ESP32-based media center devices. They all run [Squeezelite-ESP32](https://github.com/sle118/squeezelite-esp32) software and have similar media capabilities, but are aimed at different use cases. They share a similar look, and compared to my earlier designs, they have a great-looking aluminum case.

Our [Crowd Supply campaign](https://www.crowdsupply.com/sonocotta/esparagus-media-center) for backing the manufacturing of Esparagus series boards is currently underway. If you have any interest, please consider subscribing to receive updates on the campaign.

## Table of Contents

- [Esparagus Media Center](#esparagus-media-center)
  - [Why Esparagus](#why-esparagus)
  - [Motivation](#motivation)
  - [Esparagus HiFi MediaLink](#esparagus-hifi-medialink)
  - [Loud Esparagus](#loud-esparagus)
  - [Louder Esparagus](#louder-esparagus)
  - [Features](#features)
    - [Onboard PSRAM](#onboard-psram)
  - [Board Pinout](#board-pinout)
    - [Common to every board](#common-to-every-board)
    - [Peripheral (Loud Esparagus \& Esparagus HiFi MediaLink )](#peripheral-loud-esparagus--esparagus-hifi-medialink-)
    - [TAS5805M DAC (Louder Esparagus)](#tas5805m-dac-louder-esparagus)
    - [Peripheral - OLED Screen and W5500 Ethernet (Louder Esparagus)](#peripheral---oled-screen-and-w5500-ethernet-louder-esparagus)
    - [Other Peripheral (Louder Esparagus)](#other-peripheral-louder-esparagus)
  - [Software samples](#software-samples)
    - [Platformio IDE](#platformio-ide)
  - [Arduino IDE](#arduino-ide)
  - [Squeezelite-ESP32](#squeezelite-esp32)
    - [How to flash and configure](#how-to-flash-and-configure)
  - [Hardware](#hardware)
    - [Boxed](#boxed)
    - [PCB](#pcb)
    - [Relay Driver](#relay-driver)
  - [Where to buy](#where-to-buy)


## Why Esparagus

ChatGPT made me call it that way. I only asked if there is a fruit or vegetable that is phonetically close to ESP32, which is the heart of this device.

## Motivation

I did few audio projects in the past, some using [ESP32](https://hackaday.io/project/173620-loud-esp), some using larger [Orange Pi](https://hackaday.io/project/191936-orange-pi-home-media-center) and [Raspberry Pi](https://hackaday.io/project/162373-orangepi-zero-pulse-music-server-using-i2s-dac) devices. Each has its pros and cons, and with each iteration, I'm trying to focus on the details that were working best for me, while actually using them. 

What I like about ESP32 is how lightweight it is. It barely draws power, so you may not care to turn it off at all. It boots in seconds and is ready for use in a snap. Still, it is capable and works at par with Linux SBC solutions for audio applications, while costing a fraction of their price. Combined with a proper Hi-Fi DAC you would not tell a difference to commercial devices standing side by side and costing much more.

Over the last few years, I have seen a few amazing software products created to deliver audio on the ESP32, like [squeezelite-esp32](https://github.com/sle118/squeezelite-esp32) or  [euphonium](https://github.com/muvox-io/euphonium). Esparagus media center devices are designed specifically to run these great pieces of software and bring a new life into aging audio equipment that most of us have at home but do not use that much these days, since it is not working with Spotify and the family.

## Esparagus HiFi MediaLink

Esparagus HiFi MediaLink is a handy low-cost media device that will upgrade your legacy audio system with cutting-edge internet streaming capabilities and enhance your audio experience. It exposes line-level output that you can plug into a stereo amplifier. It uses the legendary PCM51 series DAC with supreme audio quality.

![DSC_0702](https://github.com/sonocotta/esparagus-hifi-medialink/assets/98712315/3ef311c6-2fbc-4969-aa99-4fed7e1e1dd5)

## Loud Esparagus

Loud Esparagus is aimed to be paired with small-to-medium-sized speakers in a small room. It uses a dual MAX98357 Hi-Fi DAC that will output 3W per speaker. Admittedly not much, but well enough for a kid's room or workplace. Due to the D-class amp, it barely uses power and can be paired with a standard USB wall charger.   

![DSC_0689](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/7635cb2a-6ef1-43e8-8396-c27ef5387a25)

## Louder Esparagus

Louder Esparagus is a top-of-the-range model that uses modern highly capable TAS5805M DAC and is aimed to be paired with medium-to-large speaker systems. With 25W per channel stereo output, it packs a punch and can easily enlive living quarters or dorm rooms. It is highly efficient, but much more demanding for power when cranked, therefore it uses USB-C Power Delivery to pull up to 65W from the wall power adapter. It can be used both with Wi-Fi and Ethernet (to make sure bad Wi-Fi would not interrupt the stream)

![DSC_0719](https://github.com/sonocotta/esparagus-media-center/assets/5459747/acca2da1-a52f-4d44-b1a7-9d6dc896c549)

## Features

|             | [Hifi ESP](https://github.com/sonocotta/esp32-audio-dock) | Esparagus HiFi MediaLink | [Loud ESP](https://github.com/sonocotta/loud-esp)  | Loud Esparagus | [Louder ESP](https://github.com/sonocotta/esp32-audio-dock)  | Louder Esparagus
|-------------|------------------------|-----------------------|------------------------|-----------------------|------------------------|-----------------------|
| Image       | ![image](https://user-images.githubusercontent.com/5459747/225272052-c36d5b87-1b9a-439c-be69-94077135e72a.png)  | ![DSC_0709](https://github.com/sonocotta/esparagus-hifi-medialink/assets/98712315/ea45f1d2-32b5-4f12-a63c-a8e403cb22db) | ![image](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/b9182b50-9d52-430b-878c-d82052e43e84) | ![DSC_0706](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/2556b8ff-1827-4e03-8e28-31e40199943c) | ![image](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/60da6a3f-422d-4fea-b6ff-7a0423c12543) | ![DSC_0713](https://github.com/sonocotta/esparagus-media-center/assets/5459747/14d54647-2b7e-4b1a-9a8e-135a1598eb02)
| Docks with  | ESP32 Mini Module           | ESP32-WROVER Module Onboard  | ESP32 Mini Module           | ESP32-WROVER Module Onboard  | ESP32 Mini Module           | ESP32-WROVER Module Onboard  |
| DAC         | [PCM5100A](https://www.ti.com/product/PCM5100A) 32bit Stereo DAC | [PCM5100A](https://www.ti.com/product/PCM5100A) 32bit Stereo DAC <br/> -100 dB typical noise level | Dual I2S DAC ([MAX98357](https://www.analog.com/en/products/max98357a.html)) with built in D-Class amp |Dual I2S DAC ([MAX98357](https://www.analog.com/en/products/max98357a.html)) with built in D-Class amp | Stereo I2S DAC ([TAS5805M](https://www.ti.com/product/TAS5805M)) with   built in D-Class amp | Stereo I2S DAC ([TAS5805M](https://www.ti.com/product/TAS5805M)) with   built in D-Class amp |
| Power | 3x [LP5907](https://www.ti.com/lit/ds/symlink/lp5907.pdf) 3.3 V Ultra-Low-Noise LDO | 3x [LP5907](https://www.ti.com/lit/ds/symlink/lp5907.pdf) 3.3 V Ultra-Low-Noise LDO | 5V from Mini-USB | 5V from USB-C | Up to 26V from external PSU | Up to 20V from USB-C PD 
| Output      | 2.1 VRMS Line-level stereo output 3.5mm jack | 2.1 VRMS Line-level stereo output 3.5mm jack | 2x 3W  | 2x 3W  | 2x 23W at 22V Vin  | 2x 22W at 20V over USB-PD
| PSRAM       | 8MB PSRAM (4MB usable)      | 8MB PSRAM (4MB usable) Onboard <br/> | 8MB PSRAM (4MB usable)      | 8MB PSRAM (4MB usable) Onboard <br/> | 8MB PSRAM (4MB usable)      | 8MB PSRAM (4MB usable) Onboard <br/>
| Peripheral        |  |  External WiFi Antenna <br/> WS2812B RGB Led <br/> SSD1306 128x64 OLED screen (optional) | |  External WiFi Antenna <br/> WS2812B RGB Led <br/> SSD1306 128x64 OLED screen (optional) |  |  External WiFi Antenna <br/> WS2812B RGB Led <br/> SSD1306 128x64 OLED screen (optional), IR receiver, W5500 SPI LAN |
| Size | | 80 x 50 x 20mm  | | 80 x 50 x 20mm | | 100 x 80 x 38mm |

### Onboard PSRAM

Audio streaming requires proper buffering to work, even with ESP32 500K of RAM it is a challenging task. All Esparagus boards are based on WROVER modules that have an onboard PSRAM chip.

## Board Pinout

### Common to every board

|       | I2S CLK | I2S DATA | I2S WS | PSRAM CE | PSRAM CLK |
|-------|---------|----------|--------|----------|-----------|
| ESP32 | 26      | 22       | 25     | 16       | 17        |

### Peripheral (Loud Esparagus & Esparagus HiFi MediaLink )

|       | SPI HOST| SPI CLK  |SPI MOSI| SPI MISO | OLED DC   | OLED CS   | OLED RST  |  WS2812 RGB LED |  RELAY EN |
|-------|---------|----------|--------|----------|-----------|-----------|-----------|---------|----------|
| ESP32 |    2    |  18      |  23    |   19     |   4       | 5         | 32        |     33  |  21      |


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

## Software samples

In the [software](/firmware) section two firmware examples are provided.

- [esp32-i2s-bare](/firmware/esp32-i2s-bare/) is base I2S implementation based on ESP-IDF implementation directly.
- [esp32-i2s-esp8266audio](/firmware/esp32-i2s-esp8266audio/) is based on excellent [ESP8266Audio](https://github.com/earlephilhower/ESP8266Audio) library (it works with the whole ESP range, don't get fooled by the name), providing minimum code implementation. 
- [esp32-i2s-web-radio](/firmware/esp32-i2s-web-radio/) is based on the [same library](https://github.com/earlephilhower/ESP8266Audio), providing minimum web-readio stream player. It expects a playlist as an input in the 'data' folder. 

### Platformio IDE
 
All samples are provided as [Plarformio IDE](https://platformio.org/platformio-ide) projects. After installing it, open the sample project. Select the proper environment based on your dock. Run the `Build` and `Upload` commands to install necessary tools and libraries, and build and upload the project to the board. Communication and proper upload method selection will be handled by IDE automatically. 

## Arduino IDE

Follow the [ESP8266Audio](https://github.com/earlephilhower/ESP8266Audio) library guide.

## Squeezelite-ESP32

Squeezelite-ESP32 is a multimedia software suite, that started as a renderer (or player) of LMS (Logitech Media Server). Now it is extended with 
- **Spotify** over-the-air player using SpotifyConnect (thanks to cspot)
- **AirPlay** controller (iPhone, iTunes ...) and enjoy synchronization multiroom as well (although it's AirPlay 1 only)
- Traditional **Bluetooth** device (iPhone, Android)

And LMS itself
- Streams your local music and connects to all major online music providers (Spotify, Deezer, Tidal, Qobuz) using Logitech Media Server - a.k.a LMS with **multi-room** audio synchronization.
- LMS can be extended by numerous plugins and can be controlled using a Web browser or dedicated applications (iPhone, Android).
- It can also send audio to UPnP, Sonos, Chromecast, and AirPlay speakers/devices.

All Esparagus boards are tested with [Squeezelite-ESP32](https://github.com/sle118/squeezelite-esp32) software. It can be flashed using nothing but a web browser. You can use [Squeezelite-ESP32 installer](https://sle118.github.io/squeezelite-esp32-installer/) for that purpose.

### How to flash and configure

Use [Esparagus Squeezelite-ESP32 installer](https://sonocotta.github.io/esparagus-media-center/) to flash the firmware. It has been preconfigured to work with Esparagus boards and will configure all hardware automatically. 

|   |   |
|---|---|
| Select correct device first | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/d5543eed-e6d6-4cb3-a1ca-c1de495bab6c)
| Connect the device to USB port and select it from the list | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/dc508db5-0530-4d54-b078-a267aafc6698) ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/2e67cc5a-640d-4820-8dde-ca1c81f33e34)
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


## Hardware

| Esparagus HiFi MediaLink  | Loud Esparagus  | Louder Esparagus |
|---|---|---|
| ![DSC_0711](https://github.com/sonocotta/esparagus-hifi-medialink/assets/98712315/66f565f3-7342-42aa-95e4-bad0437aa887) | ![DSC_0702](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/00d540a8-6dce-48dd-9d11-d70992451068) | ![DSC_0710](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/dce0c088-fa0c-4637-a719-b067daeff998)

Please visit [hardware](/hardware/) section for board schematics and PCB designs. Note that PCBs are shared as multi-layer PDFs as well as Gerber archives.

### Boxed

| Esparagus HiFi MediaLink  | Loud Esparagus  | Louder Esparagus |
|---|---|---|
| ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/c4765189-de0e-44bd-8163-b19ddd6f68d1) | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/8e2819a1-d496-456d-a180-b554787e6a0f) | ![DSC_0717 (copy 1) JPG-mh](https://github.com/sonocotta/esparagus-media-center/assets/5459747/905a0712-e43a-4fb9-b585-d95334cd98b3)

### PCB

| Esparagus HiFi MediaLink  | Loud Esparagus  | Louder Esparagus |
|---|---|---|
| ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/d56ff3b7-633c-4f67-a82f-5084cfeb4144) | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/f355598b-bf33-43a8-87a1-130de3d1e3b2) | ![DSC_0712 (copy 1) JPG-mh (1)](https://github.com/sonocotta/esparagus-media-center/assets/5459747/a14e9af8-f835-4d23-9772-84217a39a5ec)

### Relay Driver

Some boards of the Esparagus series have internal drivers for external relays. It has a back-facing diode to shunt any coil-inducted currents. Driver is an open-drain output with the following states

| Driver Pin State (IO21)  | Output state  | Relay connected between OUT and +5V |
|---|---|---|
| Floating (pulled low with 100K resistor) or <br/> LOW | High impedance | INACTIVE (switched OFF)
| HIGH | Pulled to GND | ACTIVE (switched ON)

Schematics:
![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/4f2aa313-a15f-4b43-957d-2c32ad6c8755)

External relay can be connected directly between OUT and +5V pins (1st and 3rd pins, mid pin being GND)

## Where to buy

You may support our work by ordering this product at Tindie
- [Esparagus HiFi MediaLink](https://www.tindie.com/products/sonocotta/esparagus-hifi-medialink/)
- [Loud Esparagus](https://www.tindie.com/products/sonocotta/loud-esparagus-media-center/)
- [Louder Esparagus](https://www.crowdsupply.com/sonocotta/esparagus-media-center) (coming soon)
