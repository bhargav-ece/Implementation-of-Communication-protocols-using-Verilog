# Implementation-of-Communication-protocols-using-Verilog

Communication protocols holds a special place as it opens up ways to efficiently exchange data between devices.

**1. UART (Universal Asynchronous Receiver Transmitter)**  
<p align="center">  <img src="https://user-images.githubusercontent.com/101927881/235342141-35dbda5f-0c72-427f-a1fb-9b25ef170b64.png">  </p>

The data transmission process via UART involves the receipt of data by the transmitting UART from a data bus, which acts as a conduit for sending data from another device, such as a CPU, memory, or microcontroller, to the UART in parallel form. The transmitting UART appends a start bit, a parity bit, and a stop bit to the parallel data obtained from the data bus to create the data packet, which is then transmitted serially, bit by bit, via the Tx pin. At the receiving end, the data packet is read by the receiving UART, which converts it back to parallel form and removes the start bit, parity bit, and stop bits. The receiving UART then transfers the resulting data packet in parallel to the data bus.
