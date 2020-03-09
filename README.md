# AVR CMake environment
This is an environment to make and upload programs using CMake, because sometimes one
needs something in a lower level than Arduino.

## Configuration
To configure and create new demos, you need to specify these variables:

#### CMakeLists.txt
* AVR_UPLOADTOOL
* AVR_MCU
* AVR_PROGRAMMER
* AVR_UPLOADTOOL_PORT
* F_CPU
* AVR_L_FUSE
* AVR_H_FUSE
* AVR_UPLOADTOOL_BAUDRATE