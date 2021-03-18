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
#TEMP
OB1_Y:	.word	10, 9, 10, 11, 10
OB1_X:	.word	20, 21, 21, 21, 22 


#OB1_Y:	.space	20
#OB1_X:	.space	20
OB1_SIZE: .word 5



.eqv BASE_ADDRESS 0x10008000
.eqv WIDTH 32
.eqv BLACK 0x00000000

.text

.globl main



#__________FUNCTION__________#
get_address:
	
#__________FUNCTION__________#
#draw_obj(int a)#
#draws the obstacle/ship based on which value of a was passed#
draw_obj:
	#determining what to draw#
	li $t9, 0
	beq $a0, $t9, ELSE_IF_1
	li $t9, 1
	beq $a0, $t9, ELSE_IF_2
	li $t9, 2
	beq $a0, $t9, ELSE_IF_3
	li $t9, 3
	beq $a0, $t9, ELSE_IF_4
	li $t9, 4
	beq $a0, $t9, ELSE_IF_5
	
	
	#Draw SHIP#

#Draw OB1#
ELSE_IF_1:
	la $s1, OB1 #Load OB1 address into $s1#
	
	#Get base address of OB1_X, OB1_Y#
	la $s2, OB1_X
	la $s3, OB1_Y
	
	#Get address and value of OB1_SIZE #
	la $t9, OB1_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
LOOP:	beq $t8, $t9, END_LOOP
	
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
	
	sw $s0, ($t7) #write colour value of OB1[0] into ($t0 + 0)#
	
	addi $t8, $t8, 1 
	
	j LOOP

END_LOOP:	
	jr $ra
	
	
#Draw OB2#
ELSE_IF_2:

#Draw OB3#
ELSE_IF_3:

#Draw OB4#
ELSE_IF_4:

#Draw OB5#
ELSE_IF_5:	

	jr $ra


#__________FUNCTION__________#
#erase_obj(int a)#
#erases the obstacle/ship based on which value of a was passed#
erase_obj:
	#determining what to draw#
	bgtz $a0, ELSE_IF_A
	
	
	#Erase SHIP#

#Erase OBSTACLES#
ELSE_IF_A:
	
	#Get base address of OB1_X, OB1_Y#
	la $s2, OB1_X
	la $s3, OB1_Y
	
	#Get address and value of OB1_SIZE #
	la $t9, OB1_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
LOOPY:	beq $t8, $t9, END_LOOPY
	
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
	
	j LOOPY

END_LOOPY:
	jr $ra


#__________FUNCTION__________#
move_left:
#Shifts obstacles to the left one unit#
	la $s2, OB1_X #Get base address of OB1_X#
	
	#Get address and value of OB1_SIZE #
	la $t9, OB1_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
FLOOP:	beq $t8, $t9, END_LOOPY
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB1_X#
	
	li $t2, -1
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j FLOOP

END_FLOOP:
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
	
	li $a0, 0
	jal draw_obj

game_loop:	
	
	#Erase Obstacle#
	li $a0, 1
	jal erase_obj
	#Update Obstacle#
	jal move_left
	#Draw Obstacle#
	li $a0, 0
	jal draw_obj
	
	#Check OB1#
	
	
	j game_loop
	
end:
	li $v0, 10 # terminate the program gracefullysyscall
	syscall
