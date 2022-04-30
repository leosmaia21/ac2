.equ SFR_BASE_HI, 0xBF88     # 16 MSbits of SFR area       
.equ TRISE, 0x6100            # TRISE address is 0xBF886100      
.equ PORTE, 0x6110            # PORTE address is 0xBF886110      
.equ LATE,  0x6120            # LATE  address is 0xBF886120
.equ TRISB, 0x6040
.equ PORTB, 0x6050
.equ LATB, 0x6060
    .data
    .text
    .globl main


main: 	lui $t0,SFR_BASE_HI
	 
	lw $t1,TRISB($t0)
	ori $t1,$t1,0x000F
	sw $t1,TRISB($t0)

	lw $t1,TRISE($t0)
	andi $t1,$t1,0xFFF0
	sw $t1, TRISE($t0)

loop: 	lw $t1,PORTB($t0)
	andi $t1,$t1,0x000F
	
	li $t6,0	

	andi $t5,$t1,8
	srl $t5,$t5,3
	or $t6,$t6,$t5

	andi $t5,$t1,4
	srl $t5,$t5,1
	or $t6,$t6,$t5

	andi $t5,$t1,2
	sll $t5,$t5,1
	or $t6,$t6,$t5

	andi $t5,$t1,1
	sll $t5,$t5,3
	or $t6,$t6,$t5

	lw $t3,LATE($t0)
	andi $t3,$t3,0xFFF0
	or $t3,$t3,$t6
	sw $t3,LATE($t0)
	j loop

 
	
	
	
