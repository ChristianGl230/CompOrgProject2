.data
    nullErrorMessage:	.asciiz "Input is empty."
    lengthErrorMessage: .asciiz "Input is too long."
    baseErrorMessage:   .asciiz "Invalid base-34 number."
    userInput:		.space 50
.text
    main:
	li $v0, 8
	la $a0, userInput
	li $a1, 50
	syscall
	
	removeLeading:  #Remove leading spaces
	li $t8, 32      
	lb $t9, 0($a0)
	beq $t8, $t9, removeFirst
	move $t9, $a0
	j checkLength
	
	checkLength:
	addi $t0, $t0, 0 
	addi $t1, $t1, 10
	add $t4, $t4, $a0
	
	lengthLoop:
	lb $t2, 0($a0)
	beqz $t2, done
	beq $t2, $t1, done
	addi $a0, $a0, 1
	addi $t0, $t0, 1
	j lengthLoop

	done:
	beqz $t0, nullError
	slti $t3, $t0, 5
	beqz $t3, lengthError
	move $a0, $t4
	j checkString

	nullError:
	li $v0, 4
	la $a0, nullErrorMessage
	syscall
	j exit
	
	lengthError:
	li $v0, 4
	la $a0, lengthErrorMessage
	syscall
	j exit

	checkString:
	lb $t5, 0($a0)
	beqz $t5, conversionInitializations
	beq $t5, $t1, conversionInitializations
	
