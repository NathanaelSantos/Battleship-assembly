
#Alocando um vetor na memoria principal
#.data 
#	h: .word 10
#	A: .word 0 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
#.text 
#	lw $t0, A+60($zero)
#addi $v0, $zero, 10
#syscall

  
  # sw $s0, myArray($zero ou  um numero inteiro)
  #	$zero tem que ser um registrador
  
  
  #exemplo de inserçao de um numero no array
  .data
  	meuArray:
  	.alig 2
  	.space 16 #aloca 4 espacos no array
  	
  .text
  		move $t0, $zero # indice do array
  		move $t1, $zero # valor a ser colocado no array
  		li $t2, 16 # tamanho do array
  	loop:
  		beq $t0,16, saiDoLoop
  		sw $t1, meuArray($t0)
  		addi $t0, $t0, 4
  		addi $t1, $t1,1
  		j loop
  		
  	saiDoLoop:
  		move $t0, $zero
  		imprime:
  			beq $t0, $t2, saiDaImpressao
  			li $v0,1
  			lw $a0, meuArray ($t0)
  			syscall
  			
  			addi $t0, $t0, 4
  			j imprime
  	saiDaImpressao:
  			
  		
  		
  		
  