# SqrtCORDIC v1.0
A CORDIC implementation of square root Verilog calculation on Quartus Prime 16.0, with ability to simulate on ModelSim as well.

## Input
**Format:** \[16.16\] fixed point notation - 16 bits for integer part, 16 bits for fraction part.

The value that is to be fed into the input is a positive 32-bit integer value of *N*×2<sup>16</sup> where *N* is the real (with fraction part). Largest value accepted for *N* is 1111 1111 1111 1111.1111 1111 1111 1111<sub>2</sub>.

## Output
**Format:** \[8.16\] fixed point notation - 8 bits for integer part, 16 bits for fraction part.
* Number of bits in integer part of the square root is half of the original number, but the number of bits in the fraction part is kept at 16 to preserve accuracy.

## Data Flow Diagram
![Data Flow Diagram](https://github.com/Muhazam-Mustapha/SqrtCORDIC/blob/master/Dataflow.png)
