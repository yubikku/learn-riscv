.data           # data segment starts at address 0x10000000
a: .word 17     # address 0x10000000 will contain 17 (decimal) or 0x11 (in hex)
b: .word 9      # address 0x10000004 will contain 9 (decimal) or 0x9 (in hex)


.text           # this indicates the start of our code
lui t0, 0x10000 # we set t0 = 0x10000000
lw t1, 0(t0)    # load data from address 0x10000000+0 to register t1
lw t2, 4(t0)    # load data from address 0x10000000+4 to register t2
add s0, x0, x0  # s0 = x0 + x0 = 0

loop:
    beq t1, x0, done    # check if t1 == 0, if it is then we're done
    add s0, s0, t2      # s0 = s0 + t2, accumulate the product on s0
    addi t1, t1, -1     # t1 = t1 + (-1) = t1 - 1, subtract 1 from t1
    j loop              # unconditional loop back to the loop label
done:
    sw s0, 8(t0)            # if we're done, store the result to address 0x10000000+8
    inf_loop: j inf_loop    # infinite loop so that the processor stops at this point