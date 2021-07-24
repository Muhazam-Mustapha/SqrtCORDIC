# SqrtCORDIC v1.0
A CORDIC implementation of square root Verilog calculation on Quartus Prime 16.0, with ability to simulate on ModelSim as well.

## Input
**Format:** \[16.16\] fixed point notation - 16 bits for integer part, 16 bits for fraction part.

The value that is to be fed into the input is a positive 32-bit integer value of *N*×2<sup>16</sup> where *N* is the a real number (with fraction part). Largest value accepted for *N* is 1111 1111 1111 1111.1111 1111 1111 1111<sub>2</sub>.

For example, if you want to calculate the square root of 35.61<sub>10</sub>, you have to feed the input with the nearest integer of 35.61<sub>10</sub>&times;2<sup>16</sup> = 2333737<sub>10</sub> which a sequence of 32 bits of 0000 0000 0010 0011 1001 1100 0010 1001. There is a radix (base) point at the middle of the sequence which makes it equal to 10 0011.1001 1100 0010 1001<sub>2</sub>.

## Output
**Format:** \[8.16\] fixed point notation - 8 bits for integer part, 16 bits for fraction part.
* Number of bits in integer part of the square root is half of the original number, but the number of bits in the fraction part is kept at 16 to preserve accuracy.

For example, if you are reading a binary sequence of 0011 1100 0110 1011 0000 1000 at the output after the calculation completed, the actual value in decimal is the plain integer binary value divided by 2<sup>16</sup> = 3959560&times;2<sup>&minus;16</sup> = 60.4180.

## Signaling Sequence
\[to be added\]

## Data Flow Diagram
![Data Flow Diagram](https://github.com/Muhazam-Mustapha/SqrtCORDIC/blob/master/Dataflow.png)
