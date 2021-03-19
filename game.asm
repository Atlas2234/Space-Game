#####################################################################
#
# CSCB58 Winter 2021 Assembly Final Project
# University of Toronto, Scarborough
#
# Student: (David)Zhaoling Zhang, 1005984605, zhan7960
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8 (update this as needed)
# - Unit height in pixels: 8 (update this as needed)
# - Display width in pixels: 256 (update this as needed)# - Display height in pixels: 256 (update this as needed)
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have been reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 0
#
# Which approved features have been implemented for milestone 4?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# 3. (fill in the feature, if any)
# 
#
# Link to video demonstration for final submission:
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# - Yes
#
# Any additional information that the TA needs to know:
# - None
#
#####################################################################

.data

SHIP:	.word	 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xdddd00, 0xeedd00
SHIP_Y:	.word	15, 14, 16, 15, 14, 16
SHIP_X:	.word	5, 5, 5, 6, 4, 4
SHIP_SIZE: .word 6


OB1:	.word	0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff
OB1_Y:	.space	20
OB1_X:	.space	20
OB1_SIZE: .word 5

OB2:	.word	0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff
OB2_Y:	.space	28
OB2_X:	.space	28
OB2_SIZE: .word 7

OB3:	.word	0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff
OB3_Y:	.space	24
OB3_X:	.space	24
OB3_SIZE: .word 6

#OB4:	.word	0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff
#OB4_Y:	.space	20
#OB4_X:	.space	20
#OB4_SIZE: .word 5

#OB5:	.word	0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff
#OB5_Y:	.space	20
#OB5_X:	.space	20
#OB5_SIZE: .word 5



.eqv BASE_ADDRESS 0x10008000
.eqv WIDTH 32
.eqv BLACK 0x00000000

.text

.globl main
	
#__________FUNCTION__________#
#draw_obj(int a)#
#draws the obstacle/ship based on which value of a was passed#
draw_obj:
	#determining what to draw#
	li $t9, 0
	beq $a0, $t9, DRAW_ELSE_IF_1
	li $t9, 1
	beq $a0, $t9, DRAW_ELSE_IF_2
	li $t9, 2
	beq $a0, $t9, DRAW_ELSE_IF_3
	li $t9, 3
	beq $a0, $t9, DRAW_ELSE_IF_4
	li $t9, 4
	beq $a0, $t9, DRAW_ELSE_IF_5
	
	
	#Draw SHIP#

#Draw OB1#
DRAW_ELSE_IF_1:
	la $s1, OB1 #Load OB1 address into $s1#
	
	#Get base address of OB1_X, OB1_Y#
	la $s2, OB1_X
	la $s3, OB1_Y
	
	#Get address and value of OB1_SIZE #
	la $t9, OB1_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP1:	
	
	beq $t8, $t9, END_DRAW_LOOP1
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB1_X#
	add $s6, $s3, $t1 #Offset for OB1_Y#
	add $s7, $s1, $t1 #Offset for OB1#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of OB1 into $s0#
	
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations for offset of framebuffer#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	add $t7, $t6, $t0 #Add offset address calculated#
	
	sw $s0, ($t7) #write colour value of OB1[0] into ($t0 + 0)#
	
	addi $t8, $t8, 1 
	
	j DRAW_LOOP1

END_DRAW_LOOP1:	
	jr $ra
	
	
#Draw OB2#
DRAW_ELSE_IF_2:
	la $s1, OB2 #Load OB2 address into $s1#
	
	#Get base address of OB2_X, OB2_Y#
	la $s2, OB2_X
	la $s3, OB2_Y
	
	#Get address and value of OB2_SIZE #
	la $t9, OB2_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP2:	
	
	beq $t8, $t9, END_DRAW_LOOP2
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB2_X#
	add $s6, $s3, $t1 #Offset for OB2_Y#
	add $s7, $s1, $t1 #Offset for OB2#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of OB2 into $s0#
	
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations for offset of framebuffer#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	add $t7, $t6, $t0 #Add offset address calculated#
	
	sw $s0, ($t7) #write colour value of OB2[0] into ($t0 + 0)#
	
	addi $t8, $t8, 1 
	
	j DRAW_LOOP2

END_DRAW_LOOP2:	
	jr $ra
	
#Draw OB3#
DRAW_ELSE_IF_3:
	
	la $s1, OB3 #Load OB3 address into $s1#
	
	#Get base address of OB3_X, OB3_Y#
	la $s2, OB3_X
	la $s3, OB3_Y
	
	#Get address and value of OB3_SIZE #
	la $t9, OB3_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP3:	
	
	beq $t8, $t9, END_DRAW_LOOP3
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB3_X#
	add $s6, $s3, $t1 #Offset for OB3_Y#
	add $s7, $s1, $t1 #Offset for OB3#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of OB3 into $s0#
	
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations for offset of framebuffer#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	add $t7, $t6, $t0 #Add offset address calculated#
	
	sw $s0, ($t7) #write colour value of OB3[0] into ($t0 + 0)#
	
	addi $t8, $t8, 1 
	
	j DRAW_LOOP3

END_DRAW_LOOP3:	
	jr $ra
	
#Draw OB4#
DRAW_ELSE_IF_4:

#Draw OB5#
DRAW_ELSE_IF_5:	

	jr $ra


#__________FUNCTION__________#
#erase_obj(int a)#
#erases the obstacle/ship based on which value of a was passed#
erase_obj:
	#determining what to draw#
	li $t9, 0
	beq $a0, $t9, ERA_ELSE_IF_1
	li $t9, 1
	beq $a0, $t9, ERA_ELSE_IF_2
	li $t9, 2
	beq $a0, $t9, ERA_ELSE_IF_3
	#li $t9, 3
	#beq $a0, $t9, ERA_ELSE_IF_4
	#li $t9, 4
	#beq $a0, $t9, ERA_ELSE_IF_5
	
	
	#Erase SHIP#

#Erase OBSTACLES#

#Erase OB1#
ERA_ELSE_IF_1:
	
	#Get base address of OB1_X, OB1_Y#
	la $s2, OB1_X
	la $s3, OB1_Y
	
	#Get address and value of OB1_SIZE #
	la $t9, OB1_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
ERASE_LOOP1:	

	beq $t8, $t9, END_ERASE_LOOP1
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB1_X#
	add $s6, $s3, $t1 #Offset for OB1_Y#
	add $s7, $s1, $t1 #Offset for OB1#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of OB1 into $s0#
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	add $t7, $t6, $t0 #Add offset address calculated#
	
	li $s0, BLACK
	sw $s0, ($t7) #write colour value of OB1[0] into ($t0 + 0)#
	
	addi $t8, $t8, 1 
	
	j ERASE_LOOP1

END_ERASE_LOOP1:
	jr $ra

#Erase OB2#
ERA_ELSE_IF_2:
	#Get base address of OB2_X, OB2_Y#
	la $s2, OB2_X
	la $s3, OB2_Y
	
	#Get address and value of OB2_SIZE #
	la $t9, OB2_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
ERASE_LOOP2:	

	beq $t8, $t9, END_ERASE_LOOP2
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB2_X#
	add $s6, $s3, $t1 #Offset for OB2_Y#
	add $s7, $s1, $t1 #Offset for OB2#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of OB2 into $s0#
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	add $t7, $t6, $t0 #Add offset address calculated#
	
	li $s0, BLACK
	sw $s0, ($t7) #write colour value of OB2[0] into ($t0 + 0)#
	
	addi $t8, $t8, 1 
	
	j ERASE_LOOP2

END_ERASE_LOOP2:
	jr $ra

#Erase OB3#
ERA_ELSE_IF_3:
	#Get base address of OB3_X, OB3_Y#
	la $s2, OB3_X
	la $s3, OB3_Y
	
	#Get address and value of OB3_SIZE #
	la $t9, OB3_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
ERASE_LOOP3:	

	beq $t8, $t9, END_ERASE_LOOP3
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB3_X#
	add $s6, $s3, $t1 #Offset for OB3_Y#
	add $s7, $s1, $t1 #Offset for OB3#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of OB3 into $s0#
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	add $t7, $t6, $t0 #Add offset address calculated#
	
	li $s0, BLACK
	sw $s0, ($t7) #write colour value of OB3[0] into ($t0 + 0)#
	
	addi $t8, $t8, 1 
	
	j ERASE_LOOP3

END_ERASE_LOOP3:
	jr $ra

#__________FUNCTION__________#
move_left:
#Shifts obstacles to the left one unit#

#OB1#
	la $s2, OB1_X #Get base address of OB1_X#
	
	#Get address and value of OB1_SIZE #
	la $t9, OB1_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
MOVE_LOOP1:	
	
	beq $t8, $t9, END_MOVE_LOOP1
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB1_X#
	
	#Calculation to shift unity left by 1#
	li $t2, -3 #Moves at -3 units fast#
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j MOVE_LOOP1

END_MOVE_LOOP1:

#OB2#
	la $s2, OB2_X #Get base address of OB2_X#
	
	#Get address and value of OB2_SIZE #
	la $t9, OB2_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
MOVE_LOOP2:	
	
	beq $t8, $t9, END_MOVE_LOOP2
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB2_X#
	
	#Calculation to shift unity left by 1#
	li $t2, -1 #Moves at -1 units fast#
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j MOVE_LOOP2

END_MOVE_LOOP2:


#OB3#
	la $s2, OB3_X #Get base address of OB3_X#
	
	#Get address and value of OB3_SIZE #
	la $t9, OB3_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
MOVE_LOOP3:	
	
	beq $t8, $t9, END_MOVE_LOOP3
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB3_X#
	
	#Calculation to shift unity left by 1#
	li $t2, -2 #Moves at -1 units fast#
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j MOVE_LOOP3

END_MOVE_LOOP3:




	jr $ra
	
#__________FUNCTION__________#
#Sets the coordinates of an obstacle#
#Gets 2 arguments, $a0 which is the random Y number, $a1 which tells function which obstacle to set coordinates to#
set_coord:	
	#determining which obstacle coordinates to generate#
	li $t9, 0
	beq $a1, $t9, SET_ELSE_IF_1
	li $t9, 1
	beq $a1, $t9, SET_ELSE_IF_2
	li $t9, 2
	beq $a1, $t9, SET_ELSE_IF_3
	#li $t9, 3
	#beq $a1, $t9, SET_ELSE_IF_4
	#li $t9, 4
	#beq $a1, $t9, SET_ELSE_IF_5
	
SET_ELSE_IF_1:
#Set coordinates for OB1#
	la $s2, OB1_X #Get base address of OB1_X#
	la $s1, OB1_Y #Get base address of OB1_Y#		
	
	#Set X#
	li $t1, 30
	sw $t1, ($s2)
	li $t1, 31
	sw $t1, 4($s2)
	li $t1, 31
	sw $t1, 8($s2)
	li $t1, 31
	sw $t1, 12($s2)
	li $t1, 32
	sw $t1, 16($s2)
	
	#Set Y#
	add $t1, $zero, $a0
	sw $t1, ($s1)
	
	li $t2, -1
	add $t1, $a0, $t2 
	sw $t1, 4($s1)
	
	add $t1, $zero, $a0
	sw $t1, 8($s1)
	
	li $t2, 1
	add $t1, $a0, $t2 
	sw $t1, 12($s1)
	
	add $t1, $zero, $a0
	sw $t1, 16($s1)
	
	jr $ra

SET_ELSE_IF_2:
#Set coordinates for OB2#
	la $s2, OB2_X #Get base address of OB2_X#
	la $s1, OB2_Y #Get base address of OB2_Y#		
	
	#Set X#
	li $t1, 30
	sw $t1, ($s2)
	li $t1, 31
	sw $t1, 4($s2)
	li $t1, 31
	sw $t1, 8($s2)
	li $t1, 31
	sw $t1, 12($s2)
	li $t1, 31
	sw $t1, 16($s2)
	li $t1, 32
	sw $t1, 20($s2)
	li $t1, 32
	sw $t1, 24($s2)
	
	#Set Y#
	add $t1, $zero, $a0
	sw $t1, ($s1)
	
	li $t2, -2
	add $t1, $a0, $t2 
	sw $t1, 4($s1)
	
	li $t2, -1
	add $t1, $a0, $t2 
	sw $t1, 8($s1)
	
	add $t1, $zero, $a0
	sw $t1, 12($s1)
	
	li $t2, 1
	add $t1, $a0, $t2 
	sw $t1, 16($s1)
	
	li $t2, -1
	add $t1, $a0, $t2 
	sw $t1, 20($s1)
	
	add $t1, $zero, $a0
	sw $t1, 24($s1)
	
	jr $ra
	
SET_ELSE_IF_3:
#Set coordinates for OB3#
	la $s2, OB3_X #Get base address of OB3_X#
	la $s1, OB3_Y #Get base address of OB3_Y#		
	
	#Set X#
	li $t1, 30
	sw $t1, ($s2)
	li $t1, 31
	sw $t1, 4($s2)
	li $t1, 31
	sw $t1, 8($s2)
	li $t1, 32
	sw $t1, 12($s2)
	li $t1, 32
	sw $t1, 16($s2)
	li $t1, 32
	sw $t1, 20($s2)
	
	
	#Set Y#
	add $t1, $zero, $a0
	sw $t1, ($s1)
	
	add $t1, $zero, $a0
	sw $t1, 4($s1)
	
	li $t2, 1
	add $t1, $a0, $t2 
	sw $t1, 8($s1)
	
	li $t2, -1
	add $t1, $a0, $t2 
	sw $t1, 12($s1)
	
	add $t1, $zero, $a0
	sw $t1, 16($s1)
	
	li $t2, 1
	add $t1, $a0, $t2 
	sw $t1, 20($s1)
	
	jr $ra


#__________FUNCTION__________#
main:
	#Setup for framebuffer
	li $t0, BASE_ADDRESS # $t0 stores the base address for display
	
	#Initialize and Draw Spaceship#		
	la $t1, SHIP #Load address of A#
	
	lw $t2, ($t1) #load colour value of A[0] into $t1#
	lw $t3, 4($t1)
	lw $t4, 8($t1)
	lw $t5, 12($t1)
	lw $t6, 16($t1)
	lw $t7, 20($t1)
	
	
	sw $t2, 1812($t0) #write colour value of A[0] into ($t0 + 0)#
	sw $t3, 1940($t0) 
	sw $t4, 2068($t0)
	sw $t5, 1944($t0)
	sw $t6, 1808($t0)
	sw $t7, 2064($t0)
	
	
	#--Initialize and Draw OB1--#
	#Random Number Generation#
	li $v0, 42 #Generate random number with range, gives a random Y starting point for the leftmost unit#
	li $a0, 0
	li $a1, 31
	syscall
	#Set rest of coordinates from random Y#
	li $a1, 0
	jal set_coord
	#Draw OB1#
	li $a0, 0
	jal draw_obj
	
	
	#--Initialize and Draw OB2--#
	#Random Number Generation#
	li $v0, 42 #Generate random number with range, gives a random Y starting point for the leftmost unit#
	li $a0, 0
	li $a1, 31
	syscall
	#Set rest of coordinates from random Y#
	li $a1, 1
	jal set_coord
	#Draw OB2#
	li $a0, 1
	jal draw_obj
	
	#--Initialize and Draw OB3--#
	#Random Number Generation#
	li $v0, 42 #Generate random number with range, gives a random Y starting point for the leftmost unit#
	li $a0, 0
	li $a1, 31
	syscall
	#Set rest of coordinates from random Y#
	li $a1, 2
	jal set_coord
	#Draw OB2#
	li $a0, 2
	jal draw_obj
	
	

game_loop:	
	
#Erase Obstacle#

	#Erase OB1#
	li $a0, 0
	jal erase_obj
	#Erase OB2#
	li $a0, 1
	jal erase_obj
	#Erase OB3#
	li $a0, 2
	jal erase_obj


#Update Obstacle#
	jal move_left

		
#Check and Reposition Obstacles#
	
	#Check OB1#
	la $t1, OB1_X
	lw $t2, ($t1) #Get value of OB1_X[0] which is the first unit this makes it less distracting#
	bgez $t2, check1_end #if $t2 is greater than or equal zero#
	
	#Reposition OB1#
	#Random Number Generation#
	li $v0, 42 #Generate random number with range, gives a random Y starting point for the leftmost unit#
	li $a0, 0
	li $a1, 31
	syscall
	#Set rest of coordinates from random Y#
	li $a1, 0
	jal set_coord
	
check1_end: 

	#Draw Obstacle#
	li $a0, 0
	jal draw_obj
	
	
	#Check OB2#
	la $t1, OB2_X
	lw $t2, ($t1) #Get value of OB2_X[0] which is the first unit this makes it less distracting#
	bgez $t2, check2_end #if $t2 is greater than or equal zero#
	
	#Reposition OB2#
	#Random Number Generation#
	li $v0, 42 #Generate random number with range, gives a random Y starting point for the leftmost unit#
	li $a0, 0
	li $a1, 31
	syscall
	#Set rest of coordinates from random Y#
	li $a1, 1
	jal set_coord
	
check2_end: 

	#Draw Obstacle#
	li $a0, 1
	jal draw_obj
	
	
	#Check OB3#
	la $t1, OB3_X
	lw $t2, ($t1) #Get value of OB3_X[0] which is the first unit this makes it less distracting#
	bgez $t2, check3_end #if $t2 is greater than or equal zero#
	
	#Reposition OB2#
	#Random Number Generation#
	li $v0, 42 #Generate random number with range, gives a random Y starting point for the leftmost unit#
	li $a0, 0
	li $a1, 31
	syscall
	#Set rest of coordinates from random Y#
	li $a1, 2
	jal set_coord
	
check3_end: 

	#Draw Obstacle#
	li $a0, 2
	jal draw_obj		



#sleep#
	li $v0, 32
	li $a0, 40
	syscall
	j game_loop
	
end:
	li $v0, 10 # terminate the program
	syscall
