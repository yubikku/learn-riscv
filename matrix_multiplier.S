# x10 = a0 -> the pointer to the first matrix (a);
# x11 = a1 -> the pointer to the 2nd matrix  (b);
# x12 = a2 -> the pointer to the resulting matrix (c)

# Note Sample:
# A = | 1, 2, 3 |
#     | 4, 5, 6 |

# B = | 7 , 8  |
#     | 9 , 10 |
#     | 11, 12 |

# Result:
# C = | 58, 64   |
#     | 139, 154 |

.data
# Format: row, col, <Matrix Elements>, <stopper (0)>  
a: .word 2, 3, 1, 2, 3, 4, 5, 6, 0
b: .word 3, 2, 7, 8, 9 ,10, 11, 12, 0

.text 
lui x1, 0x10000

find_b:
    lbu x2, 0(x1)   		# load element of a
    addi x1, x1, 4 		    # increment address
    beq x2, x0, found_b 	# if the loaded element is 0, we found b
    j find_b        		# else, continue looping

found_b:
    add x2, x1, x0  		# starting address of b
    lui x1, 0x10000 		# starting address of a
    lui x3, 0x30000 		# starting address of result

# Assign from Address of B to address pointer 0x2000
