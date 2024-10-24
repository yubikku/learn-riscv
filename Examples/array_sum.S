.data 
a: .byte 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 0
b: .byte 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 0

.text
lui x1, 0x10000 		# starting address of a

# find starting address of second array b
find_b:
lbu x2, 0(x1)   		# load element of a
addi x1, x1, 1  		# increment address
beq x2, x0, found_b 	# if the loaded element is 0, we found b
j find_b        		# else, continue looping

found_b:
add x2, x1, x0  		# starting address of b
lui x1, 0x10000 		# starting address of a
lui x3, 0x30000 		# starting address of result

loop:
lbu x4, 0(x1)    		# load element of a
lbu x5, 0(x2)    		# load element of b
beq x4, x0, exit    	# check if 0 (last element)

add x6, x4, x5  		# add the two elements together
sb x6, 0(x3)    		# store the result
addi x1, x1, 1 		# increment address of a
addi x2, x2, 1 		# increment address of b
addi x3, x3, 1 		# increment address of result
j loop
exit:
