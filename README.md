# Brainfuck Interpreter
This repository contains a Brainfuck interpreter written in Lua. The Brainfuck programming language is an esoteric language known for its extreme minimalism. It consists of only eight commands, each represented by a single character.

# How to Use
Clone the repository to your local machine.
Open the main.lua file in a Lua interpreter or execute it directly.
Update the Textbox.Text variable with your Brainfuck code.
Execute the code and see the output.
# Features
The interpreter supports the following commands:

`>: Move the pointer to the right`__
`<: Move the pointer to the left`__
`+: Increment the memory cell at the pointer`__
`-: Decrement the memory cell at the pointer`__
`[: Jump past the matching ] if the cell at the pointer is 0`__
`]: Jump back to the matching [ if the cell at the pointer is nonzero`__
`,: Accept one byte of input, storing its value in the cell at the pointer`__
`.: Output the value of the cell at the pointer as an ASCII character`__
`:: Switch to using the main tape`__
`;: Switch to using the variables tape`__
`!: Store the current value of the cell at the pointer in a variable`__
`?: Replace the value of the cell at the pointer with the stored variable value`__
