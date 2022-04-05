# safe-lock
A password system that is representing a safe lock. This project is implemented to use with [Prometheus FPGA](https://www.isabekov.pro/prometheus-fpga/) board.

**[Video Demo](https://drive.google.com/file/d/1h4QMH1NyccYQ6mv4rB3oBwQW5MYlWH8b/view?usp=sharing) of the project.**

## Project Description
The Safe Lock Project gets
a password in hexadecimal from the user at the beginning and then saves the password.
After that, users are able to try to open the safe lock by entering a password using switches
and buttons. If users enter the password correctly, the implementation corresponds to
“open”; if they enter the password incorrectly, the implementation corresponds to “fail” on
the seven-segment display. Furthermore, if users enter the password incorrectly 3 times in
total, the system is locked, and “lock” is written on the 7-segment display. We also created a
master key that can open every lock.

## File Descriptions
- **SafeLockCode.vhd:** The main file of the project. Contains VHDL code that takes password, checks whether it is correct or not, then gives an output accordingly.
- **SafeLockSim.vhd:** Contains the simulation code.
- **SafeLockPins.ucf:** Contains pin positions to use the SafeLockCode with FPGA board.
- **SafeLockCode.bit:** Bit file that is run by Prometheus app.
- **SSSLIB.vhd:** Component to use 7-segment display. *The initial code is provided by the instuctor.*
- **HUDREDHZ_CLOCK_GENERATOR.vhd:** Gets the master clock as an input and generates another clock for the 7-segment display. *The initial code is provided by the instuctor.*
- **SEVSEG_DECODER.vhd:** Gets 5-bit inputs and decodes them into 7-bit outputs that correspond to the letters in “open”, “fail”, “lock”, numbers from 0 to 9, and letters from A to F. *The initial code is provided by the instuctor.*
- **SEVSEG_DRIVER.vhd:** Displays the password digits on separate digits on 7-segment display. *The initial code is provided by the instuctor.*
