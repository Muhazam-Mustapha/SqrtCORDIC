# SqrtCORDIC
A CORDIC implementation of square root Verilog calculation on Quartus Prime 16.0, with ability to simulate on ModelSim as well.

## Input
**Format:** \[16.16\] fixed point notation - 16 bits for integer part, 16 bits for fraction part.

## Output
**Format:** \[8.16\] fixed point notation - 8 bits for integer part, 16 bits for fraction part.
* Number of bits in integer part of the square root is half of the original number, but the number of bits in the fraction part is kept at 16 to preserve accuracy.
