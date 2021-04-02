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

debugging:	.asciiz	"Hello I am here\n"

SHIP:	.word	 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffaa00, 0xffaa00
SHIP_HIT:	.word	0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000
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

OB2_BIG:	.word	0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff
OB2_Y_BIG:	.space	16
OB2_X_BIG:	.space	16
OB2_SIZE_BIG: .word 4

OB3_BIG:	.word	0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff, 0x0000ff
OB3_Y_BIG:	.space	20
OB3_X_BIG:	.space	20
OB3_SIZE_BIG: .word 5


HIT_SCREEN_RIGHT:	.word	0
HIT_SCREEN_UP:	.word	0



HEALTH_BAR_BACKGROUND:	.word	0xff0011, 0xff0011, 0xff0011, 0xff0011, 0xff0011, 0xff0011, 0xff0011
HEALTH_BAR_SIZE:	.word	7

HEALTH_BAR:	.word	0x00ff00, 0x00ff00, 0x00ff00, 0x00ff00, 0x00ff00, 0x00ff00, 0x00ff00
NUM_COLLISION:	.word	7


HEALTH_X:	.word	12, 13, 14, 15, 16, 17, 18
HEALTH_Y:	.word	29, 29, 29, 29, 29, 29, 29


COUNTER:	.word	0
LIMIT:	.word	50
INITCOUNT:	.word	1

G_COLOR:	.word	0xffffff
G_SIZE:	.word	16
G_X:	.word	8, 7, 6, 5, 4, 4, 4, 4, 4, 5, 6, 7, 8, 8, 8, 7
G_Y:	.word	6, 6, 6, 6, 6, 7, 8, 9, 10, 10, 10, 10, 10, 9, 8, 8

A_COLOR:	.word	0xffffff
A_SIZE:	.word	14
A_X:	.word	11, 11, 11, 11, 11, 12, 13, 12, 13, 14, 14, 14, 14, 14
A_Y:	.word	10, 9, 8, 7, 6, 6, 6, 8, 8, 6, 7, 8, 9, 10

M_COLOR:	.word	0xffffff
M_SIZE:	.word	13
M_X:	.word	17, 17, 17, 17, 17, 21, 21, 21, 21, 21, 18, 19, 20
M_Y: .word	10, 9, 8, 7, 6, 10, 9, 8, 7, 6, 7, 8, 7

E_COLOR:	.word	0xffffff
E_SIZE:	.word	14
E_X:	.word	24, 24, 24, 24, 24, 25, 26, 27, 25, 26, 27, 25, 26, 27
E_Y:	.word	10, 9, 8, 7, 6, 6, 6, 6, 8, 8, 8, 10, 10, 10

O_COLOR:	.word	0xffffff
O_SIZE:	.word	14
O_X:	.word	8, 8, 8, 8, 8, 9, 10, 11, 9, 10, 11, 11, 11, 11
O_Y:	.word	17, 16, 15, 14, 13, 13, 13, 13, 17, 17, 17, 14, 15, 16

V_COLOR:	.word	0xffffff
V_SIZE:	.word	9
V_X:	.word	14, 14, 14, 15, 16, 17, 18, 18, 18
V_Y:	.word	13, 14, 15, 16, 17, 16, 15, 14, 13

e_COLOR:	.word	0xffffff
e_X:	.word	21, 22, 23, 24, 21, 21, 22, 23, 24, 21, 21, 22, 23, 24
e_Y:	.word	13, 13, 13, 13, 14, 15, 15, 15, 15, 16, 17, 17, 17, 17

R_COLOR:	.word	0xffffff
R_SIZE:	.word 15
R_X:	.word	27, 27, 27, 27, 27, 28, 28, 29, 29, 29, 29, 30, 30, 30, 30
R_Y:	.word	17, 16, 15, 14, 13, 15, 13, 17, 16, 15, 13, 17, 15, 14, 13




.eqv BASE_ADDRESS 0x10008000
.eqv KEYBOARD_ADDRESS 0xffff0000
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
	#li $t9, 3
	#beq $a0, $t9, DRAW_ELSE_IF_4
	#li $t9, 4
	#beq $a0, $t9, DRAW_ELSE_IF_5
	li $t9, 6
	beq $a0, $t9, DRAW_ELSE_IF_6
	li $t9, 7
	beq $a0, $t9, DRAW_ELSE_IF_7
	li $t9, 8
	beq $a0, $t9, DRAW_ELSE_IF_8
	
	#Will only happen when counter > limit#
	li $t9, 9
	beq $a0, $t9, DRAW_ELSE_IF_9
	li $t9, 10
	beq $a0, $t9, DRAW_ELSE_IF_10
	li $t9, 11
	beq $a0, $t9, DRAW_ELSE_IF_11

	#Draw SHIP#
	#Only occurs when $a0 is 5#
	
	la $s1, SHIP #Load SHIP address into $s1#
	
	#Get base address of SHIP_X, SHIP_Y#
	la $s2, SHIP_X
	la $s3, SHIP_Y
	
	#Get address and value of SHIP_SIZE#
	la $t9, SHIP_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP:
	
	beq $t8, $t9, END_DRAW_LOOP
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for SHIP_X#
	add $s6, $s3, $t1 #Offset for SHIP_Y#
	add $s7, $s1, $t1 #Offset for SHIP#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of SHIP into $s0#
	
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
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP
	
END_DRAW_LOOP:
	
	jr $ra
	

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
#DRAW_ELSE_IF_4:

#Draw OB5#
#DRAW_ELSE_IF_5:

#Draw SHIP_HIT#
DRAW_ELSE_IF_6:	
	la $s1, SHIP_HIT #Load SHIP_HIT address into $s1#
	
	#Get base address of SHIP_X, SHIP_Y#
	la $s2, SHIP_X
	la $s3, SHIP_Y
	
	#Get address and value of SHIP_SIZE#
	la $t9, SHIP_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP6:
	
	beq $t8, $t9, END_DRAW_LOOP6
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for SHIP_X#
	add $s6, $s3, $t1 #Offset for SHIP_Y#
	add $s7, $s1, $t1 #Offset for SHIP#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of SHIP into $s0#
	
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
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP6
	
END_DRAW_LOOP6:
	
	jr $ra
	
	
#Draw Background of Health Bar#
DRAW_ELSE_IF_7:

	la $s1, HEALTH_BAR_BACKGROUND #Load background of health bar address into $s1#
	
	#Get base address of HEALTH_X, HEALTH_Y#
	la $s2, HEALTH_X
	la $s3, HEALTH_Y
	
	#Get address and value of HEALTH_BAR_SIZE#
	la $t9, HEALTH_BAR_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP7:
	
	beq $t8, $t9, END_DRAW_LOOP7
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for HEALTH_X#
	add $s6, $s3, $t1 #Offset for HEALTH_Y#
	add $s7, $s1, $t1 #Offset for HEALTH_BAR_BACKGROUND#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of HEALTH_BAR_BACKGROUND into $s0#
	
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
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP7
	
END_DRAW_LOOP7:
	
	jr $ra


#Draw Health Bar#
	
DRAW_ELSE_IF_8:

	la $s1, HEALTH_BAR #Load health bar address into $s1#
	
	#Get base address of HEALTH_X, HEALTH_Y#
	la $s2, HEALTH_X
	la $s3, HEALTH_Y
	
	#Get address and value of NUM_COLLISION#
	la $t9, NUM_COLLISION
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP8:
	
	beq $t8, $t9, END_DRAW_LOOP8
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for HEALTH_X#
	add $s6, $s3, $t1 #Offset for HEALTH_Y#
	add $s7, $s1, $t1 #Offset for HEALTH_BAR#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of HEALTH_BAR into $s0#
	
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
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP8

END_DRAW_LOOP8:
	
	jr $ra

#Draw GameOver#
DRAW_ELSE_IF_9:

	la $s1, G_COLOR #Load G_COLOR address into $s1#
	
	#Get base address of G_X, G_Y#
	la $s2, G_X
	la $s3, G_Y
	
	#Get address and value of G_SIZE#
	la $t9, G_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP9:
	
	beq $t8, $t9, END_DRAW_LOOP9
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for G_X#
	add $s6, $s3, $t1 #Offset for G_Y#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s1) #load colour value of G_COLOR into $s0#
	
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
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP9
	
END_DRAW_LOOP9:
	
	la $s1, A_COLOR #Load A_COLOR address into $s1#
	
	#Get base address of A_X, A_Y#
	la $s2, A_X
	la $s3, A_Y
	
	#Get address and value of A_SIZE#
	la $t9, A_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP10:
	
	beq $t8, $t9, END_DRAW_LOOP10
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for A_X#
	add $s6, $s3, $t1 #Offset for A_Y#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s1) #load colour value of A_COLOR into $s0#
	
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
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP10
	
END_DRAW_LOOP10:
	
	la $s1, M_COLOR #Load M_COLOR address into $s1#
	
	#Get base address of M_X, M_Y#
	la $s2, M_X
	la $s3, M_Y
	
	#Get address and value of M_SIZE#
	la $t9, M_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP11:
	
	beq $t8, $t9, END_DRAW_LOOP11
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for M_X#
	add $s6, $s3, $t1 #Offset for M_Y#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s1) #load colour value of M_COLOR into $s0#
	
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations for offset of framebuffer#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	addu $t7, $t6, $t0 #Add offset address calculated#
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP11
	
END_DRAW_LOOP11:
	
	la $s1, E_COLOR #Load E_COLOR address into $s1#
	
	#Get base address of E_X, E_Y#
	la $s2, E_X
	la $s3, E_Y
	
	#Get address and value of E_SIZE#
	la $t9, E_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP12:
	
	beq $t8, $t9, END_DRAW_LOOP12
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for E_X#
	add $s6, $s3, $t1 #Offset for E_Y#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s1) #load colour value of E_COLOR into $s0#
	
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
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP12
	
END_DRAW_LOOP12:

	la $s1, O_COLOR #Load O_COLOR address into $s1#
	
	#Get base address of O_X, O_Y#
	la $s2, O_X
	la $s3, O_Y
	
	#Get address and value of O_SIZE#
	la $t9, O_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP13:
	
	beq $t8, $t9, END_DRAW_LOOP13
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for O_X#
	add $s6, $s3, $t1 #Offset for O_Y#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s1) #load colour value of O_COLOR into $s0#
	
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations for offset of framebuffer#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	addu $t7, $t6, $t0 #Add offset address calculated#
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP13
	
END_DRAW_LOOP13:

	la $s1, V_COLOR #Load V_COLOR address into $s1#
	
	#Get base address of G_X, G_Y#
	la $s2, V_X
	la $s3, V_Y
	
	#Get address and value of V_SIZE#
	la $t9, V_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP14:
	
	beq $t8, $t9, END_DRAW_LOOP14
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for V_X#
	add $s6, $s3, $t1 #Offset for V_Y#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s1) #load colour value of V_COLOR into $s0#
	
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations for offset of framebuffer#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	addu $t7, $t6, $t0 #Add offset address calculated#
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP14
	
END_DRAW_LOOP14:

	la $s1, e_COLOR #Load e_COLOR address into $s1#
	
	#Get base address of e_X, e_Y#
	la $s2, e_X
	la $s3, e_Y
	
	#Get address and value of E_SIZE#
	la $t9, E_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP15:
	
	beq $t8, $t9, END_DRAW_LOOP15
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for e_X#
	add $s6, $s3, $t1 #Offset for e_Y#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s1) #load colour value of e_COLOR into $s0#
	
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations for offset of framebuffer#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	addu $t7, $t6, $t0 #Add offset address calculated#
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP15
	
END_DRAW_LOOP15:
	
	la $s1, R_COLOR #Load R_COLOR address into $s1#
	
	#Get base address of R_X, R_Y#
	la $s2, R_X
	la $s3, R_Y
	
	#Get address and value of R_SIZE#
	la $t9, R_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP16:
	
	beq $t8, $t9, END_DRAW_LOOP16
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for R_X#
	add $s6, $s3, $t1 #Offset for R_Y#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s1) #load colour value of R_COLOR into $s0#
	
	#Set Constant#
	li $t4, WIDTH
	li $t5, 4
	
	#Calculations for offset of framebuffer#
	mult $t3, $t4
	mflo $t6
	add $t6, $t6, $t2
	mult $t6, $t5
	mflo $t6
	
	addu $t7, $t6, $t0 #Add offset address calculated#
	
	sw $s0, ($t7)
	
	addi $t8, $t8, 1
	
	j DRAW_LOOP16
	
END_DRAW_LOOP16:

	jr $ra

#Draw OB4#
DRAW_ELSE_IF_10:
	
	la $s1, OB2_BIG #Load OB2_BIG address into $s1#
	
	#Get base address of OB2_X_BIG, OB2_Y_BIG#
	la $s2, OB2_X_BIG
	la $s3, OB2_Y_BIG
	
	#Get address and value of OB2_SIZE_BIG #
	la $t9, OB2_SIZE_BIG
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP17:	
	
	beq $t8, $t9, END_DRAW_LOOP17
	
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
	
	j DRAW_LOOP17

END_DRAW_LOOP17:	
	
	jr $ra

DRAW_ELSE_IF_11:
	
	la $s1, OB3_BIG #Load OB3_BIG address into $s1#
	
	#Get base address of OB3_X_BIG, OB3_Y_BIG#
	la $s2, OB3_X_BIG
	la $s3, OB3_Y_BIG
	
	#Get address and value of OB2_SIZE_BIG #
	la $t9, OB3_SIZE_BIG
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
DRAW_LOOP18:	
	
	beq $t8, $t9, END_DRAW_LOOP18
	
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
	
	j DRAW_LOOP18

END_DRAW_LOOP18:	
	
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
	#li $t9, 6
	#beq $a0, $t9, ERA_ELSE_IF_6
	li $t9, 8
	beq $a0, $t9, ERA_ELSE_IF_8
	li $t9, 9
	beq $a0, $t9, ERA_ELSE_IF_9
	li $t9, 10
	beq $a0, $t9, ERA_ELSE_IF_10
	li $t9, 11
	beq $a0, $t9, ERA_ELSE_IF_11
	
	#Erase SHIP#
	#only occurs when $a0 is 5#
	la $s1, SHIP #Load SHIP address into $s1#
	
	#Get base address of SHIP_X, SHIP_Y#
	la $s2, SHIP_X
	la $s3, SHIP_Y
	
	#Get address and value of SHIP_SIZE #
	la $t9, SHIP_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
ERASE_LOOP:	

	beq $t8, $t9, END_ERASE_LOOP
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for SHIP_X#
	add $s6, $s3, $t1 #Offset for SHIP_Y#
	add $s7, $s1, $t1 #Offset for SHIP#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of SHIP into $s0#
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
	sw $s0, ($t7) #write colour value of SHIP[0] into ($t0 + 0)#
	
	addi $t8, $t8, 1 
	
	j ERASE_LOOP

END_ERASE_LOOP:
	jr $ra

#Erase OBSTACLES#

#Erase OB1#
ERA_ELSE_IF_1:
	
	la $s1, OB1
	
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
	
	la $s1, OB2

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

	la $s1, OB3
	
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

#Erase Health Bar#
ERA_ELSE_IF_8:

	la $s1, HEALTH_BAR
	
	#Get base address of HEALTH_X, HEALTH_Y#
	la $s2, HEALTH_X
	la $s3, HEALTH_Y
	
	#Get address and value of NUM_COLLISION #
	la $t9, NUM_COLLISION
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
ERASE_LOOP8:	

	beq $t8, $t9, END_ERASE_LOOP8
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for HEALTH_X#
	add $s6, $s3, $t1 #Offset for HEALTH_Y#
	add $s7, $s1, $t1 #Offset for HEALTH_BAR#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of HEALTH_BAR into $s0#
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
	
	j ERASE_LOOP8

END_ERASE_LOOP8:
	
	jr $ra


#Erase Health Bar#
ERA_ELSE_IF_9:

	la $s1, HEALTH_BAR_BACKGROUND
	
	#Get base address of HEALTH_X, HEALTH_Y#
	la $s2, HEALTH_X
	la $s3, HEALTH_Y
	
	#Get address and value of NUM_COLLISION #
	la $t9, HEALTH_BAR_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
ERASE_LOOP9:	

	beq $t8, $t9, END_ERASE_LOOP9
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for HEALTH_X#
	add $s6, $s3, $t1 #Offset for HEALTH_Y#
	add $s7, $s1, $t1 #Offset for HEALTH_BAR#
	
	lw $t2, ($s5) #puts X value into $t2#
	lw $t3, ($s6) #puts Y value into $t3#
	lw $s0, ($s7) #load colour value of HEALTH_BAR into $s0#
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
	
	j ERASE_LOOP9

END_ERASE_LOOP9:
	
	jr $ra

#Erase OB4#
ERA_ELSE_IF_10:
	
	la $s1, OB2_BIG
	
	#Get base address of OB2_X_BIG, OB2_Y_BIG#
	la $s2, OB2_X_BIG
	la $s3, OB2_Y_BIG
	
	#Get address and value of OB2_SIZE_BIG #
	la $t9, OB2_SIZE_BIG
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
ERASE_LOOP10:	

	beq $t8, $t9, END_ERASE_LOOP10
	
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
	
	j ERASE_LOOP10

END_ERASE_LOOP10:
	
	jr $ra

#Erase OB5#
ERA_ELSE_IF_11:
	
	la $s1, OB3_BIG
	
	#Get base address of OB3_X_BIG, OB3_Y_BIG#
	la $s2, OB3_X_BIG
	la $s3, OB3_Y_BIG
	
	#Get address and value of OB1_SIZE_BIG #
	la $t9, OB3_SIZE_BIG
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
ERASE_LOOP11:	

	beq $t8, $t9, END_ERASE_LOOP11
	
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
	
	j ERASE_LOOP11

END_ERASE_LOOP11:
	
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
	li $t2, -2 #Moves at -2 units fast#
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j MOVE_LOOP3

END_MOVE_LOOP3:


	#Check counter
	la $t1, COUNTER
	lw $t2, ($t1)
	la $t3, LIMIT
	lw $t4, ($t3)
	
	bgt $t2, $t4, move_hard_ob #checks if the counter is greater than the limit
	
	jr $ra
	
move_hard_ob:
	
	#OB4#
	la $s2, OB2_X_BIG #Get base address of OB2_X_BIG#
	
	#Get address and value of OB2_SIZE_BIG #
	la $t9, OB2_SIZE_BIG
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
MOVE_LOOP4:	
	
	beq $t8, $t9, END_MOVE_LOOP4
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB1_X#
	
	#Calculation to shift unity left by 1#
	li $t2, -2 #Moves at -3 units fast#
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j MOVE_LOOP4

END_MOVE_LOOP4:

	#OB5#
	la $s2, OB3_X_BIG #Get base address of OB2_X_BIG#
	
	#Get address and value of OB2_SIZE_BIG #
	la $t9, OB3_SIZE_BIG
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
MOVE_LOOP5:	
	
	beq $t8, $t9, END_MOVE_LOOP5
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for OB1_X#
	
	#Calculation to shift unity left by 1#
	li $t2, -3 #Moves at -3 units fast#
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j MOVE_LOOP5

END_MOVE_LOOP5:

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
	li $t9, 3
	beq $a1, $t9, SET_ELSE_IF_4
	li $t9, 4
	beq $a1, $t9, SET_ELSE_IF_5

	
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

SET_ELSE_IF_4:
	
	la $s2, OB2_X_BIG #Get base address of OB3_X#
	la $s1, OB2_Y_BIG #Get base address of OB3_Y#
	
	#Set X#
	li $t1, 30
	sw $t1, ($s2)
	li $t1, 31
	sw $t1, 4($s2)
	li $t1, 31
	sw $t1, 8($s2)
	li $t1, 32
	sw $t1, 12($s2)

	
	
	#Set Y#
	add $t1, $zero, $a0
	sw $t1, ($s1)
	
	li $t2, -1
	add $t1, $a0, $t2 
	sw $t1, 4($s1)
	
	add $t1, $zero, $a0
	sw $t1, 8($s1)
	
	add $t1, $zero, $a0
	sw $t1, 12($s1)
	
	
	jr $ra

SET_ELSE_IF_5:
	
	la $s2, OB3_X_BIG #Get base address of OB3_X_BIG#
	la $s1, OB3_Y_BIG #Get base address of OB3_Y_BIG#
	
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

	
	
	#Set Y#
	add $t1, $zero, $a0
	sw $t1, ($s1)
	
	add $t1, $zero, $a0
	sw $t1, 4($s1)
	
	li $t2, 1
	add $t1, $a0, $t2 
	sw $t1, 8($s1)
	
	add $t1, $zero, $a0
	sw $t1, 12($s1)
	
	li $t2, -1
	add $t1, $a0, $t2
	sw $t1, 16($s1)
	
	
	jr $ra
	
#__________FUNCTION__________#
#moves ship in direction of keyboard input#
#takes in $a0 to deterine the keypress and direction#
move_ship:

	#Determine Direction#
	li $t9, 0 #0 means 'a' is pressed#
	beq $a0, $t9, MOVE_SHIP_LEFT
	li $t9, 1
	beq $a0, $t9, MOVE_SHIP_DOWN
	li $t9, 2
	beq $a0, $t9, MOVE_SHIP_RIGHT
	li $t9, 3
	beq $a0, $t9, MOVE_SHIP_UP


MOVE_SHIP_LEFT:
	la $s2, SHIP_X #Get base address of SHIP_X#
	
	#Get address and value of SHIP_SIZE #
	la $t9, SHIP_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
MOVE_SHIP_LOOP1:	
	
	beq $t8, $t9, END_MOVE_SHIP_LOOP1
	
	#Calculation to shift unity left by 1#
	li $t2, -1 #Moves at -1 units fast#
	lw $t3, 20($s2) #MUST CHECK THE LAST UNIT THAT IS FARTHEST TO THE LEFT#
	add $t3, $t3, $t2
	bltz $t3, END_MOVE_SHIP_LOOP1 #Checks to make sure the ship does not go off screen#
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for SHIP_X#
	
	#Calculation to shift unity left by 1#
	li $t2, -1 #Moves at -1 units fast#
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	#bltz $t3, END_MOVE_SHIP_LOOP1 #Checks to make sure the ship does not go off screen#
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j MOVE_SHIP_LOOP1

END_MOVE_SHIP_LOOP1:
	
	#Makes sure that HIT_SCREEN_RIGHT is not more than 1 anymore#
	la $t4, HIT_SCREEN_RIGHT
	sw $zero, ($t4)
	
	jr $ra


MOVE_SHIP_DOWN:
	la $s2, SHIP_Y #Get base address of SHIP_Y#
	
	#Get address and value of SHIP_SIZE #
	la $t9, SHIP_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
MOVE_SHIP_LOOP2:	
	
	beq $t8, $t9, END_MOVE_SHIP_LOOP2
	
	#Calculation to shift unity left by 1#
	li $t2, 1 #Moves at 1 units fast#
	lw $t3, 20($s2) #MUST CHECK THE LAST UNIT THAT IS FARTHEST TO THE LEFT#
	add $t3, $t3, $t2
	li $t5, 31 #Constant for 31#
	bgt $t3, $t5, END_MOVE_SHIP_LOOP2 #Checks to make sure the ship does not go off screen#
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for SHIP_X#
	
	#Calculation to shift unity left by 1#
	li $t2, 1 #Moves at 1 units fast#
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	#bltz $t3, END_MOVE_SHIP_LOOP2 #Checks to make sure the ship does not go off screen#
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j MOVE_SHIP_LOOP2

END_MOVE_SHIP_LOOP2:
	
	la $t2, HIT_SCREEN_UP
	sw $zero, ($t2)
	
	jr $ra
	
	
MOVE_SHIP_RIGHT:
	la $s2, SHIP_X #Get base address of SHIP_X#
	
	#Get address and value of SHIP_SIZE #
	la $t9, SHIP_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
MOVE_SHIP_LOOP3:	
	
	beq $t8, $t9, END_MOVE_SHIP_LOOP3
	
	#Calculation to shift unity left by 1#
	li $t2, 1 #Moves at 1 units fast#
	lw $t3, 12($s2) #MUST CHECK THE UNIT THAT IS FARTHEST TO THE RIGHT#
	add $t3, $t3, $t2
	li $t5, 31
	bgt $t3, $t5, FILL_REMAINDER1 #Checks to make sure the ship does not go off screen#
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for SHIP_X#
	
	#Calculation to shift unity left by 1#
	li $t2, 1 #Moves at 1 units fast#
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	#bltz $t3, END_MOVE_SHIP_LOOP1 #Checks to make sure the ship does not go off screen#
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j MOVE_SHIP_LOOP3

FILL_REMAINDER1:

	la $t4, HIT_SCREEN_RIGHT #Checks if this is the first time right side is outside#
	lw $t5, ($t4)
	
	beq $t5, 1, END_MOVE_SHIP_LOOP3 #If it is not the first time then don't execute this code#
	
	#Calculate movement of unit but stores it directly into the units#
	li $t2, 1 #Moves at 1 units fast#
	lw $t3, 16($s2)
	add $t3, $t3, $t2
	sw $t3, 16($s2)
	lw $t3, 20($s2)
	add $t3, $t3, $t2
	sw $t3, 20($s2)
	
	sw $t2, ($t4) #Record that the right screen has been hit more than once#
	
	j END_MOVE_SHIP_LOOP3
	

END_MOVE_SHIP_LOOP3:
	
	jr $ra


MOVE_SHIP_UP:
	la $s2, SHIP_Y #Get base address of SHIP_Y#
	
	#Get address and value of SHIP_SIZE #
	la $t9, SHIP_SIZE
	lw $t9, ($t9)
	
	li $t8, 0 #$t8 is i#
	
MOVE_SHIP_LOOP4:	
	
	beq $t8, $t9, END_MOVE_SHIP_LOOP4
	
	#Calculation to shift unity left by 1#
	li $t2, -1 #Moves at -1 units fast#
	lw $t3, 16($s2) #MUST CHECK THE LAST UNIT THAT IS FARTHEST TO THE LEFT#
	add $t3, $t3, $t2
	bltz $t3, FILL_REMAINDER2 #Checks to make sure the ship does not go off screen#
	
	sll $t1, $t8, 2 #$t1 has the offset#
	add $s5, $s2, $t1 #Offset for SHIP_X#
	
	#Calculation to shift unity left by 1#
	li $t2, -1 #Moves at -1 units fast#
	lw $t3, ($s5)
	add $t3, $t3, $t2
	
	#bltz $t3, END_MOVE_SHIP_LOOP1 #Checks to make sure the ship does not go off screen#
	sw $t3, ($s5)
	
	addi $t8, $t8, 1 
	
	j MOVE_SHIP_LOOP4

FILL_REMAINDER2:
	
	la $t4, HIT_SCREEN_UP #Checks if this is the first side top of ship is outside#
	lw $t5, ($t4)
	
	beq $t5, 1, END_MOVE_SHIP_LOOP4 #If it is not then don't execute this code#
	
	li $t2, -1
	lw $t3 20($s2)
	add $t3, $t2, $t3
	sw $t3, 20($s2)
	
	li $t7, 1
	sw $t7, ($t4)

END_MOVE_SHIP_LOOP4:
	
	jr $ra

#__________FUNCTION__________#
#checks for collision between obstacles#
#returns 1 for $v0 if there is a collision#
#returns 0 for $v0 if there is not a collision#
check_collision:
	#Load base address of SHIP_X and SHIP_Y#
	la $t1, SHIP_X
	la $t2, SHIP_Y
	la $t8, SHIP_SIZE
	lw $t8, ($t8)
	
	#Check collision with OB1#
	la $t3, OB1_X
	la $t4, OB1_Y
	la $t9, OB1_SIZE
	lw $t9, ($t9)
	
	li $s0, 0 #$s0 is i#
	
COLLISION_LOOP1:
	beq $s0, $t8, END_OF_COLLISION_LOOP1
	
	sll $s2, $s0, 2 #$s2 has the offset#
	add $s4, $s2, $t1 #Offset for SHIP_X#
	add $s5, $s2, $t2 #Offset for SHIP_Y#
	
	li $s1, 0 #$s1 is j#

INNER_COLLISION_LOOP1:
	beq $s1, $t9, END_OF_INNER_COLLISION_LOOP1
	
	sll $s3, $s1, 2 #$s3 has the offset#
	add $s6, $s3, $t3 #Offset for OB1_X#
	add $s7, $s3, $t4 #Offset for OB1_Y#
	
	#Check ship x and ob1 x#
	lw $t5, ($s4)
	lw $t6, ($s6)
	
	bne $t5, $t6, NO_HIT 
	
	#Check ship y and ob1 y#
	lw $t5, ($s5)
	lw $t6, ($s7)
	
	bne $t5, $t6, NO_HIT
	
	li $v0, 1
	
	jr $ra
	
NO_HIT:
	addi $s1, $s1, 1 
	j INNER_COLLISION_LOOP1
	

END_OF_INNER_COLLISION_LOOP1:
	
	addi $s0, $s0, 1 
	j COLLISION_LOOP1
	
END_OF_COLLISION_LOOP1:

	#Check collision with OB2#
	la $t3, OB2_X
	la $t4, OB2_Y
	la $t9, OB2_SIZE
	lw $t9, ($t9)
	
	li $s0, 0 #$s0 is i#
	
COLLISION_LOOP2:
	beq $s0, $t8, END_OF_COLLISION_LOOP2
	
	sll $s2, $s0, 2 #$s2 has the offset#
	add $s4, $s2, $t1 #Offset for SHIP_X#
	add $s5, $s2, $t2 #Offset for SHIP_Y#
	
	li $s1, 0 #$s1 is j#

INNER_COLLISION_LOOP2:
	beq $s1, $t9, END_OF_INNER_COLLISION_LOOP2
	
	sll $s3, $s1, 2 #$s3 has the offset#
	add $s6, $s3, $t3 #Offset for OB2_X#
	add $s7, $s3, $t4 #Offset for OB2_Y#
	
	#Check ship x and ob1 x#
	lw $t5, ($s4)
	lw $t6, ($s6)
	
	bne $t5, $t6, NO_HIT2
	
	#Check ship y and ob1 y#
	lw $t5, ($s5)
	lw $t6, ($s7)
	
	bne $t5, $t6, NO_HIT2	
	
	li $v0, 1
	
	jr $ra
	
NO_HIT2:
	addi $s1, $s1, 1 
	j INNER_COLLISION_LOOP2
	

END_OF_INNER_COLLISION_LOOP2:
	
	addi $s0, $s0, 1 
	j COLLISION_LOOP2
	
END_OF_COLLISION_LOOP2:
	
	#Check collision with OB3#
	la $t3, OB3_X
	la $t4, OB3_Y
	la $t9, OB3_SIZE
	lw $t9, ($t9)
	
	li $s0, 0 #$s0 is i#
	
COLLISION_LOOP3:
	beq $s0, $t8, END_OF_COLLISION_LOOP3
	
	sll $s2, $s0, 2 #$s2 has the offset#
	add $s4, $s2, $t1 #Offset for SHIP_X#
	add $s5, $s2, $t2 #Offset for SHIP_Y#
	
	li $s1, 0 #$s1 is j#

INNER_COLLISION_LOOP3:
	beq $s1, $t9, END_OF_INNER_COLLISION_LOOP3
	
	sll $s3, $s1, 2 #$s3 has the offset#
	add $s6, $s3, $t3 #Offset for OB3_X#
	add $s7, $s3, $t4 #Offset for OB3_Y#
	
	#Check ship x and ob1 x#
	lw $t5, ($s4)
	lw $t6, ($s6)
	
	bne $t5, $t6, NO_HIT3
	
	#Check ship y and ob3 y#
	lw $t5, ($s5)
	lw $t6, ($s7)
	
	bne $t5, $t6, NO_HIT3
	
	li $v0, 1
	
	jr $ra
	
NO_HIT3:
	addi $s1, $s1, 1 
	j INNER_COLLISION_LOOP3
	

END_OF_INNER_COLLISION_LOOP3:
	
	addi $s0, $s0, 1 
	j COLLISION_LOOP3
	
END_OF_COLLISION_LOOP3:	
	
	#Check counter
	la $t5, COUNTER
	lw $t6, ($t5)
	la $t3, LIMIT
	lw $t7, ($t3)
	
	bgt $t6, $t7, check_harder_ob #checks if the counter is greater than the limit
	
	li $v0, 0
	jr $ra
	
check_harder_ob:
	
	#li $v0, 4
	#la $a0, debugging
	#syscall
	
	#Check collision with OB4#
	la $t3, OB2_X_BIG
	la $t4, OB2_Y_BIG
	la $t9, OB2_SIZE_BIG
	lw $t9, ($t9)
	
	li $s0, 0 #$s0 is i#
	
COLLISION_LOOP4:
	beq $s0, $t8, END_OF_COLLISION_LOOP4
	
	sll $s2, $s0, 2 #$s2 has the offset#
	add $s4, $s2, $t1 #Offset for SHIP_X#
	add $s5, $s2, $t2 #Offset for SHIP_Y#
	
	li $s1, 0 #$s1 is j#

INNER_COLLISION_LOOP4:
	beq $s1, $t9, END_OF_INNER_COLLISION_LOOP4
	
	sll $s3, $s1, 2 #$s3 has the offset#
	add $s6, $s3, $t3 #Offset for OB3_X#
	add $s7, $s3, $t4 #Offset for OB3_Y#
	
	#Check ship x and ob1 x#
	lw $t5, ($s4)
	lw $t6, ($s6)
	
	bne $t5, $t6, NO_HIT4
	
	#Check ship y and ob3 y#
	lw $t5, ($s5)
	lw $t6, ($s7)
	
	bne $t5, $t6, NO_HIT4
	
	li $v0, 1
	jr $ra
	
NO_HIT4:
	addi $s1, $s1, 1 
	j INNER_COLLISION_LOOP4
	

END_OF_INNER_COLLISION_LOOP4:
	
	addi $s0, $s0, 1 
	j COLLISION_LOOP4
	
END_OF_COLLISION_LOOP4:
	
	#Check collision with OB5#
	la $t3, OB3_X_BIG
	la $t4, OB3_Y_BIG
	la $t9, OB3_SIZE_BIG
	lw $t9, ($t9)
	
	li $s0, 0 #$s0 is i#
	
COLLISION_LOOP5:
	beq $s0, $t8, END_OF_COLLISION_LOOP5
	
	sll $s2, $s0, 2 #$s2 has the offset#
	add $s4, $s2, $t1 #Offset for SHIP_X#
	add $s5, $s2, $t2 #Offset for SHIP_Y#
	
	li $s1, 0 #$s1 is j#

INNER_COLLISION_LOOP5:
	beq $s1, $t9, END_OF_INNER_COLLISION_LOOP5
	
	sll $s3, $s1, 2 #$s3 has the offset#
	add $s6, $s3, $t3 #Offset for OB3_X#
	add $s7, $s3, $t4 #Offset for OB3_Y#
	
	#Check ship x and ob1 x#
	lw $t5, ($s4)
	lw $t6, ($s6)
	
	bne $t5, $t6, NO_HIT5
	
	#Check ship y and ob3 y#
	lw $t5, ($s5)
	lw $t6, ($s7)
	
	bne $t5, $t6, NO_HIT5
	
	li $v0, 1
	jr $ra
	
NO_HIT5:
	addi $s1, $s1, 1 
	j INNER_COLLISION_LOOP5
	

END_OF_INNER_COLLISION_LOOP5:
	
	addi $s0, $s0, 1 
	j COLLISION_LOOP5
	
END_OF_COLLISION_LOOP5:
	
	li $v0, 0
	jr $ra
	
	

#__________FUNCTION__________#
main:
	
start:	
	#Setup for framebuffer#
	li $t0, BASE_ADDRESS # $t0 stores the base address for display
	
	
	#Clear Entire Screen#
	li $t1, 0x000000 #load black color into $t1
	add $t2, $t0, $zero #load address of display into $t2
	li $t3, 4096 #max size of framebuffer
	li $t4, 0 #i
clear_loop:
	beq $t4, $t3, end_clear_loop
	add $t2, $t0, $t4 # add address of framebuffer by offset i
	sw $t1, 0($t2)  #store the color black into the address
	addi $t4, $t4, 4 #iterate i by 4
	
	j clear_loop
	
end_clear_loop:
	
	#Initialize and Draw Spaceship#
	
	#Ship X#
	la $t3, SHIP_X
	li $t2, 5
	sw $t2, 0($t3)
	li $t2, 5
	sw $t2, 4($t3)
	li $t2, 5
	sw $t2, 8($t3)
	li $t2, 6
	sw $t2, 12($t3)
	li $t2, 4
	sw $t2, 16($t3)
	li $t2, 4
	sw $t2, 20($t3)
	
	#Reinitialize Ship Y#
	la $t1, SHIP_Y
	li $t2, 15
	sw $t2, 0($t1)
	li $t2, 14
	sw $t2, 4($t1)
	li $t2, 16
	sw $t2, 8($t1)
	li $t2, 15
	sw $t2, 12($t1)
	li $t2, 14
	sw $t2, 16($t1)
	li $t2, 16
	sw $t2, 20($t1)
				
	li $a0, 5
	jal draw_obj
	
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
	
	
	#--Draw Healthbar Background--#
	li $a0, 7
	jal draw_obj
	
	#--Draw Healthbar--#
	li $a0, 8
	jal draw_obj
	
	
	#--Initialize NUM_COLLISION--#
	la $t8, NUM_COLLISION #get the address of NUM_COLLISION
	li $t9, 7
	sw $t9, 0($t8) #store the value of 7
	
	#--Initialize HIT_SCREEN_RIGHT--#
	la $t8, HIT_SCREEN_RIGHT
	sw $zero, 0($t8)
	
	#--Initialize HIT_SCREEN_UP--#
	la $t8, HIT_SCREEN_UP
	sw $zero, 0($t8)
	
	#--Initialize counter--#
	la $t8, COUNTER #get the address of COUNTER
	sw $zero, 0($t8) #store the value of 0
	
	#--Initialize initcount--#
	la $t8, INITCOUNT
	li $t7, 1
	sw $t7, 0($t8)

	
game_loop:	

	
	#Check counter
	la $t1, COUNTER
	lw $t2, ($t1)
	la $t3, LIMIT
	lw $t4, ($t3)
	
	la $t5, INITCOUNT
	lw $t6, ($t5)
	
	beqz $t6, erase_obs
	ble $t2, $t4, erase_obs #checks if the counter is greater than the limit
	
	#Only executes if counter > limit#
	
	#--Initialize and Draw OB4--#
	#Random Number Generation#
	li $v0, 42 #Generate random number with range, gives a random Y starting point for the leftmost unit#
	li $a0, 0
	li $a1, 31
	syscall
	#Set rest of coordinates from random Y#
	li $a1, 3
	jal set_coord 
	#Draw OB2#
	li $a0, 10
	jal draw_obj
	
	#--Initialize and Draw OB5--#
	#Random Number Generation#
	li $v0, 42 #Generate random number with range, gives a random Y starting point for the leftmost unit#
	li $a0, 0
	li $a1, 31
	syscall
	#Set rest of coordinates from random Y#
	li $a1, 4
	jal set_coord
	#Draw OB2#
	li $a0, 11
	jal draw_obj
	
	la $t5, INITCOUNT
	sw $zero, ($t5)
	
#Erase Obstacle#
erase_obs:
	#Erase OB1#
	li $a0, 0
	jal erase_obj
	#Erase OB2#
	li $a0, 1
	jal erase_obj
	#Erase OB3#
	li $a0, 2
	jal erase_obj

	#Check counter
	la $t1, COUNTER
	lw $t2, ($t1)
	la $t3, LIMIT
	lw $t4, ($t3)
	
	ble $t2, $t4, update_obs #checks if the counter is greater than the limit
	
	#Erase OB4#
	li $a0, 10
	jal erase_obj
	#Erase OB5#
	li $a0, 11
	jal erase_obj
	
#Update Obstacle#
update_obs:
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

	
	#Check counter
	la $t1, COUNTER
	lw $t2, ($t1)
	la $t3, LIMIT
	lw $t4, ($t3)
	
	ble $t2, $t4, er_ship #checks if the counter is greater than the limit
	
	#Check OB4#
	la $t1, OB2_X_BIG
	lw $t2, ($t1) #Get value of OB1_X[0] which is the first unit this makes it less distracting#
	bgez $t2, check4_end #if $t2 is greater than or equal zero#
	
	#Reposition OB4#
	#Random Number Generation#
	li $v0, 42 #Generate random number with range, gives a random Y starting point for the leftmost unit#
	li $a0, 0
	li $a1, 31
	syscall
	#Set rest of coordinates from random Y#
	li $a1, 3
	jal set_coord
	
check4_end: 

	#Draw Obstacle#
	li $a0, 10
	jal draw_obj
	
	
	#Check OB5#
	la $t1, OB3_X_BIG
	lw $t2, ($t1) #Get value of OB1_X[0] which is the first unit this makes it less distracting#
	bgez $t2, check5_end #if $t2 is greater than or equal zero#
	
	#Reposition OB5#
	#Random Number Generation#
	li $v0, 42 #Generate random number with range, gives a random Y starting point for the leftmost unit#
	li $a0, 0
	li $a1, 31
	syscall
	#Set rest of coordinates from random Y#
	li $a1, 4
	jal set_coord
	
check5_end: 

	#Draw Obstacle#
	li $a0, 11
	jal draw_obj

#Erase Ship#
er_ship:
	li $a0, 5
	jal erase_obj

#Listen for keyboard#
	li $t9, KEYBOARD_ADDRESS
	lw $t8, ($t9)
	beq $t8, $zero, nothing_pressed
	
	#Key was pressed#
	
	#Check for 'a' press#
	lw $t1, 4($t9)
	beq $t1, 0x61, respond_to_a
	
	#Check for 's' press#
	lw $t1, 4($t9)
	beq $t1, 0x73, respond_to_s
	
	#Check for 'd' press#
	lw $t1, 4($t9)
	beq $t1, 0x64, respond_to_d
	
	#Check for 'w' press#
	lw $t1, 4($t9)
	beq $t1, 0x77, respond_to_w
	
	#Check for 'p' press#
	lw $t1, 4($t9)
	beq $t1, 0x70, respond_to_p
	
	#No mapped keys were pressed#
	j nothing_pressed

respond_to_a:
	#move ship#
	li $a0, 0
	jal move_ship
	
	j nothing_pressed

respond_to_s:
	#move ship#
	li $a0, 1
	jal move_ship
	
	j nothing_pressed

respond_to_d:
	#move ship#
	li $a0, 2
	jal move_ship
	
	j nothing_pressed

respond_to_w:
	#move ship#
	li $a0, 3
	jal move_ship
	
	j nothing_pressed
	
respond_to_p:
	#Restart game#
	j start

nothing_pressed:

	#Draw Ship#
	li $a0, 5
	jal draw_obj

#Check for collisions#
	
	jal check_collision
	
	bne $v0, 1, SAFE
	
	#This only executes if $v0 is 1#
	la $t1, NUM_COLLISION #Get address of collision#
	lw $t3, ($t1) #Get value of num_collision#
	add $t2, $t3, -1 #iterate by -1#
	beqz $t2, GAME_OVER #if the number of collisions (ship health) is 0 then go to game over
	sw $t2, ($t1) #store value back#
	
	#Erase SHIP#
	li $a0, 5
	jal erase_obj
	
	#Draw SHIP_HIT#
	li $a0, 6
	jal draw_obj
	
	
SAFE:

#Erase Health Bar#
#Must do this before drawing both health bar and health bar background because if not then it will erase one of the two ecompletely#
	li $a0, 8
	jal erase_obj

#Draw Health Bar Background#
	li $a0, 7
	jal draw_obj

#Draw Health Bar#
	li $a0, 8
	jal draw_obj

#Iterate Counter by 1#
	la $t1, COUNTER
	lw $t2, ($t1)
	addi $t2, $t2, 1
	sw $t2, ($t1)

#sleep#
	li $v0, 32
	li $a0, 40
	syscall
	j game_loop

GAME_OVER:
	#Erase all the things#
	li $a0,0
	jal erase_obj
	li $a0,1
	jal erase_obj
	li $a0,2
	jal erase_obj
	li $a0,8
	jal erase_obj
	li $a0, 5
	jal erase_obj
	li $a0, 9 
	jal erase_obj
	li $a0, 10
	jal erase_obj
	li $a0, 11
	jal erase_obj
	
	#Draw Game Over#
	li $a0, 9
	jal draw_obj
	
RESTART_LOOP:
	li $t9, KEYBOARD_ADDRESS
	lw $t8, ($t9)
	beq $t8, $zero, game_over_loop
	
	#Key was pressed#
	
	#Check for 'p' press#
	lw $t1, 4($t9)
	beq $t1, 0x70, p_reset
	
	j RESTART_LOOP
	
p_reset:
	#Reset the game#
	li $t1, 0 #ensures that the value does not stay in $t1 when the game loop occurs again
	j start
	
game_over_loop:

	j RESTART_LOOP

end:
	li $v0, 10 # terminate the program
	syscall
