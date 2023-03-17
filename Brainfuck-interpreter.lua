local Textbox = { -- place holder
    Text = ">++++++++[<+++++++++>-]<.>++++[<+++++++>-]<+.+++++++..+++.>>++++++[<+++++++>-]<++.------------.>++++++[<+++++++++>-]<+.<.+++.------.--------.>>>++++[<++++++++>-]<+.",
}

local program = Textbox.Text

local tape;
local variables_tape = {}
local main_tape = {}
local pointer;
local main_pointer = 1
local variables_pointer = 1
local taken_out_value = 0;

for i = 1, 1000 do
    main_tape[i] = 0
end

for i = 1, 1000 do
    variables_tape[i] = 0
end

tape = main_tape
pointer = main_pointer

local inputIndex = 1
for i = 1, #program do
    --print("e")
    local command = program:sub(i, i)
    
    if command == "+" then
        if tape[pointer] + 1 > 255 then tape[pointer] = 0 else tape[pointer] = tape[pointer] + 1 end
    elseif command == "-" then
        if tape[pointer] - 1 < 0 then tape[pointer] = 255 else tape[pointer] = tape[pointer] - 1 end
    elseif command == ">" then
        if pointer + 1 > #tape then pointer = 0 else pointer = pointer + 1 end
    elseif command == "<" then
        if pointer - 1 < 0 then pointer = #tape else pointer = pointer - 1 end
    elseif command == "[" and tape[pointer] == 0 then
        local count = 1
        while count > 0 do
            i = i + 1
            local nextCommand = program:sub(i, i)
            if nextCommand == "[" then
                count = count + 1
            elseif nextCommand == "]" then
                count = count - 1
            end
        end
    elseif command == "]" and tape[pointer] ~= 0 then
        local count = 1
        while count > 0 do
            i = i - 1
            local prevCommand = program:sub(i, i)
            if prevCommand == "[" then
                count = count - 1
            elseif prevCommand == "]" then
                count = count + 1
            end
        end
    elseif command == "," then
        io.write("Input> ")
        local input = io.read()
        tape[pointer] = string.byte(input:sub(inputIndex, inputIndex)) or 0
        inputIndex = inputIndex + 1
    elseif command == "." then
        io.write(string.char(tape[pointer]))
    elseif command == ":" then
        tape = main_tape
        pointer = main_pointer
    elseif command == ";" then
        tape = variables_tape
        pointer = variables_pointer
    elseif command == "!" then
        taken_out_value = tape[pointer]
    elseif command == "?" then
        tape[pointer] = taken_out_value
    end
end

io.write("\n")
