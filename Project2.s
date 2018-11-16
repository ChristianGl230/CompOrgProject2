.data
    nullErrorMessage:	.asciiz "Input is empty."
    lengthErrorMessage: .asciiz "Input is too long."
    baseErrorMessage:   .asciiz "Invalid base-34 number."
    userInput:		.space 50
.text
    main:
	li $v0, 8 
