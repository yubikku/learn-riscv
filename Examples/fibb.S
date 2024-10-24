.data
n: .word 15	     # this is n

.text
lui x5, 0x10000     # x5 = 0x1000 0000
addi x6, x5, 0x10   # x6 = 0x1000 0010
lw x1, 0(x5)        # x1 = value of n

add x2, x0, x0      # x2 = 0
addi x3, x0, 1      # x3 = 1
addi x4, x3, 0      # x4 = x3

loop:
sw x4, 0(x6)        # store the fibonacci number
addi x6, x6, 4      # increment address for the next iteration
addi x1, x1, -1     # x1 = x1-1
beq x1, x0, exit    # check if 0
add x4, x2, x3      # x4 = x2 + x3
add x2, x3, x0      # x2 = x3
add x3, x4, x0      # x3 = x4
j loop

exit: