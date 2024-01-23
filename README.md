# Esparagus Media Center

![Open Source Hardware](/images/open-source-hardware-logo.png)
![Open Source Software](/images/open-source-software-logo.png)

Esparagus Media Center is a series of ESP32 based media center devices. They all run [Squeezelite-ESP32](https://github.com/sle118/squeezelite-esp32) software and have similar media capabilities, but aimed at different use cases. They share a similar look, and compared to my earlier designs, they have a great looking aluminum case.

## Why Esparagus

ChatGPT made me call it that way. I only asked if there is a fruit or vegetable that is phonetically close to ESP32, which is the heart of this device.

## Motivation

I did few audio projects in the past, some using [ESP32](https://hackaday.io/project/173620-loud-esp), some using larger [Orange Pi](https://hackaday.io/project/191936-orange-pi-home-media-center) and [Raspberry Pi](https://hackaday.io/project/162373-orangepi-zero-pulse-music-server-using-i2s-dac) devices. Each has its pros and cons, and each iteration I'm trying to focus on the details that were working best for me, while actually using them. 

What I like about ESP32 is how lightweight it is. It barely draws power, so you may not care to turn it off at all. It boots in seconds and is ready for use in a snap. Still it is capable and works at par with Linux SBC solutions for audio applications, while costing a fraction of their price. Combined with proper Hi-Fi DAC you would not tell a difference to commercial devices standing side by side and costing much more.

Over last few years I see few amazing software products created to deliver audio on the ESP32, like [squeezelite-esp32](https://github.com/sle118/squeezelite-esp32) or  [euphonium](https://github.com/muvox-io/euphonium). Esparagus media center devices are designed specifically to run these great pieces of software and bring a new life into aging audio equipment that most of us have at home, but do not use that much these days, since it is not working with Spotify and the family.

## Esparagus HiFi MediaLink

Esparagus HiFi MediaLink is a handy low cost media device that will upgrade your legacy audio system with cutting-edge internet streaming capabilities and enhance your audio experience. It exposes line level output that you can plug into a stereo amplifier. It uses the legendary PCM51 series DAC with supreme audio quality.

![DSC_0702](https://github.com/sonocotta/esparagus-hifi-medialink/assets/98712315/3ef311c6-2fbc-4969-aa99-4fed7e1e1dd5)

## Loud Esparagus

Loud Esparagus is aimed to be paired with small-to-medium sized speakers in a small room. It uses a dual MAX98357 Hi-Fi DAC that will output 3W per speaker. Admittedly not much, but well enough for a kid's room or work place. Due to the D-class amp, it barely uses power and can be paired with a standard USB wall charger.   

![DSC_0689](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/7635cb2a-6ef1-43e8-8396-c27ef5387a25)

## Louder Esparagus

Louder Esparagus is a top-of-the-range model that uses modern highly capable TAS5805M DAC and is aimed to be paired with medium-to-large speaker systems. With 25W per channel stereo output it packs a punch and can easily enlive living quarters or dorm rooms. It is highly efficient, but much more demanding for power when cranked, therefore it uses USB-C Power Delivery to pull up to 65W from the wall power adapter. It can be used both with Wi-Fi and Ethernet (to make sure bad Wi-Fi would not interrupt the stream)

![DSC_0725](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/beb44179-2d79-4506-b867-493c66191c21)

## Features

|             | [Hifi ESP](https://github.com/sonocotta/esp32-audio-dock) | Esparagus HiFi MediaLink | [Loud ESP](https://github.com/sonocotta/loud-esp)  | Loud Esparagus | [Louder ESP](https://github.com/sonocotta/esp32-audio-dock)  | Louder Esparagus
|-------------|------------------------|-----------------------|------------------------|-----------------------|------------------------|-----------------------|
| Image       | ![image](https://user-images.githubusercontent.com/5459747/225272052-c36d5b87-1b9a-439c-be69-94077135e72a.png)  | ![DSC_0709](https://github.com/sonocotta/esparagus-hifi-medialink/assets/98712315/ea45f1d2-32b5-4f12-a63c-a8e403cb22db) | ![image](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/b9182b50-9d52-430b-878c-d82052e43e84) | ![DSC_0706](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/2556b8ff-1827-4e03-8e28-31e40199943c) | ![image](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/60da6a3f-422d-4fea-b6ff-7a0423c12543) | ![DSC_0713](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/03ec824a-1eab-4d85-92e9-a0aed5a66ce9) | Docks with  | ESP32 Mini Module           | ESP32-WROVER Module Onboard  | ESP32 Mini Module           | ESP32-WROVER Module Onboard  | ESP32 Mini Module           | ESP32-WROVER Module Onboard  |
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

In the [software](/firmware) section two firmware examples provided.

- [esp32-i2s-bare](/firmware/esp32-i2s-bare/) is base I2S implementation based on ESP-IDF implementation directly.
- [esp32-i2s-esp8266audio](/firmware/esp32-i2s-esp8266audio/) is based on excellent [ESP8266Audio](https://github.com/earlephilhower/ESP8266Audio) library (it works with the whole ESP range, don't get fooled by the name), providing minimum code implementation. 
- [esp32-i2s-web-radio](/firmware/esp32-i2s-web-radio/) is based on the [same library](https://github.com/earlephilhower/ESP8266Audio), providing minimum web-readio stream player. It expects playlist as an input in 'data' folder. 

### Platformio IDE
 
All samples are provided as [Plarformio IDE](https://platformio.org/platformio-ide) projects. After installing it, open sample project. Select proper environment based on your dock. Run `Build` and `Upload` commands to install necessary tools and libraries, build and upload prject to the board. Communication and proper upload method selection will be handled by IDE automatically. 

## Arduino IDE

Follow the [ESP8266Audio](https://github.com/earlephilhower/ESP8266Audio) library guide.

## Squeezelite-ESP32

Squeezelite-ESP32 is a multimedia software suite, that started as renderer (or player) of LMS (Logitech Media Server). Now it is extended with 
- **Spotify** over-the-air player using SpotifyConnect (thanks to cspot)
- **AirPlay** controller (iPhone, iTunes ...) and enjoy synchronization multiroom as well (although it's AirPlay 1 only)
- Traditional **Bluetooth** device (iPhone, Android)

And LMS itself
- Streams your local music and connect to all major on-line music providers (Spotify, Deezer, Tidal, Qobuz) using Logitech Media Server - a.k.a LMS with **multi-room** audio synchronization.
- LMS can be extended by numerous plugins and can be controlled using a Web browser or dedicated applications (iPhone, Android).
- It can also send audio to UPnP, Sonos, ChromeCast and AirPlay speakers/devices.

All Esparagus boards are tested with [Squeezelite-ESP32](https://github.com/sle118/squeezelite-esp32) software. It can be flashed using nothing but web-browser. You can use [Squeezelite-ESP32 installer](https://sle118.github.io/squeezelite-esp32-installer/) for that purpose.

### How to flash and configure

Use [Squeezelite-ESP32 installer](https://sle118.github.io/squeezelite-esp32-installer/) to flash firmware first. 

|   |   |
|---|---|
| Use `Generic/I2S` profile | ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/134eea60-149b-48d6-90cb-e68b421b61b2) |  
| Connect device to USB port and select if from the list | ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/5cb87b71-ff9c-4aa6-acdc-602b9c918e67) ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/38a313c6-5b38-4b63-9e4b-209ffd960c6b)| 
| Press `Flash` and wait around 2 minutes  | ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/e93f2106-b6e2-4625-92d1-a906c8375fd7) | 
| (Optional) You may enter serial console to get more information | ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/2d9c3b58-f4bf-49a5-8c6b-fc12c8cc8d10) |
| Device is in recovery mode. Connect to `squeezelite-299fac` wifi network with `squeezelite` password (your network name suffix will be different) | ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/2763663c-dbc9-4c71-af12-0a6fb9c2d94d) |
| When redirected to captive portal let device scan wifi network and provide valid credentials | <img src="https://github.com/sonocotta/esp32-audio-dock/assets/5459747/d2540ffb-d1d1-4441-a2b1-bbd6b8ad608f" width="30%" /> <img src="https://github.com/sonocotta/esp32-audio-dock/assets/5459747/b21f30e6-8899-46bc-b047-23281cae52b8" width="30%" /> <img src="https://github.com/sonocotta/esp32-audio-dock/assets/5459747/5dd1a1f6-0c6d-4045-b135-1d8cdd077161" width="30%" /> |
| You can use provided IP address (http://192.168.1.99/ on the screenshot) to access settings page |  ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/e3bbf910-1a5c-4c58-bd4e-c348ef0a91e5)
| _HiFi and Loud_ <br/> Navigate to **NVS Editor** section and provide following updates <br /><br /> `dac_config`: `model=I2S,bck=26,ws=25,do=22` <br /> `display_config`: `SPI,width=128,height=64,cs=5,reset=32,driver=SSD1306,HFlip,VFlip` <br /> `led_vu_config`: `type=WS2812,length=1,gpio=33` <br /> `spi_config`: `mosi=23,clk=18,host=2,miso=19,dc=4` <br/><br /> Press `Commit` button |  ![image](https://github.com/sonocotta/esparagus-hifi-medialink/assets/98712315/ac53c365-7434-4042-86f9-ad74134a1cb5)
| _Louder ESP_ <br />  Navigate to **NVS Editor** section and provide following updates <br /><br /> dac_config: `model=I2S,bck=26,ws=25,do=22,sda=21,scl=27,i2c=45` <br /> (STEREO, [BTL mode](#btl-and-pbtl-mode)) dac_controlset: `{"init":[{"reg":3,"val":2},{"reg":3,"val":3}],"poweron":[{"reg":3,"val":3}],"poweroff":[{"reg":3,"val":0}]}` <br /> (MONO, [PBTL mode](#btl-and-pbtl-mode)) dac_controlset: `{"init":[{"reg":3,"val":2},{"reg":3,"val":3},{"reg":2,"val":4}],"poweron":[{"reg":3,"val":3}],"poweroff":[{"reg":3,"val":0}]}` <br /> i2c_config: `scl=27,sda=21,speed=400000,port=1` <br /> set_GPIO: `33=vcc` <br/><br /> Press `Commit` button |  ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/cac2a1cc-7216-47c9-97b2-6a72c6559165)
| _Louder ESP, Rev E_  <br /><br /> Update Ethernet configuration, if you're planning to use Ethernet module <br /> eth_config: `model=w5500,cs=5,speed=20000000,intr=35,rst=14` <br/> spi_config: `mosi=23,clk=18,host=2,miso=19` <br/> <br /> Press `Commit` button |  ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/f52e3a05-abe6-40d7-98ac-212bff6c431f)
| (Optional) You may change device names to something close to you heart| ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/adc1fff1-8572-4fe5-9d88-943d86a3fb11)
| Exit recovery | ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/c54b18fa-c995-4e67-bced-820f8bce5fe6)
  
You can use it now
| Bluetooth  | Spotify Connect  | AirPlay | LMS Renderer  |
|---|---|---|---|
| ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/cd0e7cb2-4a15-48fc-b308-0281e414619e)| ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/edcb5a3b-bead-44d8-b51d-4c36ed19b7da)| ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/20586bb4-bc51-4cfb-802a-c6072987c1da)| ![image](https://github.com/sonocotta/esp32-audio-dock/assets/5459747/dfdb89dd-755b-42fe-a381-a92011f9c681)


## Hardware

| Esparagus HiFi MediaLink  | Loud Esparagus  | Louder Esparagus |
|---|---|---|
| ![DSC_0711](https://github.com/sonocotta/esparagus-hifi-medialink/assets/98712315/66f565f3-7342-42aa-95e4-bad0437aa887) | ![DSC_0702](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/00d540a8-6dce-48dd-9d11-d70992451068) | ![DSC_0710](https://github.com/sonocotta/esparagus-hifi-medialink/assets/5459747/dce0c088-fa0c-4637-a719-b067daeff998)

Please visit [hardware](/hardware/) section for board schematics and PCB designs. Note that PCB are shared as multi-layer PDFs as well as Gerber archives.

### Boxed


| Esparagus HiFi MediaLink  | Loud Esparagus  | Louder Esparagus |
|---|---|---|
| ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/c4765189-de0e-44bd-8163-b19ddd6f68d1) | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/8e2819a1-d496-456d-a180-b554787e6a0f) | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/439e5afb-a89d-408f-a5a4-f48b1f3c4630)

### PCB

| Esparagus HiFi MediaLink  | Loud Esparagus  | Louder Esparagus |
|---|---|---|
| ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/d56ff3b7-633c-4f67-a82f-5084cfeb4144) | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/f355598b-bf33-43a8-87a1-130de3d1e3b2) | ![image](https://github.com/sonocotta/esparagus-media-center/assets/5459747/71fb67ab-6dd2-435c-b3ed-669ae3ed3f2c)




## Where to buy

You may support our work by ordering this product at Tindie
- [Esparagus HiFi MediaLink](https://www.tindie.com/products/sonocotta/esparagus-hifi-medialink/)
- [Loud Esparagus](https://www.tindie.com/products/sonocotta/loud-esparagus-media-center/)
- Louder Esparagus (coming soon)
