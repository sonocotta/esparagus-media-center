## CH340C 5V level issue

**Description:**

Some units suffer from bad wifi connectivity (low wifi RSSI, -10..-20Db compared to expected level) when the device has no Serial monitor attached. Connectivity is fine however when the Serial monitor is attached 

**Impact:**

Affected units will stutter and break audio streaming even in close proximity to the WiFi router. As soon as the Serial monitor is attached, connectivity is restored and the unit works as expected, making debugging very difficult.

**Affected Products:**

- HiFi-Esparagus, Rev D
- HiFi-Esparagus, Rev E
- Loud Esparaus, Rev D

##### Detailed Description

**Issue Details:**

Due to a mistake in the schematics, the VCC pin on the CH340C USB-Serial bridge is connected to the +5V line. This causes it to generate 5V on the control lines RTS and DTR. This in turn causes +4.2V level on the RST and IO0 pins of the ESP32, which is way above the allowed pin voltage limit. Although many units are capable of working with no measurable impact on the operation, some suffer from bad radio connectivity. Based on the known cases no permanent damage is caused by high voltage, which allows applying permanent hardware fix.

**Detection:**

Users may notice that the WiFi or Bluetooth perception is poor, causing audio to break and stutter.

### Workaround/Temporary Solution

You can use the unit with a serial monitor attached to the USB-C port. This causes low levels on the serial control lines, thus keeping the RST pin on the +3.3V level, equivalent to normal unit operation.

### Resolution/Corrective Action

**Status:**

The next revision of the board has a permanent schematics fix. Specifically fixed in

- HiFi-Esparagus, Rev F
- Loud-Esparagus, Rev E 

**Permanent Solution:**

Customers can apply a permanent fix by following the steps below. It will require moderate soldering skills and a piece of thin copper wire.

| Step | Description | HiFi-Esparagus | Loud-Esparagus
|---------------------|--------------------------|--------------------------|--------------------------|
| 1 | Disconnect the VCC pin from the 5V line. Use a sharp tip with your soldering iron and a sharp tool. You lose the ability to flash the unit using the USB-C port at this time. | ![image](https://github.com/user-attachments/assets/8a99d21e-ae60-4a57-881c-a1101e91c4c0) | ![image](https://github.com/user-attachments/assets/3b6953f3-6c19-4707-95fe-f224e8a49273)
| 2 | Connect the lifted pin to 3,3V line. The flashing capability is restored. | ![image](https://github.com/user-attachments/assets/31a27d97-a108-4922-8aa5-9d85e9d40cef) | ![image](https://github.com/user-attachments/assets/3ddcc4e0-c822-4675-b7b8-53646f3ec422)

Optionally secure the wire in place with hot glue or Kapton tape. 

**Additional Notes:**

I apologize for any inconvenience caused by this issue. I am committed to fix this issue as soon as discovered and guiding those who need help fixing it themselves.