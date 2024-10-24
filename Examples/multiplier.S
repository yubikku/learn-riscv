# Implements the multiplication using repeated addition algorithm
# Provided by my university class about RISC-V

.data # data segment starts at address 0x10000000
a: .word 17 # address 0x10000000 will contain 17 (decimal) or 0x11 (in hex)
b: .word 9 # address 0x10000004 will contain 9 (decimal) or 0x9 (in hex)

.text # this indicates the start of our code
    lui x4, 0x10000 # we set x4 = 0x10000000
    lw x1, 0(x4) # load data from address 0x10000000+0 to register x1
    lw x2, 4(x4) # load data from address 0x10000000+4 to register x2
    add x3, x0, x0 # x3 = x0 + x0 = 0
loop:
    beq x1, x0, done # check if x1 == 0, if it is then we're done
    add x3, x3, x2 # x3 = x3 + x2, accumulate the product on x3
    addi x1, x1, -1 # x1 = x1 + (-1) = x1 - 1, subtract 1 from x1
    beq x0, x0, loop # unconditional loop back to the loop label
done:
    sw x3, 8(x4) # if we're done, store the result to address 0x10000000+8