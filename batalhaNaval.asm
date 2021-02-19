#Abra o Bitmap Display do Mars para a visualizacao do jogo
#Configure da seguinte forma:
#	Unit Width/Height in pixels = 16
#	Display Width/Height in Pixels = 512
#	Base address = 0x10000000 (global data)


.data	
	Destroyer_1:
  	.alig 2
  	.space 16 #aloca 4 espacos no array

	Destroyer_2:
  	.alig 2
  	.space 16 
  		
  	Destroyer_3:
  	.alig 2
  	.space 16 

	Destroyer_4:
  	.alig 2
  	.space 16 
  	
 	titulo: .asciiz "\n************* Batalha naval *************\n*****************************************\n**                MENU                 **\n**      1       P1 vs IA               **\n**      2       P1 vs P2               **\n**      3       EXIT                   **\n*****************************************\n*****************************************\n"
 	maquina_jogando: .asciiz "\nMaquina esta processando a jogada...\n"
 	linha: .asciiz "\n"
 	txt_jogada_H: .asciiz "Coluna: "
 	txt_jogada_V: .asciiz "Linha: "
 	txt_player1: .asciiz "Player 1, em qual posicao deseja jogar? "
 	txt_player2: .asciiz "Player 2, em qual posicao deseja jogar? "
 	txt_menu: .asciiz "Digite a opcao: "
 	msg_valor_menu: "\nATENCAO: Valor do menu deve ser menor ou igual a 3!\n"
 	 
 	txt_placar: .asciiz "\n*************     PLACAR    *************\n*****************************************\n**      PLAYER 1        PLAYER 2       **\n**         "            
 	espaco: .asciiz "               "

	player1: .asciiz "\n\nVencedor player 1\n"
	player2: .asciiz "\n\nVencedor player 2\n"

	msg_empate: .asciiz "\n********* Empate! *********\n"
	msg_mesma_coord: .asciiz "\n Jogada na mesma casa nao e permitido!\n"
	alerta_big_valor_coluna: .asciiz "\nATENCAO: Valor digitado pra coluna deve ser menor ou igual a 9!"
	alerta_big_valor_linha: .asciiz "\nATENCAO: Valor digitado pra linha deve ser menor ou igual a 8!\n"

.text
	
	# Gera destroyers 1
  	jal coordenada_inicial
  	loop:
  		beq $a2,16, saiDoLoop
  		sw $a0, Destroyer_1($a2)
  		addi $a2, $a2, 4
  		addi $a0, $a0,1
  		j loop		
  	saiDoLoop:

  	move $a2, $zero
  	lw $a0, Destroyer_1 ($a2)
  	move $k1,$a0
  	
  	imprime:
  		beq $a2, 16, saiDaImpressao
  		li $v0,1
  		lw $a0, Destroyer_1 ($a2)
  		syscall		
  		addi $a2, $a2, 4
  	j imprime
  	saiDaImpressao:jal quebra_linha
  	

	# Gera destroyers 2
  	jal coordenada_inicial
  	loop2:
  		beq $a3,16, saiDoLoop2
  		sw $a0, Destroyer_2($a3)
  		addi $a3, $a3, 4
  		addi $a0, $a0,1
  		j loop2		
  	saiDoLoop2:
  	
  	move $a3, $zero
  	lw $a0, Destroyer_2 ($a3)
  	move $s3,$a0
	  
  	imprime2:
  		beq $a3, 16, saiDaImpressao2
  		li $v0,1
  		lw $a0, Destroyer_2 ($a3)
  		syscall	
  		addi $a3, $a3, 4
  	j imprime2
  	saiDaImpressao2:jal quebra_linha

	# Gera destroyers 3
  	jal coordenada_inicial 
  	loop3:
  		beq $t7,16, saiDoLoop3
  		sw $a0, Destroyer_3($t7)
  		addi $t7, $t7, 4
  		addi $a0, $a0,1
  		j loop3		
  	saiDoLoop3:
	
  	move $t7, $zero
  	lw $a0, Destroyer_3 ($t7)
  	move $t3,$a0
  
  	imprime3:
  		beq $t7, 16, saiDaImpressao3
  		li $v0,1
  		lw $a0, Destroyer_3 ($t7)
  		syscall
  			
  		addi $t7, $t7, 4
  	j imprime3
  	saiDaImpressao3:jal quebra_linha

	# Gera destroyers 4
  	jal coordenada_inicial 
  	loop4:
  		beq $t0,16, saiDoLoop4
  		sw $a0, Destroyer_4($t0)
  		addi $t0, $t0, 4
  		addi $a0, $a0,1
  		j loop4	
  	saiDoLoop4:
	
  	move $t0, $zero
  	lw $a0, Destroyer_4 ($t0)
  	move $t9,$a0
  
  	imprime4:
  		beq $t0, 16, saiDaImpressao4
  		li $v0,1
  		lw $a0, Destroyer_4 ($t0)
  		syscall
  			
  		addi $t0, $t0, 4
  	j imprime4
  	saiDaImpressao4:jal quebra_linha

	
	# ========== Gera coordenadas das linhas ==========

	while: 
		#gera coordenada linha destroyers 1
		jal coordenada_inicial
		move $s6, $a0	
		#gera coordenada linha destroyers 2
		jal coordenada_inicial
		move $s5, $a0

		beq $s6, $s5, while

		#gera coordenada linha destroyers 3
		jal coordenada_inicial
		move $s4, $a0 
	
		beq $s4, $s6, while
		beq $s4, $s5, while

		#gera coordenada linha destroyers 4
		jal coordenada_inicial
		move $s7, $a0

		beq $s7, $s6, while
		beq $s7, $s5, while
		beq $s7, $s4, while

		j exit_while
    j while
	exit_while:

	main:	

		jal cores
		jal define_fundo
		jal desenha_tabuleiro
		jal titulo_jogo
		jal menu_game
			
		cores:
<<<<<<< HEAD
	     	addi $s1, $zero, 0x0040ff # Cor Azul (água)
	     	addi $s2, $zero, 0xff3333 # Cor VERMELHA (Bombas)
=======
	     	addi $s1, $zero, 0x0040ff # Cor azul (água)
	     	addi $s2, $zero, 0xff3333 # Cor vermelha (bombas)
>>>>>>> 4aa3e29652b6cd8285e443733094f45f6614fcf0
		jr $ra
	
		define_fundo:
	   		addi $t1, $zero, 1024	# Mapa possui 1024 quadrados
			add $t2, $zero, $t1
			lui $t2, 0x1000		# Posição inicial dos dados para serem pintados
		jr $ra

		titulo_jogo:	
			la $a0, titulo
			li $v0, 4
			syscall	
		jr $ra	
	
		menu_game:
			la $a0, txt_menu
			li $v0, 4
			syscall	
		
			li $v0, 5	#Opcao ditigitada
			syscall

			move $k0, $v0
			
			beq $v0, 3, exit_game
			
			sge $a0, $v0, 4
			beq $a0, 1, msg_menu
			
			jal placar
			jal jogada_player1
		jr $ra
	jr $ra

	coordenada_inicial:
  		li $v0, 42  # 42 codigo de chamada de sistema para gerar int
		li $a1, 7 	# $a1 limite
		syscall     # Gera o numero e coloca em $a0
	jr $ra
	
	placar:
		la $a0, txt_placar
		li $v0, 4
		syscall
		add $a0, $zero, $v1
		li $v0, 1
		syscall
		la $a0,espaco
		li $v0,4
		syscall
		add $a0, $zero, $t8
		li $v0, 1
		syscall	
	jr $ra

	jogada_mesma_coordenada:
		la $a0, msg_mesma_coord
		li $v0, 4
		syscall	
		addi $fp,$zero,0
	jr $ra

	jogada_player1:
	
		jal on_player_1
		la $a0, linha
		li $v0, 4
		syscall	
			jal quebra_linha
		la $a0, txt_player1
		syscall
			jal quebra_linha
		
		la $a0, txt_jogada_H
		li $v0, 4
		syscall	
		
		li $v0, 5	# Le a coluna 
		syscall
		move $t5,$v0 
			sge $a3,$t5,10
			beq $a3, 1, text_alerta_big_valor_coluna	
		
		alerta_valor_linha: la $a0, txt_jogada_V		
		li $v0, 4
		syscall	
				
		li $v0, 5	# Le a linha  
		syscall
		move $t6,$v0
			sge $a3,$t6, 9
			beq $a3,1,text_alerta_big_valor_linha

		jal conta
		jal conta2
		jal conta3
		jal conta4

		jal get_coluna
<<<<<<< HEAD
	
<<<<<<< HEAD
		beq, $k0,1,player1_acertou			
	
	        #Se escolhida a opcao 1 no menu, ou seja, p1 vs IA
	        beq $s7,1,maquina_escolhe_jogada
	        jal jogada_player2 #SE NAO         		                       
=======
    
=======
	  
>>>>>>> 4aa3e29652b6cd8285e443733094f45f6614fcf0
		beq, $fp,1,player1_acertou		

	        #Se escolhida a opcao 1 
	        beq $k0,1,maquina_escolhe_jogada
	        jal jogada_player2 #SE NAO 
	        		                       
>>>>>>> 326def65ae2f12b0c0a5b044228fe98fde5f2c03
	jr $ra
	
	
	text_alerta_big_valor_coluna:
		la $a0,  alerta_big_valor_coluna
		li $v0, 4
		syscall	
	j jogada_player1

	text_alerta_big_valor_linha:
		la $a0,  alerta_big_valor_linha
		li $v0, 4
		syscall	
	j alerta_valor_linha
		

	conta:
		move $a2, $zero
		print:
  			beq $a2, 16, exit
  			li $v0,1
  			lw $a0, Destroyer_1 ($a2)	
  				beq $t5,$a0,posicao	
  				addi $a2, $a2, 4
  		j print	
  	exit:jr $ra

	conta2:
		move $a3, $zero
		print2:
  			beq $a3, 16, exit2
  			li $v0,1
  			lw $a0, Destroyer_2 ($a3)	
  				beq $t5,$a0,posicao2	
  				addi $a3, $a3, 4
  		j print2	
  	exit2:jr $ra
  	
  	conta3:
		move $t7, $zero
		print3:
  			beq $t7, 16, exit3
  			li $v0,1
  			lw $a0, Destroyer_3 ($t7)	
  				beq $t5,$a0,posicao3	
  				addi $t7, $t7, 4
  		j print3	
  	exit3:jr $ra
	
	conta4:
		move $t0, $zero
		print4:
  			beq $t0, 16, exit4
  			li $v0,1
  			lw $a0, Destroyer_4 ($t0)	
  				beq $t5,$a0,posicao4	
  				addi $t0, $t0, 4
  		j print4	
  	exit4:jr $ra
  
	posicao:move $k1,$a0
	jr $ra

	posicao2:move $s3,$a0
	jr $ra

	posicao3:move $t3,$a0
	jr $ra

	posicao4:move $t9,$a0
	jr $ra

	
	player1_acertou:
		addi $v1,$v1,1
		
		jal placar
		add $a0, $v1, $t8
		beq $a0, 16, verifica_vencedor
		
		jal jogada_player1
	jr $ra
	
	jogada_player2:
	
		jal on_player_2
		la $a0,  linha
		li $v0, 4
		syscall	
		jal quebra_linha
		la $a0, txt_player2
		syscall
		jal quebra_linha
		
		la $a0, txt_jogada_H
		li $v0, 4
		syscall	
		
		li $v0, 5	#L� a coluna 
		syscall
		move  $t5,$v0 
		
		la $a0, txt_jogada_V		
		li $v0, 4
		syscall	
		
		li $v0, 5	#L� linha posi��o 
		syscall
		move $t6,$v0

		jal conta
		jal conta2
		jal conta3
		jal conta4

	        jal get_coluna
				beq, $fp,1,player2_acertou			
	        	jal jogada_player1	       
	    
	jr $ra

	player2_acertou:
		addi $t8,$t8,1
		
		jal placar
		add $a0, $v1, $t8
		beq $a0, 16, verifica_vencedor
		
		jal  jogada_player2
	jr  $ra
	IA_acertou:
		addi $t8,$t8,1
		
		jal placar
		add $a0, $v1, $t8
		beq $a0, 16, verifica_vencedor

			jal on_player_2	
			la $a0, maquina_jogando
			li $v0, 4
			syscall	
			li $v0, 32
			li $a0, 4000
			syscall

			addi $t5,$t5,1

				sgt $a0,$t5,9 	
				beq $a0,1, IA_jogada_normal	

			jal opcao_H
				move $a0,$t5
				li $v0, 1   
				syscall     
				jal quebra_linha
			jal opcao_V
				move $a0,$t6
				li $v0, 1   
				syscall 
			move $t6,$t6

			jal conta
			jal conta2
			jal conta3
			jal conta4

			jal get_coluna
				beq, $fp,1,IA_acertou
			jal jogada_player1					
			jal  maquina_escolhe_jogada
	jr  $ra
	IA_jogada_normal:
			jal on_player_2	
			la $a0, maquina_jogando
			li $v0, 4
			syscall	
			li $v0, 32
			li $a0, 4000
			syscall

			jal opcao_H
			jal jogada_horizontal
				move $t5,$a0
				jal quebra_linha
			jal opcao_V
			jal jogada_vertical
				move $t6,$a0

				jal conta
				jal conta2
				jal conta3
				jal conta4

				jal get_coluna
					beq, $fp,1,IA_acertou
				jal jogada_player1

			jal  maquina_escolhe_jogada
	jr $ra

	
	msg_menu:
		la $a0, msg_valor_menu
		li $v0, 4
		syscall		
		j menu_game
		

	verifica_vencedor:
		#Verifica empate
		beq  $v1, $t8, batalha_naval_empate
	
		#Verifica vencedor 
		sgt $a0, $v1, $t8
		beq $a0, 1, vencedor_player1
		j vencedor_player2
	
		batalha_naval_empate:
			
			la $a0, msg_empate		
			li $v0, 4
			syscall
		
			li $v0, 10		#Encerra o jogo
			syscall		

		vencedor_player1:
			la $a0, player1		
			li $v0, 4
			syscall

			li $v0, 10		
			syscall	
		vencedor_player2:
			la $a0, player2		
			li $v0, 4
			syscall

			li $v0, 10		
			syscall	
			
	exit_game:
		li $v0, 10		
		syscall
		

	maquina_escolhe_jogada:	

		jal on_player_2	
		la $a0, maquina_jogando
		li $v0, 4
	    syscall	
		li $v0, 32
		li $a0, 3000
		syscall
		
		jal opcao_H
		jal jogada_horizontal
			move $t5,$a0
			jal quebra_linha
		jal opcao_V
		jal jogada_vertical
			move $t6,$a0

			jal conta
			jal conta2
			jal conta3
			jal conta4

	        jal get_coluna
				beq, $fp,1,IA_acertou
	        jal jogada_player1	   	        	
	jr $ra

	
	jogada_horizontal:
		li $v0, 42  # 42 � o c�digo de chamada de sistema para gerar int
		li $a1, 10 # $a1 limite superior (0 <= [int] <[limite superior])
		syscall     # gera o n�mero e coloca em $a0
		li $v0, 1   # 1 � o c�digo de chamada de sistema para mostrar um n�mero interno
		syscall     # imprime o valor	
	jr $ra


	jogada_vertical:
		li $v0, 42  # 42 � o c�digo de chamada de sistema para gerar int
		li $a1, 9 # $a1 limite
		syscall     # gera o n�mero e coloca em $a0
		li $v0, 1   # 1 � o c�digo de chamada de sistema para mostrar um n�mero interno
	    syscall     # imprime o valor
	jr $ra
	
	quebra_linha:
		la $a0,  linha
		li $v0, 4
		syscall	
	jr $ra
	
	opcao_V:
		la $a0,  txt_jogada_V
		li $v0, 4
		syscall	
	jr $ra
	
	opcao_H:
		la $a0,  txt_jogada_H
		li $v0, 4
		syscall	
	jr $ra
	
	get_coluna:		
  		beq $t5,0,coluna_0 
	    beq $t5,1,coluna_1
	    beq $t5,2,coluna_2
	    beq $t5,3,coluna_3
	    beq $t5,4,coluna_4
	    beq $t5,5,coluna_5
	    beq $t5,6,coluna_6
	    beq $t5,7,coluna_7
	    beq $t5,8,coluna_8
	    beq $t5,9,coluna_9
  	jr $ra


#*********************************************************************************************************
#************************************* GRAPHICAL USER INTERFACE - GUI ************************************

# linha0
quad_0x0color:
   beq $t6,$s5,quad_0x0color_p2
   beq $t6,$s6,quad_0x0color_p1
   beq $t6,$s4,quad_0x0color_p3
   beq $t6,$s7,quad_0x0color_p4
jr $ra
quad_0x0color_p2:
   beq $s3,0,acertou_0x0
   bne $s3,0,quad_0x0
jr $ra
quad_0x0color_p1:
   beq $k1,0,acertou_0x0
   bne $k1,0,quad_0x0
jr $ra
quad_0x0color_p3:
   beq $t3,0,acertou_0x0
   bne $t3,0,quad_0x0
jr $ra
quad_0x0color_p4:
   beq $t9,0,acertou_0x0
   bne $t9,0,quad_0x0
jr $ra


quad_1x0color:
   beq $t6,$s5,quad_1x0color_p2
   beq $t6,$s6,quad_1x0color_p1
   beq $t6,$s4,quad_1x0color_p3
   beq $t6,$s7,quad_1x0color_p4
jr $ra
quad_1x0color_p2:
   beq $s3,1,acertou_1x0
   bne $s3,1,quad_1x0
jr $ra
quad_1x0color_p1:
   beq $k1,1,acertou_1x0
   bne $k1,1,quad_1x0
jr $ra
quad_1x0color_p3:
   beq $t3,1,acertou_1x0
   bne $t3,1,quad_1x0
jr $ra
quad_1x0color_p4:
   beq $t9,1,acertou_1x0
   bne $t9,1,quad_1x0
jr $ra


quad_2x0color:
   beq $t6,$s5,quad_2x0color_p2
   beq $t6,$s6,quad_2x0color_p1
   beq $t6,$s4,quad_2x0color_p3
   beq $t6,$s7,quad_2x0color_p4
jr $ra
quad_2x0color_p2:
   beq $s3,2,acertou_2x0
   bne $s3,2,quad_2x0
jr $ra
quad_2x0color_p1:
   beq $k1,2,acertou_2x0
   bne $k1,2,quad_2x0
jr $ra
quad_2x0color_p3:
   beq $t3,2,acertou_2x0
   bne $t3,2,quad_2x0
jr $ra
quad_2x0color_p4:
   beq $t9,2,acertou_2x0
   bne $t9,2,quad_2x0
jr $ra


quad_3x0color:
   beq $t6,$s5,quad_3x0color_p2
   beq $t6,$s6,quad_3x0color_p1
   beq $t6,$s4,quad_3x0color_p3
   beq $t6,$s7,quad_3x0color_p4
jr $ra
quad_3x0color_p2:
   beq $s3,3,acertou_3x0
   bne $s3,3,quad_3x0
jr $ra
quad_3x0color_p1:
   beq $k1,3,acertou_3x0
   bne $k1,3,quad_3x0
jr $ra
quad_3x0color_p3:
   beq $t3,3,acertou_3x0
   bne $t3,3,quad_3x0
jr $ra
quad_3x0color_p4:
   beq $t9,3,acertou_3x0
   bne $t9,3,quad_3x0
jr $ra


quad_4x0color:
   beq $t6,$s5,quad_4x0color_p2
   beq $t6,$s6,quad_4x0color_p1
   beq $t6,$s4,quad_4x0color_p3
   beq $t6,$s7,quad_4x0color_p4
jr $ra
quad_4x0color_p2:
   beq $s3,4,acertou_4x0
   bne $s3,4,quad_4x0
jr $ra
quad_4x0color_p1:
   beq $k1,4,acertou_4x0
   bne $k1,4,quad_4x0
jr $ra
quad_4x0color_p3:
   beq $t3,4,acertou_4x0
   bne $t3,4,quad_4x0
jr $ra
quad_4x0color_p4:
   beq $t9,4,acertou_4x0
   bne $t9,4,quad_4x0
jr $ra


quad_5x0color:
   beq $t6,$s5,quad_5x0color_p2
   beq $t6,$s6,quad_5x0color_p1
   beq $t6,$s4,quad_5x0color_p3
   beq $t6,$s7,quad_5x0color_p4
jr $ra
quad_5x0color_p2:
   beq $s3,5,acertou_5x0
   bne $s3,5,quad_5x0
jr $ra
quad_5x0color_p1:
   beq $k1,5,acertou_5x0
   bne $k1,5,quad_5x0
jr $ra
quad_5x0color_p3:
   beq $t3,5,acertou_5x0
   bne $t3,5,quad_5x0
jr $ra
quad_5x0color_p4:
   beq $t9,5,acertou_5x0
   bne $t9,5,quad_5x0
jr $ra


quad_6x0color:
   beq $t6,$s5,quad_6x0color_p2
   beq $t6,$s6,quad_6x0color_p1
   beq $t6,$s4,quad_6x0color_p3
   beq $t6,$s7,quad_6x0color_p4
jr $ra
quad_6x0color_p2:
   beq $s3,6,acertou_6x0
   bne $s3,6,quad_6x0
jr $ra
quad_6x0color_p1:
   beq $k1,6,acertou_6x0
   bne $k1,6,quad_6x0
jr $ra
quad_6x0color_p3:
   beq $t3,6,acertou_6x0
   bne $t3,6,quad_6x0
jr $ra
quad_6x0color_p4:
   beq $t9,6,acertou_6x0
   bne $t9,6,quad_6x0
jr $ra


quad_7x0color:
   beq $t6,$s5,quad_7x0color_p2
   beq $t6,$s6,quad_7x0color_p1
   beq $t6,$s4,quad_7x0color_p3
   beq $t6,$s7,quad_7x0color_p4
jr $ra
quad_7x0color_p2:
   beq $s3,7,acertou_7x0
   bne $s3,7,quad_7x0
jr $ra
quad_7x0color_p1:
   beq $k1,7,acertou_7x0
   bne $k1,7,quad_7x0
jr $ra
quad_7x0color_p3:
   beq $t3,7,acertou_7x0
   bne $t3,7,quad_7x0
jr $ra
quad_7x0color_p4:
   beq $t9,7,acertou_7x0
   bne $t9,7,quad_7x0
jr $ra


quad_8x0color:
   beq $t6,$s5,quad_8x0color_p2
   beq $t6,$s6,quad_8x0color_p1
   beq $t6,$s4,quad_8x0color_p3
   beq $t6,$s7,quad_8x0color_p4
jr $ra
quad_8x0color_p2:
   beq $s3,8,acertou_8x0
   bne $s3,8,quad_8x0
jr $ra
quad_8x0color_p1:
   beq $k1,8,acertou_8x0
   bne $k1,8,quad_8x0
jr $ra
quad_8x0color_p3:
   beq $t3,8,acertou_8x0
   bne $t3,8,quad_8x0
jr $ra
quad_8x0color_p4:
   beq $t9,8,acertou_8x0
   bne $t9,8,quad_8x0
jr $ra


quad_9x0color:
   beq $t6,$s5,quad_9x0color_p2
   beq $t6,$s6,quad_9x0color_p1
   beq $t6,$s4,quad_9x0color_p3
   beq $t6,$s7,quad_9x0color_p4
jr $ra
quad_9x0color_p2:
   beq $s3,9,acertou_9x0
   bne $s3,9,quad_9x0
jr $ra
quad_9x0color_p1:
   beq $k1,9,acertou_9x0
   bne $k1,9,quad_9x0
jr $ra
quad_9x0color_p3:
   beq $t3,9,acertou_9x0
   bne $t3,9,quad_9x0
jr $ra
quad_9x0color_p4:
   beq $t9,9,acertou_9x0
   bne $t9,9,quad_9x0
jr $ra


# linha1
quad_0x1color:
   beq $t6,$s5,quad_0x1color_p2
   beq $t6,$s6,quad_0x1color_p1
   beq $t6,$s4,quad_0x1color_p3
   beq $t6,$s7,quad_0x1color_p4
jr $ra
quad_0x1color_p2:
   beq $s3,0,acertou_0x1
   bne $s3,0,quad_0x1
jr $ra
quad_0x1color_p1:
   beq $k1,0,acertou_0x1
   bne $k1,0,quad_0x1
jr $ra
quad_0x1color_p3:
   beq $t3,0,acertou_0x1
   bne $t3,0,quad_0x1
jr $ra
quad_0x1color_p4:
   beq $t9,0,acertou_0x1
   bne $t9,0,quad_0x1
jr $ra


quad_1x1color:
   beq $t6,$s5,quad_1x1color_p2
   beq $t6,$s6,quad_1x1color_p1
   beq $t6,$s4,quad_1x1color_p3
   beq $t6,$s7,quad_1x1color_p4
jr $ra
quad_1x1color_p2:
   beq $s3,1,acertou_1x1
   bne $s3,1,quad_1x1
jr $ra
quad_1x1color_p1:
   beq $k1,1,acertou_1x1
   bne $k1,1,quad_1x1
jr $ra
quad_1x1color_p3:
   beq $t3,1,acertou_1x1
   bne $t3,1,quad_1x1
jr $ra
quad_1x1color_p4:
   beq $t9,1,acertou_1x1
   bne $t9,1,quad_1x1
jr $ra


quad_2x1color:
   beq $t6,$s5,quad_2x1color_p2
   beq $t6,$s6,quad_2x1color_p1
   beq $t6,$s4,quad_2x1color_p3
   beq $t6,$s7,quad_2x1color_p4
jr $ra
quad_2x1color_p2:
   beq $s3,2,acertou_2x1
   bne $s3,2,quad_2x1
jr $ra
quad_2x1color_p1:
   beq $k1,2,acertou_2x1
   bne $k1,2,quad_2x1
jr $ra
quad_2x1color_p3:
   beq $t3,2,acertou_2x1
   bne $t3,2,quad_2x1
jr $ra
quad_2x1color_p4:
   beq $t9,2,acertou_2x1
   bne $t9,2,quad_2x1
jr $ra


quad_3x1color:
   beq $t6,$s5,quad_3x1color_p2
   beq $t6,$s6,quad_3x1color_p1
   beq $t6,$s4,quad_3x1color_p3
   beq $t6,$s7,quad_3x1color_p4
jr $ra
quad_3x1color_p2:
   beq $s3,3,acertou_3x1
   bne $s3,3,quad_3x1
jr $ra
quad_3x1color_p1:
   beq $k1,3,acertou_3x1
   bne $k1,3,quad_3x1
jr $ra
quad_3x1color_p3:
   beq $t3,3,acertou_3x1
   bne $t3,3,quad_3x1
jr $ra
quad_3x1color_p4:
   beq $t9,3,acertou_3x1
   bne $t9,3,quad_3x1
jr $ra


quad_4x1color:
   beq $t6,$s5,quad_4x1color_p2
   beq $t6,$s6,quad_4x1color_p1
   beq $t6,$s4,quad_4x1color_p3
   beq $t6,$s7,quad_4x1color_p4
jr $ra
quad_4x1color_p2:
   beq $s3,4,acertou_4x1
   bne $s3,4,quad_4x1
jr $ra
quad_4x1color_p1:
   beq $k1,4,acertou_4x1
   bne $k1,4,quad_4x1
jr $ra
quad_4x1color_p3:
   beq $t3,4,acertou_4x1
   bne $t3,4,quad_4x1
jr $ra
quad_4x1color_p4:
   beq $t9,4,acertou_4x1
   bne $t9,4,quad_4x1
jr $ra


quad_5x1color:
   beq $t6,$s5,quad_5x1color_p2
   beq $t6,$s6,quad_5x1color_p1
   beq $t6,$s4,quad_5x1color_p3
   beq $t6,$s7,quad_5x1color_p4
jr $ra
quad_5x1color_p2:
   beq $s3,5,acertou_5x1
   bne $s3,5,quad_5x1
jr $ra
quad_5x1color_p1:
   beq $k1,5,acertou_5x1
   bne $k1,5,quad_5x1
jr $ra
quad_5x1color_p3:
   beq $t3,5,acertou_5x1
   bne $t3,5,quad_5x1
jr $ra
quad_5x1color_p4:
   beq $t9,5,acertou_5x1
   bne $t9,5,quad_5x1
jr $ra


quad_6x1color:
   beq $t6,$s5,quad_6x1color_p2
   beq $t6,$s6,quad_6x1color_p1
   beq $t6,$s4,quad_6x1color_p3
   beq $t6,$s7,quad_6x1color_p4
jr $ra
quad_6x1color_p2:
   beq $s3,6,acertou_6x1
   bne $s3,6,quad_6x1
jr $ra
quad_6x1color_p1:
   beq $k1,6,acertou_6x1
   bne $k1,6,quad_6x1
jr $ra
quad_6x1color_p3:
   beq $t3,6,acertou_6x1
   bne $t3,6,quad_6x1
jr $ra
quad_6x1color_p4:
   beq $t9,6,acertou_6x1
   bne $t9,6,quad_6x1
jr $ra


quad_7x1color:
   beq $t6,$s5,quad_7x1color_p2
   beq $t6,$s6,quad_7x1color_p1
   beq $t6,$s4,quad_7x1color_p3
   beq $t6,$s7,quad_7x1color_p4
jr $ra
quad_7x1color_p2:
   beq $s3,7,acertou_7x1
   bne $s3,7,quad_7x1
jr $ra
quad_7x1color_p1:
   beq $k1,7,acertou_7x1
   bne $k1,7,quad_7x1
jr $ra
quad_7x1color_p3:
   beq $t3,7,acertou_7x1
   bne $t3,7,quad_7x1
jr $ra
quad_7x1color_p4:
   beq $t9,7,acertou_7x1
   bne $t9,7,quad_7x1
jr $ra


quad_8x1color:
   beq $t6,$s5,quad_8x1color_p2
   beq $t6,$s6,quad_8x1color_p1
   beq $t6,$s4,quad_8x1color_p3
   beq $t6,$s7,quad_8x1color_p4
jr $ra
quad_8x1color_p2:
   beq $s3,8,acertou_8x1
   bne $s3,8,quad_8x1
jr $ra
quad_8x1color_p1:
   beq $k1,8,acertou_8x1
   bne $k1,8,quad_8x1
jr $ra
quad_8x1color_p3:
   beq $t3,8,acertou_8x1
   bne $t3,8,quad_8x1
jr $ra
quad_8x1color_p4:
   beq $t9,8,acertou_8x1
   bne $t9,8,quad_8x1
jr $ra


quad_9x1color:
   beq $t6,$s5,quad_9x1color_p2
   beq $t6,$s6,quad_9x1color_p1
   beq $t6,$s4,quad_9x1color_p3
   beq $t6,$s7,quad_9x1color_p4
jr $ra
quad_9x1color_p2:
   beq $s3,9,acertou_9x1
   bne $s3,9,quad_9x1
jr $ra
quad_9x1color_p1:
   beq $k1,9,acertou_9x1
   bne $k1,9,quad_9x1
jr $ra
quad_9x1color_p3:
   beq $t3,9,acertou_9x1
   bne $t3,9,quad_9x1
jr $ra
quad_9x1color_p4:
   beq $t9,9,acertou_9x1
   bne $t9,9,quad_9x1
jr $ra


# linha2
quad_0x2color:
   beq $t6,$s5,quad_0x2color_p2
   beq $t6,$s6,quad_0x2color_p1
   beq $t6,$s4,quad_0x2color_p3
   beq $t6,$s7,quad_0x2color_p4
jr $ra
quad_0x2color_p2:
   beq $s3,0,acertou_0x2
   bne $s3,0,quad_0x2
jr $ra
quad_0x2color_p1:
   beq $k1,0,acertou_0x2
   bne $k1,0,quad_0x2
jr $ra
quad_0x2color_p3:
   beq $t3,0,acertou_0x2
   bne $t3,0,quad_0x2
jr $ra
quad_0x2color_p4:
   beq $t9,0,acertou_0x2
   bne $t9,0,quad_0x2
jr $ra


quad_1x2color:
   beq $t6,$s5,quad_1x2color_p2
   beq $t6,$s6,quad_1x2color_p1
   beq $t6,$s4,quad_1x2color_p3
   beq $t6,$s7,quad_1x2color_p4
jr $ra
quad_1x2color_p2:
   beq $s3,1,acertou_1x2
   bne $s3,1,quad_1x2
jr $ra
quad_1x2color_p1:
   beq $k1,1,acertou_1x2
   bne $k1,1,quad_1x2
jr $ra
quad_1x2color_p3:
   beq $t3,1,acertou_1x2
   bne $t3,1,quad_1x2
jr $ra
quad_1x2color_p4:
   beq $t9,1,acertou_1x2
   bne $t9,1,quad_1x2
jr $ra


quad_2x2color:
   beq $t6,$s5,quad_2x2color_p2
   beq $t6,$s6,quad_2x2color_p1
   beq $t6,$s4,quad_2x2color_p3
   beq $t6,$s7,quad_2x2color_p4
jr $ra
quad_2x2color_p2:
   beq $s3,2,acertou_2x2
   bne $s3,2,quad_2x2
jr $ra
quad_2x2color_p1:
   beq $k1,2,acertou_2x2
   bne $k1,2,quad_2x2
jr $ra
quad_2x2color_p3:
   beq $t3,2,acertou_2x2
   bne $t3,2,quad_2x2
jr $ra
quad_2x2color_p4:
   beq $t9,2,acertou_2x2
   bne $t9,2,quad_2x2
jr $ra


quad_3x2color:
   beq $t6,$s5,quad_3x2color_p2
   beq $t6,$s6,quad_3x2color_p1
   beq $t6,$s4,quad_3x2color_p3
   beq $t6,$s7,quad_3x2color_p4
jr $ra
quad_3x2color_p2:
   beq $s3,3,acertou_3x2
   bne $s3,3,quad_3x2
jr $ra
quad_3x2color_p1:
   beq $k1,3,acertou_3x2
   bne $k1,3,quad_3x2
jr $ra
quad_3x2color_p3:
   beq $t3,3,acertou_3x2
   bne $t3,3,quad_3x2
jr $ra
quad_3x2color_p4:
   beq $t9,3,acertou_3x2
   bne $t9,3,quad_3x2
jr $ra


quad_4x2color:
   beq $t6,$s5,quad_4x2color_p2
   beq $t6,$s6,quad_4x2color_p1
   beq $t6,$s4,quad_4x2color_p3
   beq $t6,$s7,quad_4x2color_p4
jr $ra
quad_4x2color_p2:
   beq $s3,4,acertou_4x2
   bne $s3,4,quad_4x2
jr $ra
quad_4x2color_p1:
   beq $k1,4,acertou_4x2
   bne $k1,4,quad_4x2
jr $ra
quad_4x2color_p3:
   beq $t3,4,acertou_4x2
   bne $t3,4,quad_4x2
jr $ra
quad_4x2color_p4:
   beq $t9,4,acertou_4x2
   bne $t9,4,quad_4x2
jr $ra


quad_5x2color:
   beq $t6,$s5,quad_5x2color_p2
   beq $t6,$s6,quad_5x2color_p1
   beq $t6,$s4,quad_5x2color_p3
   beq $t6,$s7,quad_5x2color_p4
jr $ra
quad_5x2color_p2:
   beq $s3,5,acertou_5x2
   bne $s3,5,quad_5x2
jr $ra
quad_5x2color_p1:
   beq $k1,5,acertou_5x2
   bne $k1,5,quad_5x2
jr $ra
quad_5x2color_p3:
   beq $t3,5,acertou_5x2
   bne $t3,5,quad_5x2
jr $ra
quad_5x2color_p4:
   beq $t9,5,acertou_5x2
   bne $t9,5,quad_5x2
jr $ra


quad_6x2color:
   beq $t6,$s5,quad_6x2color_p2
   beq $t6,$s6,quad_6x2color_p1
   beq $t6,$s4,quad_6x2color_p3
   beq $t6,$s7,quad_6x2color_p4
jr $ra
quad_6x2color_p2:
   beq $s3,6,acertou_6x2
   bne $s3,6,quad_6x2
jr $ra
quad_6x2color_p1:
   beq $k1,6,acertou_6x2
   bne $k1,6,quad_6x2
jr $ra
quad_6x2color_p3:
   beq $t3,6,acertou_6x2
   bne $t3,6,quad_6x2
jr $ra
quad_6x2color_p4:
   beq $t9,6,acertou_6x2
   bne $t9,6,quad_6x2
jr $ra


quad_7x2color:
   beq $t6,$s5,quad_7x2color_p2
   beq $t6,$s6,quad_7x2color_p1
   beq $t6,$s4,quad_7x2color_p3
   beq $t6,$s7,quad_7x2color_p4
jr $ra
quad_7x2color_p2:
   beq $s3,7,acertou_7x2
   bne $s3,7,quad_7x2
jr $ra
quad_7x2color_p1:
   beq $k1,7,acertou_7x2
   bne $k1,7,quad_7x2
jr $ra
quad_7x2color_p3:
   beq $t3,7,acertou_7x2
   bne $t3,7,quad_7x2
jr $ra
quad_7x2color_p4:
   beq $t9,7,acertou_7x2
   bne $t9,7,quad_7x2
jr $ra


quad_8x2color:
   beq $t6,$s5,quad_8x2color_p2
   beq $t6,$s6,quad_8x2color_p1
   beq $t6,$s4,quad_8x2color_p3
   beq $t6,$s7,quad_8x2color_p4
jr $ra
quad_8x2color_p2:
   beq $s3,8,acertou_8x2
   bne $s3,8,quad_8x2
jr $ra
quad_8x2color_p1:
   beq $k1,8,acertou_8x2
   bne $k1,8,quad_8x2
jr $ra
quad_8x2color_p3:
   beq $t3,8,acertou_8x2
   bne $t3,8,quad_8x2
jr $ra
quad_8x2color_p4:
   beq $t9,8,acertou_8x2
   bne $t9,8,quad_8x2
jr $ra


quad_9x2color:
   beq $t6,$s5,quad_9x2color_p2
   beq $t6,$s6,quad_9x2color_p1
   beq $t6,$s4,quad_9x2color_p3
   beq $t6,$s7,quad_9x2color_p4
jr $ra
quad_9x2color_p2:
   beq $s3,9,acertou_9x2
   bne $s3,9,quad_9x2
jr $ra
quad_9x2color_p1:
   beq $k1,9,acertou_9x2
   bne $k1,9,quad_9x2
jr $ra
quad_9x2color_p3:
   beq $t3,9,acertou_9x2
   bne $t3,9,quad_9x2
jr $ra
quad_9x2color_p4:
   beq $t9,9,acertou_9x2
   bne $t9,9,quad_9x2
jr $ra


# linha3
quad_0x3color:
   beq $t6,$s5,quad_0x3color_p2
   beq $t6,$s6,quad_0x3color_p1
   beq $t6,$s4,quad_0x3color_p3
   beq $t6,$s7,quad_0x3color_p4
jr $ra
quad_0x3color_p2:
   beq $s3,0,acertou_0x3
   bne $s3,0,quad_0x3
jr $ra
quad_0x3color_p1:
   beq $k1,0,acertou_0x3
   bne $k1,0,quad_0x3
jr $ra
quad_0x3color_p3:
   beq $t3,0,acertou_0x3
   bne $t3,0,quad_0x3
jr $ra
quad_0x3color_p4:
   beq $t9,0,acertou_0x3
   bne $t9,0,quad_0x3
jr $ra


quad_1x3color:
   beq $t6,$s5,quad_1x3color_p2
   beq $t6,$s6,quad_1x3color_p1
   beq $t6,$s4,quad_1x3color_p3
   beq $t6,$s7,quad_1x3color_p4
jr $ra
quad_1x3color_p2:
   beq $s3,1,acertou_1x3
   bne $s3,1,quad_1x3
jr $ra
quad_1x3color_p1:
   beq $k1,1,acertou_1x3
   bne $k1,1,quad_1x3
jr $ra
quad_1x3color_p3:
   beq $t3,1,acertou_1x3
   bne $t3,1,quad_1x3
jr $ra
quad_1x3color_p4:
   beq $t9,1,acertou_1x3
   bne $t9,1,quad_1x3
jr $ra


quad_2x3color:
   beq $t6,$s5,quad_2x3color_p2
   beq $t6,$s6,quad_2x3color_p1
   beq $t6,$s4,quad_2x3color_p3
   beq $t6,$s7,quad_2x3color_p4
jr $ra
quad_2x3color_p2:
   beq $s3,2,acertou_2x3
   bne $s3,2,quad_2x3
jr $ra
quad_2x3color_p1:
   beq $k1,2,acertou_2x3
   bne $k1,2,quad_2x3
jr $ra
quad_2x3color_p3:
   beq $t3,2,acertou_2x3
   bne $t3,2,quad_2x3
jr $ra
quad_2x3color_p4:
   beq $t9,2,acertou_2x3
   bne $t9,2,quad_2x3
jr $ra


quad_3x3color:
   beq $t6,$s5,quad_3x3color_p2
   beq $t6,$s6,quad_3x3color_p1
   beq $t6,$s4,quad_3x3color_p3
   beq $t6,$s7,quad_3x3color_p4
jr $ra
quad_3x3color_p2:
   beq $s3,3,acertou_3x3
   bne $s3,3,quad_3x3
jr $ra
quad_3x3color_p1:
   beq $k1,3,acertou_3x3
   bne $k1,3,quad_3x3
jr $ra
quad_3x3color_p3:
   beq $t3,3,acertou_3x3
   bne $t3,3,quad_3x3
jr $ra
quad_3x3color_p4:
   beq $t9,3,acertou_3x3
   bne $t9,3,quad_3x3
jr $ra


quad_4x3color:
   beq $t6,$s5,quad_4x3color_p2
   beq $t6,$s6,quad_4x3color_p1
   beq $t6,$s4,quad_4x3color_p3
   beq $t6,$s7,quad_4x3color_p4
jr $ra
quad_4x3color_p2:
   beq $s3,4,acertou_4x3
   bne $s3,4,quad_4x3
jr $ra
quad_4x3color_p1:
   beq $k1,4,acertou_4x3
   bne $k1,4,quad_4x3
jr $ra
quad_4x3color_p3:
   beq $t3,4,acertou_4x3
   bne $t3,4,quad_4x3
jr $ra
quad_4x3color_p4:
   beq $t9,4,acertou_4x3
   bne $t9,4,quad_4x3
jr $ra


quad_5x3color:
   beq $t6,$s5,quad_5x3color_p2
   beq $t6,$s6,quad_5x3color_p1
   beq $t6,$s4,quad_5x3color_p3
   beq $t6,$s7,quad_5x3color_p4
jr $ra
quad_5x3color_p2:
   beq $s3,5,acertou_5x3
   bne $s3,5,quad_5x3
jr $ra
quad_5x3color_p1:
   beq $k1,5,acertou_5x3
   bne $k1,5,quad_5x3
jr $ra
quad_5x3color_p3:
   beq $t3,5,acertou_5x3
   bne $t3,5,quad_5x3
jr $ra
quad_5x3color_p4:
   beq $t9,5,acertou_5x3
   bne $t9,5,quad_5x3
jr $ra


quad_6x3color:
   beq $t6,$s5,quad_6x3color_p2
   beq $t6,$s6,quad_6x3color_p1
   beq $t6,$s4,quad_6x3color_p3
   beq $t6,$s7,quad_6x3color_p4
jr $ra
quad_6x3color_p2:
   beq $s3,6,acertou_6x3
   bne $s3,6,quad_6x3
jr $ra
quad_6x3color_p1:
   beq $k1,6,acertou_6x3
   bne $k1,6,quad_6x3
jr $ra
quad_6x3color_p3:
   beq $t3,6,acertou_6x3
   bne $t3,6,quad_6x3
jr $ra
quad_6x3color_p4:
   beq $t9,6,acertou_6x3
   bne $t9,6,quad_6x3
jr $ra


quad_7x3color:
   beq $t6,$s5,quad_7x3color_p2
   beq $t6,$s6,quad_7x3color_p1
   beq $t6,$s4,quad_7x3color_p3
   beq $t6,$s7,quad_7x3color_p4
jr $ra
quad_7x3color_p2:
   beq $s3,7,acertou_7x3
   bne $s3,7,quad_7x3
jr $ra
quad_7x3color_p1:
   beq $k1,7,acertou_7x3
   bne $k1,7,quad_7x3
jr $ra
quad_7x3color_p3:
   beq $t3,7,acertou_7x3
   bne $t3,7,quad_7x3
jr $ra
quad_7x3color_p4:
   beq $t9,7,acertou_7x3
   bne $t9,7,quad_7x3
jr $ra


quad_8x3color:
   beq $t6,$s5,quad_8x3color_p2
   beq $t6,$s6,quad_8x3color_p1
   beq $t6,$s4,quad_8x3color_p3
   beq $t6,$s7,quad_8x3color_p4
jr $ra
quad_8x3color_p2:
   beq $s3,8,acertou_8x3
   bne $s3,8,quad_8x3
jr $ra
quad_8x3color_p1:
   beq $k1,8,acertou_8x3
   bne $k1,8,quad_8x3
jr $ra
quad_8x3color_p3:
   beq $t3,8,acertou_8x3
   bne $t3,8,quad_8x3
jr $ra
quad_8x3color_p4:
   beq $t9,8,acertou_8x3
   bne $t9,8,quad_8x3
jr $ra


quad_9x3color:
   beq $t6,$s5,quad_9x3color_p2
   beq $t6,$s6,quad_9x3color_p1
   beq $t6,$s4,quad_9x3color_p3
   beq $t6,$s7,quad_9x3color_p4
jr $ra
quad_9x3color_p2:
   beq $s3,9,acertou_9x3
   bne $s3,9,quad_9x3
jr $ra
quad_9x3color_p1:
   beq $k1,9,acertou_9x3
   bne $k1,9,quad_9x3
jr $ra
quad_9x3color_p3:
   beq $t3,9,acertou_9x3
   bne $t3,9,quad_9x3
jr $ra
quad_9x3color_p4:
   beq $t9,9,acertou_9x3
   bne $t9,9,quad_9x3
jr $ra


# linha4
quad_0x4color:
   beq $t6,$s5,quad_0x4color_p2
   beq $t6,$s6,quad_0x4color_p1
   beq $t6,$s4,quad_0x4color_p3
   beq $t6,$s7,quad_0x4color_p4
jr $ra
quad_0x4color_p2:
   beq $s3,0,acertou_0x4
   bne $s3,0,quad_0x4
jr $ra
quad_0x4color_p1:
   beq $k1,0,acertou_0x4
   bne $k1,0,quad_0x4
jr $ra
quad_0x4color_p3:
   beq $t3,0,acertou_0x4
   bne $t3,0,quad_0x4
jr $ra
quad_0x4color_p4:
   beq $t9,0,acertou_0x4
   bne $t9,0,quad_0x4
jr $ra


quad_1x4color:
   beq $t6,$s5,quad_1x4color_p2
   beq $t6,$s6,quad_1x4color_p1
   beq $t6,$s4,quad_1x4color_p3
   beq $t6,$s7,quad_1x4color_p4
jr $ra
quad_1x4color_p2:
   beq $s3,1,acertou_1x4
   bne $s3,1,quad_1x4
jr $ra
quad_1x4color_p1:
   beq $k1,1,acertou_1x4
   bne $k1,1,quad_1x4
jr $ra
quad_1x4color_p3:
   beq $t3,1,acertou_1x4
   bne $t3,1,quad_1x4
jr $ra
quad_1x4color_p4:
   beq $t9,1,acertou_1x4
   bne $t9,1,quad_1x4
jr $ra


quad_2x4color:
   beq $t6,$s5,quad_2x4color_p2
   beq $t6,$s6,quad_2x4color_p1
   beq $t6,$s4,quad_2x4color_p3
   beq $t6,$s7,quad_2x4color_p4
jr $ra
quad_2x4color_p2:
   beq $s3,2,acertou_2x4
   bne $s3,2,quad_2x4
jr $ra
quad_2x4color_p1:
   beq $k1,2,acertou_2x4
   bne $k1,2,quad_2x4
jr $ra
quad_2x4color_p3:
   beq $t3,2,acertou_2x4
   bne $t3,2,quad_2x4
jr $ra
quad_2x4color_p4:
   beq $t9,2,acertou_2x4
   bne $t9,2,quad_2x4
jr $ra


quad_3x4color:
   beq $t6,$s5,quad_3x4color_p2
   beq $t6,$s6,quad_3x4color_p1
   beq $t6,$s4,quad_3x4color_p3
   beq $t6,$s7,quad_3x4color_p4
jr $ra
quad_3x4color_p2:
   beq $s3,3,acertou_3x4
   bne $s3,3,quad_3x4
jr $ra
quad_3x4color_p1:
   beq $k1,3,acertou_3x4
   bne $k1,3,quad_3x4
jr $ra
quad_3x4color_p3:
   beq $t3,3,acertou_3x4
   bne $t3,3,quad_3x4
jr $ra
quad_3x4color_p4:
   beq $t9,3,acertou_3x4
   bne $t9,3,quad_3x4
jr $ra


quad_4x4color:
   beq $t6,$s5,quad_4x4color_p2
   beq $t6,$s6,quad_4x4color_p1
   beq $t6,$s4,quad_4x4color_p3
   beq $t6,$s7,quad_4x4color_p4
jr $ra
quad_4x4color_p2:
   beq $s3,4,acertou_4x4
   bne $s3,4,quad_4x4
jr $ra
quad_4x4color_p1:
   beq $k1,4,acertou_4x4
   bne $k1,4,quad_4x4
jr $ra
quad_4x4color_p3:
   beq $t3,4,acertou_4x4
   bne $t3,4,quad_4x4
jr $ra
quad_4x4color_p4:
   beq $t9,4,acertou_4x4
   bne $t9,4,quad_4x4
jr $ra


quad_5x4color:
   beq $t6,$s5,quad_5x4color_p2
   beq $t6,$s6,quad_5x4color_p1
   beq $t6,$s4,quad_5x4color_p3
   beq $t6,$s7,quad_5x4color_p4
jr $ra
quad_5x4color_p2:
   beq $s3,5,acertou_5x4
   bne $s3,5,quad_5x4
jr $ra
quad_5x4color_p1:
   beq $k1,5,acertou_5x4
   bne $k1,5,quad_5x4
jr $ra
quad_5x4color_p3:
   beq $t3,5,acertou_5x4
   bne $t3,5,quad_5x4
jr $ra
quad_5x4color_p4:
   beq $t9,5,acertou_5x4
   bne $t9,5,quad_5x4
jr $ra


quad_6x4color:
   beq $t6,$s5,quad_6x4color_p2
   beq $t6,$s6,quad_6x4color_p1
   beq $t6,$s4,quad_6x4color_p3
   beq $t6,$s7,quad_6x4color_p4
jr $ra
quad_6x4color_p2:
   beq $s3,6,acertou_6x4
   bne $s3,6,quad_6x4
jr $ra
quad_6x4color_p1:
   beq $k1,6,acertou_6x4
   bne $k1,6,quad_6x4
jr $ra
quad_6x4color_p3:
   beq $t3,6,acertou_6x4
   bne $t3,6,quad_6x4
jr $ra
quad_6x4color_p4:
   beq $t9,6,acertou_6x4
   bne $t9,6,quad_6x4
jr $ra


quad_7x4color:
   beq $t6,$s5,quad_7x4color_p2
   beq $t6,$s6,quad_7x4color_p1
   beq $t6,$s4,quad_7x4color_p3
   beq $t6,$s7,quad_7x4color_p4
jr $ra
quad_7x4color_p2:
   beq $s3,7,acertou_7x4
   bne $s3,7,quad_7x4
jr $ra
quad_7x4color_p1:
   beq $k1,7,acertou_7x4
   bne $k1,7,quad_7x4
jr $ra
quad_7x4color_p3:
   beq $t3,7,acertou_7x4
   bne $t3,7,quad_7x4
jr $ra
quad_7x4color_p4:
   beq $t9,7,acertou_7x4
   bne $t9,7,quad_7x4
jr $ra


quad_8x4color:
   beq $t6,$s5,quad_8x4color_p2
   beq $t6,$s6,quad_8x4color_p1
   beq $t6,$s4,quad_8x4color_p3
   beq $t6,$s7,quad_8x4color_p4
jr $ra
quad_8x4color_p2:
   beq $s3,8,acertou_8x4
   bne $s3,8,quad_8x4
jr $ra
quad_8x4color_p1:
   beq $k1,8,acertou_8x4
   bne $k1,8,quad_8x4
jr $ra
quad_8x4color_p3:
   beq $t3,8,acertou_8x4
   bne $t3,8,quad_8x4
jr $ra
quad_8x4color_p4:
   beq $t9,8,acertou_8x4
   bne $t9,8,quad_8x4
jr $ra


quad_9x4color:
   beq $t6,$s5,quad_9x4color_p2
   beq $t6,$s6,quad_9x4color_p1
   beq $t6,$s4,quad_9x4color_p3
   beq $t6,$s7,quad_9x4color_p4
jr $ra
quad_9x4color_p2:
   beq $s3,9,acertou_9x4
   bne $s3,9,quad_9x4
jr $ra
quad_9x4color_p1:
   beq $k1,9,acertou_9x4
   bne $k1,9,quad_9x4
jr $ra
quad_9x4color_p3:
   beq $t3,9,acertou_9x4
   bne $t3,9,quad_9x4
jr $ra
quad_9x4color_p4:
   beq $t9,9,acertou_9x4
   bne $t9,9,quad_9x4
jr $ra


# linha5
quad_0x5color:
   beq $t6,$s5,quad_0x5color_p2
   beq $t6,$s6,quad_0x5color_p1
   beq $t6,$s4,quad_0x5color_p3
   beq $t6,$s7,quad_0x5color_p4
jr $ra
quad_0x5color_p2:
   beq $s3,0,acertou_0x5
   bne $s3,0,quad_0x5
jr $ra
quad_0x5color_p1:
   beq $k1,0,acertou_0x5
   bne $k1,0,quad_0x5
jr $ra
quad_0x5color_p3:
   beq $t3,0,acertou_0x5
   bne $t3,0,quad_0x5
jr $ra
quad_0x5color_p4:
   beq $t9,0,acertou_0x5
   bne $t9,0,quad_0x5
jr $ra


quad_1x5color:
   beq $t6,$s5,quad_1x5color_p2
   beq $t6,$s6,quad_1x5color_p1
   beq $t6,$s4,quad_1x5color_p3
   beq $t6,$s7,quad_1x5color_p4
jr $ra
quad_1x5color_p2:
   beq $s3,1,acertou_1x5
   bne $s3,1,quad_1x5
jr $ra
quad_1x5color_p1:
   beq $k1,1,acertou_1x5
   bne $k1,1,quad_1x5
jr $ra
quad_1x5color_p3:
   beq $t3,1,acertou_1x5
   bne $t3,1,quad_1x5
jr $ra
quad_1x5color_p4:
   beq $t9,1,acertou_1x5
   bne $t9,1,quad_1x5
jr $ra


quad_2x5color:
   beq $t6,$s5,quad_2x5color_p2
   beq $t6,$s6,quad_2x5color_p1
   beq $t6,$s4,quad_2x5color_p3
   beq $t6,$s7,quad_2x5color_p4
jr $ra
quad_2x5color_p2:
   beq $s3,2,acertou_2x5
   bne $s3,2,quad_2x5
jr $ra
quad_2x5color_p1:
   beq $k1,2,acertou_2x5
   bne $k1,2,quad_2x5
jr $ra
quad_2x5color_p3:
   beq $t3,2,acertou_2x5
   bne $t3,2,quad_2x5
jr $ra
quad_2x5color_p4:
   beq $t9,2,acertou_2x5
   bne $t9,2,quad_2x5
jr $ra


quad_3x5color:
   beq $t6,$s5,quad_3x5color_p2
   beq $t6,$s6,quad_3x5color_p1
   beq $t6,$s4,quad_3x5color_p3
   beq $t6,$s7,quad_3x5color_p4
jr $ra
quad_3x5color_p2:
   beq $s3,3,acertou_3x5
   bne $s3,3,quad_3x5
jr $ra
quad_3x5color_p1:
   beq $k1,3,acertou_3x5
   bne $k1,3,quad_3x5
jr $ra
quad_3x5color_p3:
   beq $t3,3,acertou_3x5
   bne $t3,3,quad_3x5
jr $ra
quad_3x5color_p4:
   beq $t9,3,acertou_3x5
   bne $t9,3,quad_3x5
jr $ra


quad_4x5color:
   beq $t6,$s5,quad_4x5color_p2
   beq $t6,$s6,quad_4x5color_p1
   beq $t6,$s4,quad_4x5color_p3
   beq $t6,$s7,quad_4x5color_p4
jr $ra
quad_4x5color_p2:
   beq $s3,4,acertou_4x5
   bne $s3,4,quad_4x5
jr $ra
quad_4x5color_p1:
   beq $k1,4,acertou_4x5
   bne $k1,4,quad_4x5
jr $ra
quad_4x5color_p3:
   beq $t3,4,acertou_4x5
   bne $t3,4,quad_4x5
jr $ra
quad_4x5color_p4:
   beq $t9,4,acertou_4x5
   bne $t9,4,quad_4x5
jr $ra


quad_5x5color:
   beq $t6,$s5,quad_5x5color_p2
   beq $t6,$s6,quad_5x5color_p1
   beq $t6,$s4,quad_5x5color_p3
   beq $t6,$s7,quad_5x5color_p4
jr $ra
quad_5x5color_p2:
   beq $s3,5,acertou_5x5
   bne $s3,5,quad_5x5
jr $ra
quad_5x5color_p1:
   beq $k1,5,acertou_5x5
   bne $k1,5,quad_5x5
jr $ra
quad_5x5color_p3:
   beq $t3,5,acertou_5x5
   bne $t3,5,quad_5x5
jr $ra
quad_5x5color_p4:
   beq $t9,5,acertou_5x5
   bne $t9,5,quad_5x5
jr $ra


quad_6x5color:
   beq $t6,$s5,quad_6x5color_p2
   beq $t6,$s6,quad_6x5color_p1
   beq $t6,$s4,quad_6x5color_p3
   beq $t6,$s7,quad_6x5color_p4
jr $ra
quad_6x5color_p2:
   beq $s3,6,acertou_6x5
   bne $s3,6,quad_6x5
jr $ra
quad_6x5color_p1:
   beq $k1,6,acertou_6x5
   bne $k1,6,quad_6x5
jr $ra
quad_6x5color_p3:
   beq $t3,6,acertou_6x5
   bne $t3,6,quad_6x5
jr $ra
quad_6x5color_p4:
   beq $t9,6,acertou_6x5
   bne $t9,6,quad_6x5
jr $ra


quad_7x5color:
   beq $t6,$s5,quad_7x5color_p2
   beq $t6,$s6,quad_7x5color_p1
   beq $t6,$s4,quad_7x5color_p3
   beq $t6,$s7,quad_7x5color_p4
jr $ra
quad_7x5color_p2:
   beq $s3,7,acertou_7x5
   bne $s3,7,quad_7x5
jr $ra
quad_7x5color_p1:
   beq $k1,7,acertou_7x5
   bne $k1,7,quad_7x5
jr $ra
quad_7x5color_p3:
   beq $t3,7,acertou_7x5
   bne $t3,7,quad_7x5
jr $ra
quad_7x5color_p4:
   beq $t9,7,acertou_7x5
   bne $t9,7,quad_7x5
jr $ra


quad_8x5color:
   beq $t6,$s5,quad_8x5color_p2
   beq $t6,$s6,quad_8x5color_p1
   beq $t6,$s4,quad_8x5color_p3
   beq $t6,$s7,quad_8x5color_p4
jr $ra
quad_8x5color_p2:
   beq $s3,8,acertou_8x5
   bne $s3,8,quad_8x5
jr $ra
quad_8x5color_p1:
   beq $k1,8,acertou_8x5
   bne $k1,8,quad_8x5
jr $ra
quad_8x5color_p3:
   beq $t3,8,acertou_8x5
   bne $t3,8,quad_8x5
jr $ra
quad_8x5color_p4:
   beq $t9,8,acertou_8x5
   bne $t9,8,quad_8x5
jr $ra


quad_9x5color:
   beq $t6,$s5,quad_9x5color_p2
   beq $t6,$s6,quad_9x5color_p1
   beq $t6,$s4,quad_9x5color_p3
   beq $t6,$s7,quad_9x5color_p4
jr $ra
quad_9x5color_p2:
   beq $s3,9,acertou_9x5
   bne $s3,9,quad_9x5
jr $ra
quad_9x5color_p1:
   beq $k1,9,acertou_9x5
   bne $k1,9,quad_9x5
jr $ra
quad_9x5color_p3:
   beq $t3,9,acertou_9x5
   bne $t3,9,quad_9x5
jr $ra
quad_9x5color_p4:
   beq $t9,9,acertou_9x5
   bne $t9,9,quad_9x5
jr $ra


# linha6
quad_0x6color:
   beq $t6,$s5,quad_0x6color_p2
   beq $t6,$s6,quad_0x6color_p1
   beq $t6,$s4,quad_0x6color_p3
   beq $t6,$s7,quad_0x6color_p4
jr $ra
quad_0x6color_p2:
   beq $s3,0,acertou_0x6
   bne $s3,0,quad_0x6
jr $ra
quad_0x6color_p1:
   beq $k1,0,acertou_0x6
   bne $k1,0,quad_0x6
jr $ra
quad_0x6color_p3:
   beq $t3,0,acertou_0x6
   bne $t3,0,quad_0x6
jr $ra
quad_0x6color_p4:
   beq $t9,0,acertou_0x6
   bne $t9,0,quad_0x6
jr $ra


quad_1x6color:
   beq $t6,$s5,quad_1x6color_p2
   beq $t6,$s6,quad_1x6color_p1
   beq $t6,$s4,quad_1x6color_p3
   beq $t6,$s7,quad_1x6color_p4
jr $ra
quad_1x6color_p2:
   beq $s3,1,acertou_1x6
   bne $s3,1,quad_1x6
jr $ra
quad_1x6color_p1:
   beq $k1,1,acertou_1x6
   bne $k1,1,quad_1x6
jr $ra
quad_1x6color_p3:
   beq $t3,1,acertou_1x6
   bne $t3,1,quad_1x6
jr $ra
quad_1x6color_p4:
   beq $t9,1,acertou_1x6
   bne $t9,1,quad_1x6
jr $ra


quad_2x6color:
   beq $t6,$s5,quad_2x6color_p2
   beq $t6,$s6,quad_2x6color_p1
   beq $t6,$s4,quad_2x6color_p3
   beq $t6,$s7,quad_2x6color_p4
jr $ra
quad_2x6color_p2:
   beq $s3,2,acertou_2x6
   bne $s3,2,quad_2x6
jr $ra
quad_2x6color_p1:
   beq $k1,2,acertou_2x6
   bne $k1,2,quad_2x6
jr $ra
quad_2x6color_p3:
   beq $t3,2,acertou_2x6
   bne $t3,2,quad_2x6
jr $ra
quad_2x6color_p4:
   beq $t9,2,acertou_2x6
   bne $t9,2,quad_2x6
jr $ra


quad_3x6color:
   beq $t6,$s5,quad_3x6color_p2
   beq $t6,$s6,quad_3x6color_p1
   beq $t6,$s4,quad_3x6color_p3
   beq $t6,$s7,quad_3x6color_p4
jr $ra
quad_3x6color_p2:
   beq $s3,3,acertou_3x6
   bne $s3,3,quad_3x6
jr $ra
quad_3x6color_p1:
   beq $k1,3,acertou_3x6
   bne $k1,3,quad_3x6
jr $ra
quad_3x6color_p3:
   beq $t3,3,acertou_3x6
   bne $t3,3,quad_3x6
jr $ra
quad_3x6color_p4:
   beq $t9,3,acertou_3x6
   bne $t9,3,quad_3x6
jr $ra


quad_4x6color:
   beq $t6,$s5,quad_4x6color_p2
   beq $t6,$s6,quad_4x6color_p1
   beq $t6,$s4,quad_4x6color_p3
   beq $t6,$s7,quad_4x6color_p4
jr $ra
quad_4x6color_p2:
   beq $s3,4,acertou_4x6
   bne $s3,4,quad_4x6
jr $ra
quad_4x6color_p1:
   beq $k1,4,acertou_4x6
   bne $k1,4,quad_4x6
jr $ra
quad_4x6color_p3:
   beq $t3,4,acertou_4x6
   bne $t3,4,quad_4x6
jr $ra
quad_4x6color_p4:
   beq $t9,4,acertou_4x6
   bne $t9,4,quad_4x6
jr $ra


quad_5x6color:
   beq $t6,$s5,quad_5x6color_p2
   beq $t6,$s6,quad_5x6color_p1
   beq $t6,$s4,quad_5x6color_p3
   beq $t6,$s7,quad_5x6color_p4
jr $ra
quad_5x6color_p2:
   beq $s3,5,acertou_5x6
   bne $s3,5,quad_5x6
jr $ra
quad_5x6color_p1:
   beq $k1,5,acertou_5x6
   bne $k1,5,quad_5x6
jr $ra
quad_5x6color_p3:
   beq $t3,5,acertou_5x6
   bne $t3,5,quad_5x6
jr $ra
quad_5x6color_p4:
   beq $t9,5,acertou_5x6
   bne $t9,5,quad_5x6
jr $ra


quad_6x6color:
   beq $t6,$s5,quad_6x6color_p2
   beq $t6,$s6,quad_6x6color_p1
   beq $t6,$s4,quad_6x6color_p3
   beq $t6,$s7,quad_6x6color_p4
jr $ra
quad_6x6color_p2:
   beq $s3,6,acertou_6x6
   bne $s3,6,quad_6x6
jr $ra
quad_6x6color_p1:
   beq $k1,6,acertou_6x6
   bne $k1,6,quad_6x6
jr $ra
quad_6x6color_p3:
   beq $t3,6,acertou_6x6
   bne $t3,6,quad_6x6
jr $ra
quad_6x6color_p4:
   beq $t9,6,acertou_6x6
   bne $t9,6,quad_6x6
jr $ra


quad_7x6color:
   beq $t6,$s5,quad_7x6color_p2
   beq $t6,$s6,quad_7x6color_p1
   beq $t6,$s4,quad_7x6color_p3
   beq $t6,$s7,quad_7x6color_p4
jr $ra
quad_7x6color_p2:
   beq $s3,7,acertou_7x6
   bne $s3,7,quad_7x6
jr $ra
quad_7x6color_p1:
   beq $k1,7,acertou_7x6
   bne $k1,7,quad_7x6
jr $ra
quad_7x6color_p3:
   beq $t3,7,acertou_7x6
   bne $t3,7,quad_7x6
jr $ra
quad_7x6color_p4:
   beq $t9,7,acertou_7x6
   bne $t9,7,quad_7x6
jr $ra


quad_8x6color:
   beq $t6,$s5,quad_8x6color_p2
   beq $t6,$s6,quad_8x6color_p1
   beq $t6,$s4,quad_8x6color_p3
   beq $t6,$s7,quad_8x6color_p4
jr $ra
quad_8x6color_p2:
   beq $s3,8,acertou_8x6
   bne $s3,8,quad_8x6
jr $ra
quad_8x6color_p1:
   beq $k1,8,acertou_8x6
   bne $k1,8,quad_8x6
jr $ra
quad_8x6color_p3:
   beq $t3,8,acertou_8x6
   bne $t3,8,quad_8x6
jr $ra
quad_8x6color_p4:
   beq $t9,8,acertou_8x6
   bne $t9,8,quad_8x6
jr $ra


quad_9x6color:
   beq $t6,$s5,quad_9x6color_p2
   beq $t6,$s6,quad_9x6color_p1
   beq $t6,$s4,quad_9x6color_p3
   beq $t6,$s7,quad_9x6color_p4
jr $ra
quad_9x6color_p2:
   beq $s3,9,acertou_9x6
   bne $s3,9,quad_9x6
jr $ra
quad_9x6color_p1:
   beq $k1,9,acertou_9x6
   bne $k1,9,quad_9x6
jr $ra
quad_9x6color_p3:
   beq $t3,9,acertou_9x6
   bne $t3,9,quad_9x6
jr $ra
quad_9x6color_p4:
   beq $t9,9,acertou_9x6
   bne $t9,9,quad_9x6
jr $ra


# linha7
quad_0x7color:
   beq $t6,$s5,quad_0x7color_p2
   beq $t6,$s6,quad_0x7color_p1
   beq $t6,$s4,quad_0x7color_p3
   beq $t6,$s7,quad_0x7color_p4
jr $ra
quad_0x7color_p2:
   beq $s3,0,acertou_0x7
   bne $s3,0,quad_0x7
jr $ra
quad_0x7color_p1:
   beq $k1,0,acertou_0x7
   bne $k1,0,quad_0x7
jr $ra
quad_0x7color_p3:
   beq $t3,0,acertou_0x7
   bne $t3,0,quad_0x7
jr $ra
quad_0x7color_p4:
   beq $t9,0,acertou_0x7
   bne $t9,0,quad_0x7
jr $ra


quad_1x7color:
   beq $t6,$s5,quad_1x7color_p2
   beq $t6,$s6,quad_1x7color_p1
   beq $t6,$s4,quad_1x7color_p3
   beq $t6,$s7,quad_1x7color_p4
jr $ra
quad_1x7color_p2:
   beq $s3,1,acertou_1x7
   bne $s3,1,quad_1x7
jr $ra
quad_1x7color_p1:
   beq $k1,1,acertou_1x7
   bne $k1,1,quad_1x7
jr $ra
quad_1x7color_p3:
   beq $t3,1,acertou_1x7
   bne $t3,1,quad_1x7
jr $ra
quad_1x7color_p4:
   beq $t9,1,acertou_1x7
   bne $t9,1,quad_1x7
jr $ra


quad_2x7color:
   beq $t6,$s5,quad_2x7color_p2
   beq $t6,$s6,quad_2x7color_p1
   beq $t6,$s4,quad_2x7color_p3
   beq $t6,$s7,quad_2x7color_p4
jr $ra
quad_2x7color_p2:
   beq $s3,2,acertou_2x7
   bne $s3,2,quad_2x7
jr $ra
quad_2x7color_p1:
   beq $k1,2,acertou_2x7
   bne $k1,2,quad_2x7
jr $ra
quad_2x7color_p3:
   beq $t3,2,acertou_2x7
   bne $t3,2,quad_2x7
jr $ra
quad_2x7color_p4:
   beq $t9,2,acertou_2x7
   bne $t9,2,quad_2x7
jr $ra


quad_3x7color:
   beq $t6,$s5,quad_3x7color_p2
   beq $t6,$s6,quad_3x7color_p1
   beq $t6,$s4,quad_3x7color_p3
   beq $t6,$s7,quad_3x7color_p4
jr $ra
quad_3x7color_p2:
   beq $s3,3,acertou_3x7
   bne $s3,3,quad_3x7
jr $ra
quad_3x7color_p1:
   beq $k1,3,acertou_3x7
   bne $k1,3,quad_3x7
jr $ra
quad_3x7color_p3:
   beq $t3,3,acertou_3x7
   bne $t3,3,quad_3x7
jr $ra
quad_3x7color_p4:
   beq $t9,3,acertou_3x7
   bne $t9,3,quad_3x7
jr $ra


quad_4x7color:
   beq $t6,$s5,quad_4x7color_p2
   beq $t6,$s6,quad_4x7color_p1
   beq $t6,$s4,quad_4x7color_p3
   beq $t6,$s7,quad_4x7color_p4
jr $ra
quad_4x7color_p2:
   beq $s3,4,acertou_4x7
   bne $s3,4,quad_4x7
jr $ra
quad_4x7color_p1:
   beq $k1,4,acertou_4x7
   bne $k1,4,quad_4x7
jr $ra
quad_4x7color_p3:
   beq $t3,4,acertou_4x7
   bne $t3,4,quad_4x7
jr $ra
quad_4x7color_p4:
   beq $t9,4,acertou_4x7
   bne $t9,4,quad_4x7
jr $ra


quad_5x7color:
   beq $t6,$s5,quad_5x7color_p2
   beq $t6,$s6,quad_5x7color_p1
   beq $t6,$s4,quad_5x7color_p3
   beq $t6,$s7,quad_5x7color_p4
jr $ra
quad_5x7color_p2:
   beq $s3,5,acertou_5x7
   bne $s3,5,quad_5x7
jr $ra
quad_5x7color_p1:
   beq $k1,5,acertou_5x7
   bne $k1,5,quad_5x7
jr $ra
quad_5x7color_p3:
   beq $t3,5,acertou_5x7
   bne $t3,5,quad_5x7
jr $ra
quad_5x7color_p4:
   beq $t9,5,acertou_5x7
   bne $t9,5,quad_5x7
jr $ra


quad_6x7color:
   beq $t6,$s5,quad_6x7color_p2
   beq $t6,$s6,quad_6x7color_p1
   beq $t6,$s4,quad_6x7color_p3
   beq $t6,$s7,quad_6x7color_p4
jr $ra
quad_6x7color_p2:
   beq $s3,6,acertou_6x7
   bne $s3,6,quad_6x7
jr $ra
quad_6x7color_p1:
   beq $k1,6,acertou_6x7
   bne $k1,6,quad_6x7
jr $ra
quad_6x7color_p3:
   beq $t3,6,acertou_6x7
   bne $t3,6,quad_6x7
jr $ra
quad_6x7color_p4:
   beq $t9,6,acertou_6x7
   bne $t9,6,quad_6x7
jr $ra


quad_7x7color:
   beq $t6,$s5,quad_7x7color_p2
   beq $t6,$s6,quad_7x7color_p1
   beq $t6,$s4,quad_7x7color_p3
   beq $t6,$s7,quad_7x7color_p4
jr $ra
quad_7x7color_p2:
   beq $s3,7,acertou_7x7
   bne $s3,7,quad_7x7
jr $ra
quad_7x7color_p1:
   beq $k1,7,acertou_7x7
   bne $k1,7,quad_7x7
jr $ra
quad_7x7color_p3:
   beq $t3,7,acertou_7x7
   bne $t3,7,quad_7x7
jr $ra
quad_7x7color_p4:
   beq $t9,7,acertou_7x7
   bne $t9,7,quad_7x7
jr $ra


quad_8x7color:
   beq $t6,$s5,quad_8x7color_p2
   beq $t6,$s6,quad_8x7color_p1
   beq $t6,$s4,quad_8x7color_p3
   beq $t6,$s7,quad_8x7color_p4
jr $ra
quad_8x7color_p2:
   beq $s3,8,acertou_8x7
   bne $s3,8,quad_8x7
jr $ra
quad_8x7color_p1:
   beq $k1,8,acertou_8x7
   bne $k1,8,quad_8x7
jr $ra
quad_8x7color_p3:
   beq $t3,8,acertou_8x7
   bne $t3,8,quad_8x7
jr $ra
quad_8x7color_p4:
   beq $t9,8,acertou_8x7
   bne $t9,8,quad_8x7
jr $ra


quad_9x7color:
   beq $t6,$s5,quad_9x7color_p2
   beq $t6,$s6,quad_9x7color_p1
   beq $t6,$s4,quad_9x7color_p3
   beq $t6,$s7,quad_9x7color_p4
jr $ra
quad_9x7color_p2:
   beq $s3,9,acertou_9x7
   bne $s3,9,quad_9x7
jr $ra
quad_9x7color_p1:
   beq $k1,9,acertou_9x7
   bne $k1,9,quad_9x7
jr $ra
quad_9x7color_p3:
   beq $t3,9,acertou_9x7
   bne $t3,9,quad_9x7
jr $ra
quad_9x7color_p4:
   beq $t9,9,acertou_9x7
   bne $t9,9,quad_9x7
jr $ra


# linha8
quad_0x8color:
   beq $t6,$s5,quad_0x8color_p2
   beq $t6,$s6,quad_0x8color_p1
   beq $t6,$s4,quad_0x8color_p3
   beq $t6,$s7,quad_0x8color_p4
jr $ra
quad_0x8color_p2:
   beq $s3,0,acertou_0x8
   bne $s3,0,quad_0x8
jr $ra
quad_0x8color_p1:
   beq $k1,0,acertou_0x8
   bne $k1,0,quad_0x8
jr $ra
quad_0x8color_p3:
   beq $t3,0,acertou_0x8
   bne $t3,0,quad_0x8
jr $ra
quad_0x8color_p4:
   beq $t9,0,acertou_0x8
   bne $t9,0,quad_0x8
jr $ra


quad_1x8color:
   beq $t6,$s5,quad_1x8color_p2
   beq $t6,$s6,quad_1x8color_p1
   beq $t6,$s4,quad_1x8color_p3
   beq $t6,$s7,quad_1x8color_p4
jr $ra
quad_1x8color_p2:
   beq $s3,1,acertou_1x8
   bne $s3,1,quad_1x8
jr $ra
quad_1x8color_p1:
   beq $k1,1,acertou_1x8
   bne $k1,1,quad_1x8
jr $ra
quad_1x8color_p3:
   beq $t3,1,acertou_1x8
   bne $t3,1,quad_1x8
jr $ra
quad_1x8color_p4:
   beq $t9,1,acertou_1x8
   bne $t9,1,quad_1x8
jr $ra


quad_2x8color:
   beq $t6,$s5,quad_2x8color_p2
   beq $t6,$s6,quad_2x8color_p1
   beq $t6,$s4,quad_2x8color_p3
   beq $t6,$s7,quad_2x8color_p4
jr $ra
quad_2x8color_p2:
   beq $s3,2,acertou_2x8
   bne $s3,2,quad_2x8
jr $ra
quad_2x8color_p1:
   beq $k1,2,acertou_2x8
   bne $k1,2,quad_2x8
jr $ra
quad_2x8color_p3:
   beq $t3,2,acertou_2x8
   bne $t3,2,quad_2x8
jr $ra
quad_2x8color_p4:
   beq $t9,2,acertou_2x8
   bne $t9,2,quad_2x8
jr $ra


quad_3x8color:
   beq $t6,$s5,quad_3x8color_p2
   beq $t6,$s6,quad_3x8color_p1
   beq $t6,$s4,quad_3x8color_p3
   beq $t6,$s7,quad_3x8color_p4
jr $ra
quad_3x8color_p2:
   beq $s3,3,acertou_3x8
   bne $s3,3,quad_3x8
jr $ra
quad_3x8color_p1:
   beq $k1,3,acertou_3x8
   bne $k1,3,quad_3x8
jr $ra
quad_3x8color_p3:
   beq $t3,3,acertou_3x8
   bne $t3,3,quad_3x8
jr $ra
quad_3x8color_p4:
   beq $t9,3,acertou_3x8
   bne $t9,3,quad_3x8
jr $ra


quad_4x8color:
   beq $t6,$s5,quad_4x8color_p2
   beq $t6,$s6,quad_4x8color_p1
   beq $t6,$s4,quad_4x8color_p3
   beq $t6,$s7,quad_4x8color_p4
jr $ra
quad_4x8color_p2:
   beq $s3,4,acertou_4x8
   bne $s3,4,quad_4x8
jr $ra
quad_4x8color_p1:
   beq $k1,4,acertou_4x8
   bne $k1,4,quad_4x8
jr $ra
quad_4x8color_p3:
   beq $t3,4,acertou_4x8
   bne $t3,4,quad_4x8
jr $ra
quad_4x8color_p4:
   beq $t9,4,acertou_4x8
   bne $t9,4,quad_4x8
jr $ra


quad_5x8color:
   beq $t6,$s5,quad_5x8color_p2
   beq $t6,$s6,quad_5x8color_p1
   beq $t6,$s4,quad_5x8color_p3
   beq $t6,$s7,quad_5x8color_p4
jr $ra
quad_5x8color_p2:
   beq $s3,5,acertou_5x8
   bne $s3,5,quad_5x8
jr $ra
quad_5x8color_p1:
   beq $k1,5,acertou_5x8
   bne $k1,5,quad_5x8
jr $ra
quad_5x8color_p3:
   beq $t3,5,acertou_5x8
   bne $t3,5,quad_5x8
jr $ra
quad_5x8color_p4:
   beq $t9,5,acertou_5x8
   bne $t9,5,quad_5x8
jr $ra


quad_6x8color:
   beq $t6,$s5,quad_6x8color_p2
   beq $t6,$s6,quad_6x8color_p1
   beq $t6,$s4,quad_6x8color_p3
   beq $t6,$s7,quad_6x8color_p4
jr $ra
quad_6x8color_p2:
   beq $s3,6,acertou_6x8
   bne $s3,6,quad_6x8
jr $ra
quad_6x8color_p1:
   beq $k1,6,acertou_6x8
   bne $k1,6,quad_6x8
jr $ra
quad_6x8color_p3:
   beq $t3,6,acertou_6x8
   bne $t3,6,quad_6x8
jr $ra
quad_6x8color_p4:
   beq $t9,6,acertou_6x8
   bne $t9,6,quad_6x8
jr $ra


quad_7x8color:
   beq $t6,$s5,quad_7x8color_p2
   beq $t6,$s6,quad_7x8color_p1
   beq $t6,$s4,quad_7x8color_p3
   beq $t6,$s7,quad_7x8color_p4
jr $ra
quad_7x8color_p2:
   beq $s3,7,acertou_7x8
   bne $s3,7,quad_7x8
jr $ra
quad_7x8color_p1:
   beq $k1,7,acertou_7x8
   bne $k1,7,quad_7x8
jr $ra
quad_7x8color_p3:
   beq $t3,7,acertou_7x8
   bne $t3,7,quad_7x8
jr $ra
quad_7x8color_p4:
   beq $t9,7,acertou_7x8
   bne $t9,7,quad_7x8
jr $ra


quad_8x8color:
   beq $t6,$s5,quad_8x8color_p2
   beq $t6,$s6,quad_8x8color_p1
   beq $t6,$s4,quad_8x8color_p3
   beq $t6,$s7,quad_8x8color_p4
jr $ra
quad_8x8color_p2:
   beq $s3,8,acertou_8x8
   bne $s3,8,quad_8x8
jr $ra
quad_8x8color_p1:
   beq $k1,8,acertou_8x8
   bne $k1,8,quad_8x8
jr $ra
quad_8x8color_p3:
   beq $t3,8,acertou_8x8
   bne $t3,8,quad_8x8
jr $ra
quad_8x8color_p4:
   beq $t9,8,acertou_8x8
   bne $t9,8,quad_8x8
jr $ra


quad_9x8color:
   beq $t6,$s5,quad_9x8color_p2
   beq $t6,$s6,quad_9x8color_p1
   beq $t6,$s4,quad_9x8color_p3
   beq $t6,$s7,quad_9x8color_p4
jr $ra
quad_9x8color_p2:
   beq $s3,9,acertou_9x8
   bne $s3,9,quad_9x8
jr $ra
quad_9x8color_p1:
   beq $k1,9,acertou_9x8
   bne $k1,9,quad_9x8
jr $ra
quad_9x8color_p3:
   beq $t3,9,acertou_9x8
   bne $t3,9,quad_9x8
jr $ra
quad_9x8color_p4:
   beq $t9,9,acertou_9x8
   bne $t9,9,quad_9x8
jr $ra

#============================  LINHAS DO TABULEIRO  ===========================
#==============================================================================


# ==================== linha 0================== 
row_0x0:
    beq $t6,$s5,linha_s5x0x0
    beq $t6,$s6,linha_s6x0x0
    beq $t6,$s4,linha_s4x0x0
    beq $t6,$s7,linha_s7x0x0
        bne $t6,$s5,p_0x0
        p_0x0:bne $t6,$s6,p_0x0x0
        p_0x0x0: bne $t6,$s4,p_0x0x0x0
        p_0x0x0x0: bne $t6,$s7,quad_0x0
jr $ra
linha_s5x0x0:
       beq $s5,0,quad_0x0color
       bne $s5,0,quad_0x0
jr $ra
linha_s6x0x0:
       beq $s6,0,quad_0x0color
       bne $s6,0,quad_0x0
jr $ra
linha_s4x0x0:
       beq $s4,0,quad_0x0color
       bne $s4,0,quad_0x0
jr $ra
linha_s7x0x0:
       beq $s7,0,quad_0x0color
       bne $s7,0,quad_0x0
jr $ra


row_1x0:
    beq $t6,$s5,linha_s5x1x0
    beq $t6,$s6,linha_s6x1x0
    beq $t6,$s4,linha_s4x1x0
    beq $t6,$s7,linha_s7x1x0
        bne $t6,$s5,p_1x0
        p_1x0:bne $t6,$s6,p_1x0x0
        p_1x0x0: bne $t6,$s4,p_1x0x0x0
        p_1x0x0x0: bne $t6,$s7,quad_1x0
jr $ra
linha_s5x1x0:
       beq $s5,0,quad_1x0color
       bne $s5,0,quad_1x0
jr $ra
linha_s6x1x0:
       beq $s6,0,quad_1x0color
       bne $s6,0,quad_1x0
jr $ra
linha_s4x1x0:
       beq $s4,0,quad_1x0color
       bne $s4,0,quad_1x0
jr $ra
linha_s7x1x0:
       beq $s7,0,quad_1x0color
       bne $s7,0,quad_1x0
jr $ra


row_2x0:
    beq $t6,$s5,linha_s5x2x0
    beq $t6,$s6,linha_s6x2x0
    beq $t6,$s4,linha_s4x2x0
    beq $t6,$s7,linha_s7x2x0
        bne $t6,$s5,p_2x0
        p_2x0:bne $t6,$s6,p_2x0x0
        p_2x0x0: bne $t6,$s4,p_2x0x0x0
        p_2x0x0x0: bne $t6,$s7,quad_2x0
jr $ra
linha_s5x2x0:
       beq $s5,0,quad_2x0color
       bne $s5,0,quad_2x0
jr $ra
linha_s6x2x0:
       beq $s6,0,quad_2x0color
       bne $s6,0,quad_2x0
jr $ra
linha_s4x2x0:
       beq $s4,0,quad_2x0color
       bne $s4,0,quad_2x0
jr $ra
linha_s7x2x0:
       beq $s7,0,quad_2x0color
       bne $s7,0,quad_2x0
jr $ra


row_3x0:
    beq $t6,$s5,linha_s5x3x0
    beq $t6,$s6,linha_s6x3x0
    beq $t6,$s4,linha_s4x3x0
    beq $t6,$s7,linha_s7x3x0
        bne $t6,$s5,p_3x0
        p_3x0:bne $t6,$s6,p_3x0x0
        p_3x0x0: bne $t6,$s4,p_3x0x0x0
        p_3x0x0x0: bne $t6,$s7,quad_3x0
jr $ra
linha_s5x3x0:
       beq $s5,0,quad_3x0color
       bne $s5,0,quad_3x0
jr $ra
linha_s6x3x0:
       beq $s6,0,quad_3x0color
       bne $s6,0,quad_3x0
jr $ra
linha_s4x3x0:
       beq $s4,0,quad_3x0color
       bne $s4,0,quad_3x0
jr $ra
linha_s7x3x0:
       beq $s7,0,quad_3x0color
       bne $s7,0,quad_3x0
jr $ra


row_4x0:
    beq $t6,$s5,linha_s5x4x0
    beq $t6,$s6,linha_s6x4x0
    beq $t6,$s4,linha_s4x4x0
    beq $t6,$s7,linha_s7x4x0
        bne $t6,$s5,p_4x0
        p_4x0:bne $t6,$s6,p_4x0x0
        p_4x0x0: bne $t6,$s4,p_4x0x0x0
        p_4x0x0x0: bne $t6,$s7,quad_4x0
jr $ra
linha_s5x4x0:
       beq $s5,0,quad_4x0color
       bne $s5,0,quad_4x0
jr $ra
linha_s6x4x0:
       beq $s6,0,quad_4x0color
       bne $s6,0,quad_4x0
jr $ra
linha_s4x4x0:
       beq $s4,0,quad_4x0color
       bne $s4,0,quad_4x0
jr $ra
linha_s7x4x0:
       beq $s7,0,quad_4x0color
       bne $s7,0,quad_4x0
jr $ra


row_5x0:
    beq $t6,$s5,linha_s5x5x0
    beq $t6,$s6,linha_s6x5x0
    beq $t6,$s4,linha_s4x5x0
    beq $t6,$s7,linha_s7x5x0
        bne $t6,$s5,p_5x0
        p_5x0:bne $t6,$s6,p_5x0x0
        p_5x0x0: bne $t6,$s4,p_5x0x0x0
        p_5x0x0x0: bne $t6,$s7,quad_5x0
jr $ra
linha_s5x5x0:
       beq $s5,0,quad_5x0color
       bne $s5,0,quad_5x0
jr $ra
linha_s6x5x0:
       beq $s6,0,quad_5x0color
       bne $s6,0,quad_5x0
jr $ra
linha_s4x5x0:
       beq $s4,0,quad_5x0color
       bne $s4,0,quad_5x0
jr $ra
linha_s7x5x0:
       beq $s7,0,quad_5x0color
       bne $s7,0,quad_5x0
jr $ra


row_6x0:
    beq $t6,$s5,linha_s5x6x0
    beq $t6,$s6,linha_s6x6x0
    beq $t6,$s4,linha_s4x6x0
    beq $t6,$s7,linha_s7x6x0
        bne $t6,$s5,p_6x0
        p_6x0:bne $t6,$s6,p_6x0x0
        p_6x0x0: bne $t6,$s4,p_6x0x0x0
        p_6x0x0x0: bne $t6,$s7,quad_6x0
jr $ra
linha_s5x6x0:
       beq $s5,0,quad_6x0color
       bne $s5,0,quad_6x0
jr $ra
linha_s6x6x0:
       beq $s6,0,quad_6x0color
       bne $s6,0,quad_6x0
jr $ra
linha_s4x6x0:
       beq $s4,0,quad_6x0color
       bne $s4,0,quad_6x0
jr $ra
linha_s7x6x0:
       beq $s7,0,quad_6x0color
       bne $s7,0,quad_6x0
jr $ra


row_7x0:
    beq $t6,$s5,linha_s5x7x0
    beq $t6,$s6,linha_s6x7x0
    beq $t6,$s4,linha_s4x7x0
    beq $t6,$s7,linha_s7x7x0
        bne $t6,$s5,p_7x0
        p_7x0:bne $t6,$s6,p_7x0x0
        p_7x0x0: bne $t6,$s4,p_7x0x0x0
        p_7x0x0x0: bne $t6,$s7,quad_7x0
jr $ra
linha_s5x7x0:
       beq $s5,0,quad_7x0color
       bne $s5,0,quad_7x0
jr $ra
linha_s6x7x0:
       beq $s6,0,quad_7x0color
       bne $s6,0,quad_7x0
jr $ra
linha_s4x7x0:
       beq $s4,0,quad_7x0color
       bne $s4,0,quad_7x0
jr $ra
linha_s7x7x0:
       beq $s7,0,quad_7x0color
       bne $s7,0,quad_7x0
jr $ra


row_8x0:
    beq $t6,$s5,linha_s5x8x0
    beq $t6,$s6,linha_s6x8x0
    beq $t6,$s4,linha_s4x8x0
    beq $t6,$s7,linha_s7x8x0
        bne $t6,$s5,p_8x0
        p_8x0:bne $t6,$s6,p_8x0x0
        p_8x0x0: bne $t6,$s4,p_8x0x0x0
        p_8x0x0x0: bne $t6,$s7,quad_8x0
jr $ra
linha_s5x8x0:
       beq $s5,0,quad_8x0color
       bne $s5,0,quad_8x0
jr $ra
linha_s6x8x0:
       beq $s6,0,quad_8x0color
       bne $s6,0,quad_8x0
jr $ra
linha_s4x8x0:
       beq $s4,0,quad_8x0color
       bne $s4,0,quad_8x0
jr $ra
linha_s7x8x0:
       beq $s7,0,quad_8x0color
       bne $s7,0,quad_8x0
jr $ra


row_9x0:
    beq $t6,$s5,linha_s5x9x0
    beq $t6,$s6,linha_s6x9x0
    beq $t6,$s4,linha_s4x9x0
    beq $t6,$s7,linha_s7x9x0
        bne $t6,$s5,p_9x0
        p_9x0:bne $t6,$s6,p_9x0x0
        p_9x0x0: bne $t6,$s4,p_9x0x0x0
        p_9x0x0x0: bne $t6,$s7,quad_9x0
jr $ra
linha_s5x9x0:
       beq $s5,0,quad_9x0color
       bne $s5,0,quad_9x0
jr $ra
linha_s6x9x0:
       beq $s6,0,quad_9x0color
       bne $s6,0,quad_9x0
jr $ra
linha_s4x9x0:
       beq $s4,0,quad_9x0color
       bne $s4,0,quad_9x0
jr $ra
linha_s7x9x0:
       beq $s7,0,quad_9x0color
       bne $s7,0,quad_9x0
jr $ra


# ==================== linha 1================== 
row_0x1:
    beq $t6,$s5,linha_s5x0x1
    beq $t6,$s6,linha_s6x0x1
    beq $t6,$s4,linha_s4x0x1
    beq $t6,$s7,linha_s7x0x1
        bne $t6,$s5,p_0x1
        p_0x1:bne $t6,$s6,p_0x1x1
        p_0x1x1: bne $t6,$s4,p_0x1x1x1
        p_0x1x1x1: bne $t6,$s7,quad_0x1
jr $ra
linha_s5x0x1:
       beq $s5,1,quad_0x1color
       bne $s5,1,quad_0x1
jr $ra
linha_s6x0x1:
       beq $s6,1,quad_0x1color
       bne $s6,1,quad_0x1
jr $ra
linha_s4x0x1:
       beq $s4,1,quad_0x1color
       bne $s4,1,quad_0x1
jr $ra
linha_s7x0x1:
       beq $s7,1,quad_0x1color
       bne $s7,1,quad_0x1
jr $ra


row_1x1:
    beq $t6,$s5,linha_s5x1x1
    beq $t6,$s6,linha_s6x1x1
    beq $t6,$s4,linha_s4x1x1
    beq $t6,$s7,linha_s7x1x1
        bne $t6,$s5,p_1x1
        p_1x1:bne $t6,$s6,p_1x1x1
        p_1x1x1: bne $t6,$s4,p_1x1x1x1
        p_1x1x1x1: bne $t6,$s7,quad_1x1
jr $ra
linha_s5x1x1:
       beq $s5,1,quad_1x1color
       bne $s5,1,quad_1x1
jr $ra
linha_s6x1x1:
       beq $s6,1,quad_1x1color
       bne $s6,1,quad_1x1
jr $ra
linha_s4x1x1:
       beq $s4,1,quad_1x1color
       bne $s4,1,quad_1x1
jr $ra
linha_s7x1x1:
       beq $s7,1,quad_1x1color
       bne $s7,1,quad_1x1
jr $ra


row_2x1:
    beq $t6,$s5,linha_s5x2x1
    beq $t6,$s6,linha_s6x2x1
    beq $t6,$s4,linha_s4x2x1
    beq $t6,$s7,linha_s7x2x1
        bne $t6,$s5,p_2x1
        p_2x1:bne $t6,$s6,p_2x1x1
        p_2x1x1: bne $t6,$s4,p_2x1x1x1
        p_2x1x1x1: bne $t6,$s7,quad_2x1
jr $ra
linha_s5x2x1:
       beq $s5,1,quad_2x1color
       bne $s5,1,quad_2x1
jr $ra
linha_s6x2x1:
       beq $s6,1,quad_2x1color
       bne $s6,1,quad_2x1
jr $ra
linha_s4x2x1:
       beq $s4,1,quad_2x1color
       bne $s4,1,quad_2x1
jr $ra
linha_s7x2x1:
       beq $s7,1,quad_2x1color
       bne $s7,1,quad_2x1
jr $ra


row_3x1:
    beq $t6,$s5,linha_s5x3x1
    beq $t6,$s6,linha_s6x3x1
    beq $t6,$s4,linha_s4x3x1
    beq $t6,$s7,linha_s7x3x1
        bne $t6,$s5,p_3x1
        p_3x1:bne $t6,$s6,p_3x1x1
        p_3x1x1: bne $t6,$s4,p_3x1x1x1
        p_3x1x1x1: bne $t6,$s7,quad_3x1
jr $ra
linha_s5x3x1:
       beq $s5,1,quad_3x1color
       bne $s5,1,quad_3x1
jr $ra
linha_s6x3x1:
       beq $s6,1,quad_3x1color
       bne $s6,1,quad_3x1
jr $ra
linha_s4x3x1:
       beq $s4,1,quad_3x1color
       bne $s4,1,quad_3x1
jr $ra
linha_s7x3x1:
       beq $s7,1,quad_3x1color
       bne $s7,1,quad_3x1
jr $ra


row_4x1:
    beq $t6,$s5,linha_s5x4x1
    beq $t6,$s6,linha_s6x4x1
    beq $t6,$s4,linha_s4x4x1
    beq $t6,$s7,linha_s7x4x1
        bne $t6,$s5,p_4x1
        p_4x1:bne $t6,$s6,p_4x1x1
        p_4x1x1: bne $t6,$s4,p_4x1x1x1
        p_4x1x1x1: bne $t6,$s7,quad_4x1
jr $ra
linha_s5x4x1:
       beq $s5,1,quad_4x1color
       bne $s5,1,quad_4x1
jr $ra
linha_s6x4x1:
       beq $s6,1,quad_4x1color
       bne $s6,1,quad_4x1
jr $ra
linha_s4x4x1:
       beq $s4,1,quad_4x1color
       bne $s4,1,quad_4x1
jr $ra
linha_s7x4x1:
       beq $s7,1,quad_4x1color
       bne $s7,1,quad_4x1
jr $ra


row_5x1:
    beq $t6,$s5,linha_s5x5x1
    beq $t6,$s6,linha_s6x5x1
    beq $t6,$s4,linha_s4x5x1
    beq $t6,$s7,linha_s7x5x1
        bne $t6,$s5,p_5x1
        p_5x1:bne $t6,$s6,p_5x1x1
        p_5x1x1: bne $t6,$s4,p_5x1x1x1
        p_5x1x1x1: bne $t6,$s7,quad_5x1
jr $ra
linha_s5x5x1:
       beq $s5,1,quad_5x1color
       bne $s5,1,quad_5x1
jr $ra
linha_s6x5x1:
       beq $s6,1,quad_5x1color
       bne $s6,1,quad_5x1
jr $ra
linha_s4x5x1:
       beq $s4,1,quad_5x1color
       bne $s4,1,quad_5x1
jr $ra
linha_s7x5x1:
       beq $s7,1,quad_5x1color
       bne $s7,1,quad_5x1
jr $ra


row_6x1:
    beq $t6,$s5,linha_s5x6x1
    beq $t6,$s6,linha_s6x6x1
    beq $t6,$s4,linha_s4x6x1
    beq $t6,$s7,linha_s7x6x1
        bne $t6,$s5,p_6x1
        p_6x1:bne $t6,$s6,p_6x1x1
        p_6x1x1: bne $t6,$s4,p_6x1x1x1
        p_6x1x1x1: bne $t6,$s7,quad_6x1
jr $ra
linha_s5x6x1:
       beq $s5,1,quad_6x1color
       bne $s5,1,quad_6x1
jr $ra
linha_s6x6x1:
       beq $s6,1,quad_6x1color
       bne $s6,1,quad_6x1
jr $ra
linha_s4x6x1:
       beq $s4,1,quad_6x1color
       bne $s4,1,quad_6x1
jr $ra
linha_s7x6x1:
       beq $s7,1,quad_6x1color
       bne $s7,1,quad_6x1
jr $ra


row_7x1:
    beq $t6,$s5,linha_s5x7x1
    beq $t6,$s6,linha_s6x7x1
    beq $t6,$s4,linha_s4x7x1
    beq $t6,$s7,linha_s7x7x1
        bne $t6,$s5,p_7x1
        p_7x1:bne $t6,$s6,p_7x1x1
        p_7x1x1: bne $t6,$s4,p_7x1x1x1
        p_7x1x1x1: bne $t6,$s7,quad_7x1
jr $ra
linha_s5x7x1:
       beq $s5,1,quad_7x1color
       bne $s5,1,quad_7x1
jr $ra
linha_s6x7x1:
       beq $s6,1,quad_7x1color
       bne $s6,1,quad_7x1
jr $ra
linha_s4x7x1:
       beq $s4,1,quad_7x1color
       bne $s4,1,quad_7x1
jr $ra
linha_s7x7x1:
       beq $s7,1,quad_7x1color
       bne $s7,1,quad_7x1
jr $ra


row_8x1:
    beq $t6,$s5,linha_s5x8x1
    beq $t6,$s6,linha_s6x8x1
    beq $t6,$s4,linha_s4x8x1
    beq $t6,$s7,linha_s7x8x1
        bne $t6,$s5,p_8x1
        p_8x1:bne $t6,$s6,p_8x1x1
        p_8x1x1: bne $t6,$s4,p_8x1x1x1
        p_8x1x1x1: bne $t6,$s7,quad_8x1
jr $ra
linha_s5x8x1:
       beq $s5,1,quad_8x1color
       bne $s5,1,quad_8x1
jr $ra
linha_s6x8x1:
       beq $s6,1,quad_8x1color
       bne $s6,1,quad_8x1
jr $ra
linha_s4x8x1:
       beq $s4,1,quad_8x1color
       bne $s4,1,quad_8x1
jr $ra
linha_s7x8x1:
       beq $s7,1,quad_8x1color
       bne $s7,1,quad_8x1
jr $ra


row_9x1:
    beq $t6,$s5,linha_s5x9x1
    beq $t6,$s6,linha_s6x9x1
    beq $t6,$s4,linha_s4x9x1
    beq $t6,$s7,linha_s7x9x1
        bne $t6,$s5,p_9x1
        p_9x1:bne $t6,$s6,p_9x1x1
        p_9x1x1: bne $t6,$s4,p_9x1x1x1
        p_9x1x1x1: bne $t6,$s7,quad_9x1
jr $ra
linha_s5x9x1:
       beq $s5,1,quad_9x1color
       bne $s5,1,quad_9x1
jr $ra
linha_s6x9x1:
       beq $s6,1,quad_9x1color
       bne $s6,1,quad_9x1
jr $ra
linha_s4x9x1:
       beq $s4,1,quad_9x1color
       bne $s4,1,quad_9x1
jr $ra
linha_s7x9x1:
       beq $s7,1,quad_9x1color
       bne $s7,1,quad_9x1
jr $ra


# ==================== linha 2================== 
row_0x2:
    beq $t6,$s5,linha_s5x0x2
    beq $t6,$s6,linha_s6x0x2
    beq $t6,$s4,linha_s4x0x2
    beq $t6,$s7,linha_s7x0x2
        bne $t6,$s5,p_0x2
        p_0x2:bne $t6,$s6,p_0x2x2
        p_0x2x2: bne $t6,$s4,p_0x2x2x2
        p_0x2x2x2: bne $t6,$s7,quad_0x2
jr $ra
linha_s5x0x2:
       beq $s5,2,quad_0x2color
       bne $s5,2,quad_0x2
jr $ra
linha_s6x0x2:
       beq $s6,2,quad_0x2color
       bne $s6,2,quad_0x2
jr $ra
linha_s4x0x2:
       beq $s4,2,quad_0x2color
       bne $s4,2,quad_0x2
jr $ra
linha_s7x0x2:
       beq $s7,2,quad_0x2color
       bne $s7,2,quad_0x2
jr $ra


row_1x2:
    beq $t6,$s5,linha_s5x1x2
    beq $t6,$s6,linha_s6x1x2
    beq $t6,$s4,linha_s4x1x2
    beq $t6,$s7,linha_s7x1x2
        bne $t6,$s5,p_1x2
        p_1x2:bne $t6,$s6,p_1x2x2
        p_1x2x2: bne $t6,$s4,p_1x2x2x2
        p_1x2x2x2: bne $t6,$s7,quad_1x2
jr $ra
linha_s5x1x2:
       beq $s5,2,quad_1x2color
       bne $s5,2,quad_1x2
jr $ra
linha_s6x1x2:
       beq $s6,2,quad_1x2color
       bne $s6,2,quad_1x2
jr $ra
linha_s4x1x2:
       beq $s4,2,quad_1x2color
       bne $s4,2,quad_1x2
jr $ra
linha_s7x1x2:
       beq $s7,2,quad_1x2color
       bne $s7,2,quad_1x2
jr $ra


row_2x2:
    beq $t6,$s5,linha_s5x2x2
    beq $t6,$s6,linha_s6x2x2
    beq $t6,$s4,linha_s4x2x2
    beq $t6,$s7,linha_s7x2x2
        bne $t6,$s5,p_2x2
        p_2x2:bne $t6,$s6,p_2x2x2
        p_2x2x2: bne $t6,$s4,p_2x2x2x2
        p_2x2x2x2: bne $t6,$s7,quad_2x2
jr $ra
linha_s5x2x2:
       beq $s5,2,quad_2x2color
       bne $s5,2,quad_2x2
jr $ra
linha_s6x2x2:
       beq $s6,2,quad_2x2color
       bne $s6,2,quad_2x2
jr $ra
linha_s4x2x2:
       beq $s4,2,quad_2x2color
       bne $s4,2,quad_2x2
jr $ra
linha_s7x2x2:
       beq $s7,2,quad_2x2color
       bne $s7,2,quad_2x2
jr $ra


row_3x2:
    beq $t6,$s5,linha_s5x3x2
    beq $t6,$s6,linha_s6x3x2
    beq $t6,$s4,linha_s4x3x2
    beq $t6,$s7,linha_s7x3x2
        bne $t6,$s5,p_3x2
        p_3x2:bne $t6,$s6,p_3x2x2
        p_3x2x2: bne $t6,$s4,p_3x2x2x2
        p_3x2x2x2: bne $t6,$s7,quad_3x2
jr $ra
linha_s5x3x2:
       beq $s5,2,quad_3x2color
       bne $s5,2,quad_3x2
jr $ra
linha_s6x3x2:
       beq $s6,2,quad_3x2color
       bne $s6,2,quad_3x2
jr $ra
linha_s4x3x2:
       beq $s4,2,quad_3x2color
       bne $s4,2,quad_3x2
jr $ra
linha_s7x3x2:
       beq $s7,2,quad_3x2color
       bne $s7,2,quad_3x2
jr $ra


row_4x2:
    beq $t6,$s5,linha_s5x4x2
    beq $t6,$s6,linha_s6x4x2
    beq $t6,$s4,linha_s4x4x2
    beq $t6,$s7,linha_s7x4x2
        bne $t6,$s5,p_4x2
        p_4x2:bne $t6,$s6,p_4x2x2
        p_4x2x2: bne $t6,$s4,p_4x2x2x2
        p_4x2x2x2: bne $t6,$s7,quad_4x2
jr $ra
linha_s5x4x2:
       beq $s5,2,quad_4x2color
       bne $s5,2,quad_4x2
jr $ra
linha_s6x4x2:
       beq $s6,2,quad_4x2color
       bne $s6,2,quad_4x2
jr $ra
linha_s4x4x2:
       beq $s4,2,quad_4x2color
       bne $s4,2,quad_4x2
jr $ra
linha_s7x4x2:
       beq $s7,2,quad_4x2color
       bne $s7,2,quad_4x2
jr $ra


row_5x2:
    beq $t6,$s5,linha_s5x5x2
    beq $t6,$s6,linha_s6x5x2
    beq $t6,$s4,linha_s4x5x2
    beq $t6,$s7,linha_s7x5x2
        bne $t6,$s5,p_5x2
        p_5x2:bne $t6,$s6,p_5x2x2
        p_5x2x2: bne $t6,$s4,p_5x2x2x2
        p_5x2x2x2: bne $t6,$s7,quad_5x2
jr $ra
linha_s5x5x2:
       beq $s5,2,quad_5x2color
       bne $s5,2,quad_5x2
jr $ra
linha_s6x5x2:
       beq $s6,2,quad_5x2color
       bne $s6,2,quad_5x2
jr $ra
linha_s4x5x2:
       beq $s4,2,quad_5x2color
       bne $s4,2,quad_5x2
jr $ra
linha_s7x5x2:
       beq $s7,2,quad_5x2color
       bne $s7,2,quad_5x2
jr $ra


row_6x2:
    beq $t6,$s5,linha_s5x6x2
    beq $t6,$s6,linha_s6x6x2
    beq $t6,$s4,linha_s4x6x2
    beq $t6,$s7,linha_s7x6x2
        bne $t6,$s5,p_6x2
        p_6x2:bne $t6,$s6,p_6x2x2
        p_6x2x2: bne $t6,$s4,p_6x2x2x2
        p_6x2x2x2: bne $t6,$s7,quad_6x2
jr $ra
linha_s5x6x2:
       beq $s5,2,quad_6x2color
       bne $s5,2,quad_6x2
jr $ra
linha_s6x6x2:
       beq $s6,2,quad_6x2color
       bne $s6,2,quad_6x2
jr $ra
linha_s4x6x2:
       beq $s4,2,quad_6x2color
       bne $s4,2,quad_6x2
jr $ra
linha_s7x6x2:
       beq $s7,2,quad_6x2color
       bne $s7,2,quad_6x2
jr $ra


row_7x2:
    beq $t6,$s5,linha_s5x7x2
    beq $t6,$s6,linha_s6x7x2
    beq $t6,$s4,linha_s4x7x2
    beq $t6,$s7,linha_s7x7x2
        bne $t6,$s5,p_7x2
        p_7x2:bne $t6,$s6,p_7x2x2
        p_7x2x2: bne $t6,$s4,p_7x2x2x2
        p_7x2x2x2: bne $t6,$s7,quad_7x2
jr $ra
linha_s5x7x2:
       beq $s5,2,quad_7x2color
       bne $s5,2,quad_7x2
jr $ra
linha_s6x7x2:
       beq $s6,2,quad_7x2color
       bne $s6,2,quad_7x2
jr $ra
linha_s4x7x2:
       beq $s4,2,quad_7x2color
       bne $s4,2,quad_7x2
jr $ra
linha_s7x7x2:
       beq $s7,2,quad_7x2color
       bne $s7,2,quad_7x2
jr $ra


row_8x2:
    beq $t6,$s5,linha_s5x8x2
    beq $t6,$s6,linha_s6x8x2
    beq $t6,$s4,linha_s4x8x2
    beq $t6,$s7,linha_s7x8x2
        bne $t6,$s5,p_8x2
        p_8x2:bne $t6,$s6,p_8x2x2
        p_8x2x2: bne $t6,$s4,p_8x2x2x2
        p_8x2x2x2: bne $t6,$s7,quad_8x2
jr $ra
linha_s5x8x2:
       beq $s5,2,quad_8x2color
       bne $s5,2,quad_8x2
jr $ra
linha_s6x8x2:
       beq $s6,2,quad_8x2color
       bne $s6,2,quad_8x2
jr $ra
linha_s4x8x2:
       beq $s4,2,quad_8x2color
       bne $s4,2,quad_8x2
jr $ra
linha_s7x8x2:
       beq $s7,2,quad_8x2color
       bne $s7,2,quad_8x2
jr $ra


row_9x2:
    beq $t6,$s5,linha_s5x9x2
    beq $t6,$s6,linha_s6x9x2
    beq $t6,$s4,linha_s4x9x2
    beq $t6,$s7,linha_s7x9x2
        bne $t6,$s5,p_9x2
        p_9x2:bne $t6,$s6,p_9x2x2
        p_9x2x2: bne $t6,$s4,p_9x2x2x2
        p_9x2x2x2: bne $t6,$s7,quad_9x2
jr $ra
linha_s5x9x2:
       beq $s5,2,quad_9x2color
       bne $s5,2,quad_9x2
jr $ra
linha_s6x9x2:
       beq $s6,2,quad_9x2color
       bne $s6,2,quad_9x2
jr $ra
linha_s4x9x2:
       beq $s4,2,quad_9x2color
       bne $s4,2,quad_9x2
jr $ra
linha_s7x9x2:
       beq $s7,2,quad_9x2color
       bne $s7,2,quad_9x2
jr $ra


# ==================== linha 3================== 
row_0x3:
    beq $t6,$s5,linha_s5x0x3
    beq $t6,$s6,linha_s6x0x3
    beq $t6,$s4,linha_s4x0x3
    beq $t6,$s7,linha_s7x0x3
        bne $t6,$s5,p_0x3
        p_0x3:bne $t6,$s6,p_0x3x3
        p_0x3x3: bne $t6,$s4,p_0x3x3x3
        p_0x3x3x3: bne $t6,$s7,quad_0x3
jr $ra
linha_s5x0x3:
       beq $s5,3,quad_0x3color
       bne $s5,3,quad_0x3
jr $ra
linha_s6x0x3:
       beq $s6,3,quad_0x3color
       bne $s6,3,quad_0x3
jr $ra
linha_s4x0x3:
       beq $s4,3,quad_0x3color
       bne $s4,3,quad_0x3
jr $ra
linha_s7x0x3:
       beq $s7,3,quad_0x3color
       bne $s7,3,quad_0x3
jr $ra


row_1x3:
    beq $t6,$s5,linha_s5x1x3
    beq $t6,$s6,linha_s6x1x3
    beq $t6,$s4,linha_s4x1x3
    beq $t6,$s7,linha_s7x1x3
        bne $t6,$s5,p_1x3
        p_1x3:bne $t6,$s6,p_1x3x3
        p_1x3x3: bne $t6,$s4,p_1x3x3x3
        p_1x3x3x3: bne $t6,$s7,quad_1x3
jr $ra
linha_s5x1x3:
       beq $s5,3,quad_1x3color
       bne $s5,3,quad_1x3
jr $ra
linha_s6x1x3:
       beq $s6,3,quad_1x3color
       bne $s6,3,quad_1x3
jr $ra
linha_s4x1x3:
       beq $s4,3,quad_1x3color
       bne $s4,3,quad_1x3
jr $ra
linha_s7x1x3:
       beq $s7,3,quad_1x3color
       bne $s7,3,quad_1x3
jr $ra


row_2x3:
    beq $t6,$s5,linha_s5x2x3
    beq $t6,$s6,linha_s6x2x3
    beq $t6,$s4,linha_s4x2x3
    beq $t6,$s7,linha_s7x2x3
        bne $t6,$s5,p_2x3
        p_2x3:bne $t6,$s6,p_2x3x3
        p_2x3x3: bne $t6,$s4,p_2x3x3x3
        p_2x3x3x3: bne $t6,$s7,quad_2x3
jr $ra
linha_s5x2x3:
       beq $s5,3,quad_2x3color
       bne $s5,3,quad_2x3
jr $ra
linha_s6x2x3:
       beq $s6,3,quad_2x3color
       bne $s6,3,quad_2x3
jr $ra
linha_s4x2x3:
       beq $s4,3,quad_2x3color
       bne $s4,3,quad_2x3
jr $ra
linha_s7x2x3:
       beq $s7,3,quad_2x3color
       bne $s7,3,quad_2x3
jr $ra


row_3x3:
    beq $t6,$s5,linha_s5x3x3
    beq $t6,$s6,linha_s6x3x3
    beq $t6,$s4,linha_s4x3x3
    beq $t6,$s7,linha_s7x3x3
        bne $t6,$s5,p_3x3
        p_3x3:bne $t6,$s6,p_3x3x3
        p_3x3x3: bne $t6,$s4,p_3x3x3x3
        p_3x3x3x3: bne $t6,$s7,quad_3x3
jr $ra
linha_s5x3x3:
       beq $s5,3,quad_3x3color
       bne $s5,3,quad_3x3
jr $ra
linha_s6x3x3:
       beq $s6,3,quad_3x3color
       bne $s6,3,quad_3x3
jr $ra
linha_s4x3x3:
       beq $s4,3,quad_3x3color
       bne $s4,3,quad_3x3
jr $ra
linha_s7x3x3:
       beq $s7,3,quad_3x3color
       bne $s7,3,quad_3x3
jr $ra


row_4x3:
    beq $t6,$s5,linha_s5x4x3
    beq $t6,$s6,linha_s6x4x3
    beq $t6,$s4,linha_s4x4x3
    beq $t6,$s7,linha_s7x4x3
        bne $t6,$s5,p_4x3
        p_4x3:bne $t6,$s6,p_4x3x3
        p_4x3x3: bne $t6,$s4,p_4x3x3x3
        p_4x3x3x3: bne $t6,$s7,quad_4x3
jr $ra
linha_s5x4x3:
       beq $s5,3,quad_4x3color
       bne $s5,3,quad_4x3
jr $ra
linha_s6x4x3:
       beq $s6,3,quad_4x3color
       bne $s6,3,quad_4x3
jr $ra
linha_s4x4x3:
       beq $s4,3,quad_4x3color
       bne $s4,3,quad_4x3
jr $ra
linha_s7x4x3:
       beq $s7,3,quad_4x3color
       bne $s7,3,quad_4x3
jr $ra


row_5x3:
    beq $t6,$s5,linha_s5x5x3
    beq $t6,$s6,linha_s6x5x3
    beq $t6,$s4,linha_s4x5x3
    beq $t6,$s7,linha_s7x5x3
        bne $t6,$s5,p_5x3
        p_5x3:bne $t6,$s6,p_5x3x3
        p_5x3x3: bne $t6,$s4,p_5x3x3x3
        p_5x3x3x3: bne $t6,$s7,quad_5x3
jr $ra
linha_s5x5x3:
       beq $s5,3,quad_5x3color
       bne $s5,3,quad_5x3
jr $ra
linha_s6x5x3:
       beq $s6,3,quad_5x3color
       bne $s6,3,quad_5x3
jr $ra
linha_s4x5x3:
       beq $s4,3,quad_5x3color
       bne $s4,3,quad_5x3
jr $ra
linha_s7x5x3:
       beq $s7,3,quad_5x3color
       bne $s7,3,quad_5x3
jr $ra


row_6x3:
    beq $t6,$s5,linha_s5x6x3
    beq $t6,$s6,linha_s6x6x3
    beq $t6,$s4,linha_s4x6x3
    beq $t6,$s7,linha_s7x6x3
        bne $t6,$s5,p_6x3
        p_6x3:bne $t6,$s6,p_6x3x3
        p_6x3x3: bne $t6,$s4,p_6x3x3x3
        p_6x3x3x3: bne $t6,$s7,quad_6x3
jr $ra
linha_s5x6x3:
       beq $s5,3,quad_6x3color
       bne $s5,3,quad_6x3
jr $ra
linha_s6x6x3:
       beq $s6,3,quad_6x3color
       bne $s6,3,quad_6x3
jr $ra
linha_s4x6x3:
       beq $s4,3,quad_6x3color
       bne $s4,3,quad_6x3
jr $ra
linha_s7x6x3:
       beq $s7,3,quad_6x3color
       bne $s7,3,quad_6x3
jr $ra


row_7x3:
    beq $t6,$s5,linha_s5x7x3
    beq $t6,$s6,linha_s6x7x3
    beq $t6,$s4,linha_s4x7x3
    beq $t6,$s7,linha_s7x7x3
        bne $t6,$s5,p_7x3
        p_7x3:bne $t6,$s6,p_7x3x3
        p_7x3x3: bne $t6,$s4,p_7x3x3x3
        p_7x3x3x3: bne $t6,$s7,quad_7x3
jr $ra
linha_s5x7x3:
       beq $s5,3,quad_7x3color
       bne $s5,3,quad_7x3
jr $ra
linha_s6x7x3:
       beq $s6,3,quad_7x3color
       bne $s6,3,quad_7x3
jr $ra
linha_s4x7x3:
       beq $s4,3,quad_7x3color
       bne $s4,3,quad_7x3
jr $ra
linha_s7x7x3:
       beq $s7,3,quad_7x3color
       bne $s7,3,quad_7x3
jr $ra


row_8x3:
    beq $t6,$s5,linha_s5x8x3
    beq $t6,$s6,linha_s6x8x3
    beq $t6,$s4,linha_s4x8x3
    beq $t6,$s7,linha_s7x8x3
        bne $t6,$s5,p_8x3
        p_8x3:bne $t6,$s6,p_8x3x3
        p_8x3x3: bne $t6,$s4,p_8x3x3x3
        p_8x3x3x3: bne $t6,$s7,quad_8x3
jr $ra
linha_s5x8x3:
       beq $s5,3,quad_8x3color
       bne $s5,3,quad_8x3
jr $ra
linha_s6x8x3:
       beq $s6,3,quad_8x3color
       bne $s6,3,quad_8x3
jr $ra
linha_s4x8x3:
       beq $s4,3,quad_8x3color
       bne $s4,3,quad_8x3
jr $ra
linha_s7x8x3:
       beq $s7,3,quad_8x3color
       bne $s7,3,quad_8x3
jr $ra


row_9x3:
    beq $t6,$s5,linha_s5x9x3
    beq $t6,$s6,linha_s6x9x3
    beq $t6,$s4,linha_s4x9x3
    beq $t6,$s7,linha_s7x9x3
        bne $t6,$s5,p_9x3
        p_9x3:bne $t6,$s6,p_9x3x3
        p_9x3x3: bne $t6,$s4,p_9x3x3x3
        p_9x3x3x3: bne $t6,$s7,quad_9x3
jr $ra
linha_s5x9x3:
       beq $s5,3,quad_9x3color
       bne $s5,3,quad_9x3
jr $ra
linha_s6x9x3:
       beq $s6,3,quad_9x3color
       bne $s6,3,quad_9x3
jr $ra
linha_s4x9x3:
       beq $s4,3,quad_9x3color
       bne $s4,3,quad_9x3
jr $ra
linha_s7x9x3:
       beq $s7,3,quad_9x3color
       bne $s7,3,quad_9x3
jr $ra


# ==================== linha 4================== 
row_0x4:
    beq $t6,$s5,linha_s5x0x4
    beq $t6,$s6,linha_s6x0x4
    beq $t6,$s4,linha_s4x0x4
    beq $t6,$s7,linha_s7x0x4
        bne $t6,$s5,p_0x4
        p_0x4:bne $t6,$s6,p_0x4x4
        p_0x4x4: bne $t6,$s4,p_0x4x4x4
        p_0x4x4x4: bne $t6,$s7,quad_0x4
jr $ra
linha_s5x0x4:
       beq $s5,4,quad_0x4color
       bne $s5,4,quad_0x4
jr $ra
linha_s6x0x4:
       beq $s6,4,quad_0x4color
       bne $s6,4,quad_0x4
jr $ra
linha_s4x0x4:
       beq $s4,4,quad_0x4color
       bne $s4,4,quad_0x4
jr $ra
linha_s7x0x4:
       beq $s7,4,quad_0x4color
       bne $s7,4,quad_0x4
jr $ra


row_1x4:
    beq $t6,$s5,linha_s5x1x4
    beq $t6,$s6,linha_s6x1x4
    beq $t6,$s4,linha_s4x1x4
    beq $t6,$s7,linha_s7x1x4
        bne $t6,$s5,p_1x4
        p_1x4:bne $t6,$s6,p_1x4x4
        p_1x4x4: bne $t6,$s4,p_1x4x4x4
        p_1x4x4x4: bne $t6,$s7,quad_1x4
jr $ra
linha_s5x1x4:
       beq $s5,4,quad_1x4color
       bne $s5,4,quad_1x4
jr $ra
linha_s6x1x4:
       beq $s6,4,quad_1x4color
       bne $s6,4,quad_1x4
jr $ra
linha_s4x1x4:
       beq $s4,4,quad_1x4color
       bne $s4,4,quad_1x4
jr $ra
linha_s7x1x4:
       beq $s7,4,quad_1x4color
       bne $s7,4,quad_1x4
jr $ra


row_2x4:
    beq $t6,$s5,linha_s5x2x4
    beq $t6,$s6,linha_s6x2x4
    beq $t6,$s4,linha_s4x2x4
    beq $t6,$s7,linha_s7x2x4
        bne $t6,$s5,p_2x4
        p_2x4:bne $t6,$s6,p_2x4x4
        p_2x4x4: bne $t6,$s4,p_2x4x4x4
        p_2x4x4x4: bne $t6,$s7,quad_2x4
jr $ra
linha_s5x2x4:
       beq $s5,4,quad_2x4color
       bne $s5,4,quad_2x4
jr $ra
linha_s6x2x4:
       beq $s6,4,quad_2x4color
       bne $s6,4,quad_2x4
jr $ra
linha_s4x2x4:
       beq $s4,4,quad_2x4color
       bne $s4,4,quad_2x4
jr $ra
linha_s7x2x4:
       beq $s7,4,quad_2x4color
       bne $s7,4,quad_2x4
jr $ra


row_3x4:
    beq $t6,$s5,linha_s5x3x4
    beq $t6,$s6,linha_s6x3x4
    beq $t6,$s4,linha_s4x3x4
    beq $t6,$s7,linha_s7x3x4
        bne $t6,$s5,p_3x4
        p_3x4:bne $t6,$s6,p_3x4x4
        p_3x4x4: bne $t6,$s4,p_3x4x4x4
        p_3x4x4x4: bne $t6,$s7,quad_3x4
jr $ra
linha_s5x3x4:
       beq $s5,4,quad_3x4color
       bne $s5,4,quad_3x4
jr $ra
linha_s6x3x4:
       beq $s6,4,quad_3x4color
       bne $s6,4,quad_3x4
jr $ra
linha_s4x3x4:
       beq $s4,4,quad_3x4color
       bne $s4,4,quad_3x4
jr $ra
linha_s7x3x4:
       beq $s7,4,quad_3x4color
       bne $s7,4,quad_3x4
jr $ra


row_4x4:
    beq $t6,$s5,linha_s5x4x4
    beq $t6,$s6,linha_s6x4x4
    beq $t6,$s4,linha_s4x4x4
    beq $t6,$s7,linha_s7x4x4
        bne $t6,$s5,p_4x4
        p_4x4:bne $t6,$s6,p_4x4x4
        p_4x4x4: bne $t6,$s4,p_4x4x4x4
        p_4x4x4x4: bne $t6,$s7,quad_4x4
jr $ra
linha_s5x4x4:
       beq $s5,4,quad_4x4color
       bne $s5,4,quad_4x4
jr $ra
linha_s6x4x4:
       beq $s6,4,quad_4x4color
       bne $s6,4,quad_4x4
jr $ra
linha_s4x4x4:
       beq $s4,4,quad_4x4color
       bne $s4,4,quad_4x4
jr $ra
linha_s7x4x4:
       beq $s7,4,quad_4x4color
       bne $s7,4,quad_4x4
jr $ra


row_5x4:
    beq $t6,$s5,linha_s5x5x4
    beq $t6,$s6,linha_s6x5x4
    beq $t6,$s4,linha_s4x5x4
    beq $t6,$s7,linha_s7x5x4
        bne $t6,$s5,p_5x4
        p_5x4:bne $t6,$s6,p_5x4x4
        p_5x4x4: bne $t6,$s4,p_5x4x4x4
        p_5x4x4x4: bne $t6,$s7,quad_5x4
jr $ra
linha_s5x5x4:
       beq $s5,4,quad_5x4color
       bne $s5,4,quad_5x4
jr $ra
linha_s6x5x4:
       beq $s6,4,quad_5x4color
       bne $s6,4,quad_5x4
jr $ra
linha_s4x5x4:
       beq $s4,4,quad_5x4color
       bne $s4,4,quad_5x4
jr $ra
linha_s7x5x4:
       beq $s7,4,quad_5x4color
       bne $s7,4,quad_5x4
jr $ra


row_6x4:
    beq $t6,$s5,linha_s5x6x4
    beq $t6,$s6,linha_s6x6x4
    beq $t6,$s4,linha_s4x6x4
    beq $t6,$s7,linha_s7x6x4
        bne $t6,$s5,p_6x4
        p_6x4:bne $t6,$s6,p_6x4x4
        p_6x4x4: bne $t6,$s4,p_6x4x4x4
        p_6x4x4x4: bne $t6,$s7,quad_6x4
jr $ra
linha_s5x6x4:
       beq $s5,4,quad_6x4color
       bne $s5,4,quad_6x4
jr $ra
linha_s6x6x4:
       beq $s6,4,quad_6x4color
       bne $s6,4,quad_6x4
jr $ra
linha_s4x6x4:
       beq $s4,4,quad_6x4color
       bne $s4,4,quad_6x4
jr $ra
linha_s7x6x4:
       beq $s7,4,quad_6x4color
       bne $s7,4,quad_6x4
jr $ra


row_7x4:
    beq $t6,$s5,linha_s5x7x4
    beq $t6,$s6,linha_s6x7x4
    beq $t6,$s4,linha_s4x7x4
    beq $t6,$s7,linha_s7x7x4
        bne $t6,$s5,p_7x4
        p_7x4:bne $t6,$s6,p_7x4x4
        p_7x4x4: bne $t6,$s4,p_7x4x4x4
        p_7x4x4x4: bne $t6,$s7,quad_7x4
jr $ra
linha_s5x7x4:
       beq $s5,4,quad_7x4color
       bne $s5,4,quad_7x4
jr $ra
linha_s6x7x4:
       beq $s6,4,quad_7x4color
       bne $s6,4,quad_7x4
jr $ra
linha_s4x7x4:
       beq $s4,4,quad_7x4color
       bne $s4,4,quad_7x4
jr $ra
linha_s7x7x4:
       beq $s7,4,quad_7x4color
       bne $s7,4,quad_7x4
jr $ra


row_8x4:
    beq $t6,$s5,linha_s5x8x4
    beq $t6,$s6,linha_s6x8x4
    beq $t6,$s4,linha_s4x8x4
    beq $t6,$s7,linha_s7x8x4
        bne $t6,$s5,p_8x4
        p_8x4:bne $t6,$s6,p_8x4x4
        p_8x4x4: bne $t6,$s4,p_8x4x4x4
        p_8x4x4x4: bne $t6,$s7,quad_8x4
jr $ra
linha_s5x8x4:
       beq $s5,4,quad_8x4color
       bne $s5,4,quad_8x4
jr $ra
linha_s6x8x4:
       beq $s6,4,quad_8x4color
       bne $s6,4,quad_8x4
jr $ra
linha_s4x8x4:
       beq $s4,4,quad_8x4color
       bne $s4,4,quad_8x4
jr $ra
linha_s7x8x4:
       beq $s7,4,quad_8x4color
       bne $s7,4,quad_8x4
jr $ra


row_9x4:
    beq $t6,$s5,linha_s5x9x4
    beq $t6,$s6,linha_s6x9x4
    beq $t6,$s4,linha_s4x9x4
    beq $t6,$s7,linha_s7x9x4
        bne $t6,$s5,p_9x4
        p_9x4:bne $t6,$s6,p_9x4x4
        p_9x4x4: bne $t6,$s4,p_9x4x4x4
        p_9x4x4x4: bne $t6,$s7,quad_9x4
jr $ra
linha_s5x9x4:
       beq $s5,4,quad_9x4color
       bne $s5,4,quad_9x4
jr $ra
linha_s6x9x4:
       beq $s6,4,quad_9x4color
       bne $s6,4,quad_9x4
jr $ra
linha_s4x9x4:
       beq $s4,4,quad_9x4color
       bne $s4,4,quad_9x4
jr $ra
linha_s7x9x4:
       beq $s7,4,quad_9x4color
       bne $s7,4,quad_9x4
jr $ra


# ==================== linha 5================== 
row_0x5:
    beq $t6,$s5,linha_s5x0x5
    beq $t6,$s6,linha_s6x0x5
    beq $t6,$s4,linha_s4x0x5
    beq $t6,$s7,linha_s7x0x5
        bne $t6,$s5,p_0x5
        p_0x5:bne $t6,$s6,p_0x5x5
        p_0x5x5: bne $t6,$s4,p_0x5x5x5
        p_0x5x5x5: bne $t6,$s7,quad_0x5
jr $ra
linha_s5x0x5:
       beq $s5,5,quad_0x5color
       bne $s5,5,quad_0x5
jr $ra
linha_s6x0x5:
       beq $s6,5,quad_0x5color
       bne $s6,5,quad_0x5
jr $ra
linha_s4x0x5:
       beq $s4,5,quad_0x5color
       bne $s4,5,quad_0x5
jr $ra
linha_s7x0x5:
       beq $s7,5,quad_0x5color
       bne $s7,5,quad_0x5
jr $ra


row_1x5:
    beq $t6,$s5,linha_s5x1x5
    beq $t6,$s6,linha_s6x1x5
    beq $t6,$s4,linha_s4x1x5
    beq $t6,$s7,linha_s7x1x5
        bne $t6,$s5,p_1x5
        p_1x5:bne $t6,$s6,p_1x5x5
        p_1x5x5: bne $t6,$s4,p_1x5x5x5
        p_1x5x5x5: bne $t6,$s7,quad_1x5
jr $ra
linha_s5x1x5:
       beq $s5,5,quad_1x5color
       bne $s5,5,quad_1x5
jr $ra
linha_s6x1x5:
       beq $s6,5,quad_1x5color
       bne $s6,5,quad_1x5
jr $ra
linha_s4x1x5:
       beq $s4,5,quad_1x5color
       bne $s4,5,quad_1x5
jr $ra
linha_s7x1x5:
       beq $s7,5,quad_1x5color
       bne $s7,5,quad_1x5
jr $ra


row_2x5:
    beq $t6,$s5,linha_s5x2x5
    beq $t6,$s6,linha_s6x2x5
    beq $t6,$s4,linha_s4x2x5
    beq $t6,$s7,linha_s7x2x5
        bne $t6,$s5,p_2x5
        p_2x5:bne $t6,$s6,p_2x5x5
        p_2x5x5: bne $t6,$s4,p_2x5x5x5
        p_2x5x5x5: bne $t6,$s7,quad_2x5
jr $ra
linha_s5x2x5:
       beq $s5,5,quad_2x5color
       bne $s5,5,quad_2x5
jr $ra
linha_s6x2x5:
       beq $s6,5,quad_2x5color
       bne $s6,5,quad_2x5
jr $ra
linha_s4x2x5:
       beq $s4,5,quad_2x5color
       bne $s4,5,quad_2x5
jr $ra
linha_s7x2x5:
       beq $s7,5,quad_2x5color
       bne $s7,5,quad_2x5
jr $ra


row_3x5:
    beq $t6,$s5,linha_s5x3x5
    beq $t6,$s6,linha_s6x3x5
    beq $t6,$s4,linha_s4x3x5
    beq $t6,$s7,linha_s7x3x5
        bne $t6,$s5,p_3x5
        p_3x5:bne $t6,$s6,p_3x5x5
        p_3x5x5: bne $t6,$s4,p_3x5x5x5
        p_3x5x5x5: bne $t6,$s7,quad_3x5
jr $ra
linha_s5x3x5:
       beq $s5,5,quad_3x5color
       bne $s5,5,quad_3x5
jr $ra
linha_s6x3x5:
       beq $s6,5,quad_3x5color
       bne $s6,5,quad_3x5
jr $ra
linha_s4x3x5:
       beq $s4,5,quad_3x5color
       bne $s4,5,quad_3x5
jr $ra
linha_s7x3x5:
       beq $s7,5,quad_3x5color
       bne $s7,5,quad_3x5
jr $ra


row_4x5:
    beq $t6,$s5,linha_s5x4x5
    beq $t6,$s6,linha_s6x4x5
    beq $t6,$s4,linha_s4x4x5
    beq $t6,$s7,linha_s7x4x5
        bne $t6,$s5,p_4x5
        p_4x5:bne $t6,$s6,p_4x5x5
        p_4x5x5: bne $t6,$s4,p_4x5x5x5
        p_4x5x5x5: bne $t6,$s7,quad_4x5
jr $ra
linha_s5x4x5:
       beq $s5,5,quad_4x5color
       bne $s5,5,quad_4x5
jr $ra
linha_s6x4x5:
       beq $s6,5,quad_4x5color
       bne $s6,5,quad_4x5
jr $ra
linha_s4x4x5:
       beq $s4,5,quad_4x5color
       bne $s4,5,quad_4x5
jr $ra
linha_s7x4x5:
       beq $s7,5,quad_4x5color
       bne $s7,5,quad_4x5
jr $ra


row_5x5:
    beq $t6,$s5,linha_s5x5x5
    beq $t6,$s6,linha_s6x5x5
    beq $t6,$s4,linha_s4x5x5
    beq $t6,$s7,linha_s7x5x5
        bne $t6,$s5,p_5x5
        p_5x5:bne $t6,$s6,p_5x5x5
        p_5x5x5: bne $t6,$s4,p_5x5x5x5
        p_5x5x5x5: bne $t6,$s7,quad_5x5
jr $ra
linha_s5x5x5:
       beq $s5,5,quad_5x5color
       bne $s5,5,quad_5x5
jr $ra
linha_s6x5x5:
       beq $s6,5,quad_5x5color
       bne $s6,5,quad_5x5
jr $ra
linha_s4x5x5:
       beq $s4,5,quad_5x5color
       bne $s4,5,quad_5x5
jr $ra
linha_s7x5x5:
       beq $s7,5,quad_5x5color
       bne $s7,5,quad_5x5
jr $ra


row_6x5:
    beq $t6,$s5,linha_s5x6x5
    beq $t6,$s6,linha_s6x6x5
    beq $t6,$s4,linha_s4x6x5
    beq $t6,$s7,linha_s7x6x5
        bne $t6,$s5,p_6x5
        p_6x5:bne $t6,$s6,p_6x5x5
        p_6x5x5: bne $t6,$s4,p_6x5x5x5
        p_6x5x5x5: bne $t6,$s7,quad_6x5
jr $ra
linha_s5x6x5:
       beq $s5,5,quad_6x5color
       bne $s5,5,quad_6x5
jr $ra
linha_s6x6x5:
       beq $s6,5,quad_6x5color
       bne $s6,5,quad_6x5
jr $ra
linha_s4x6x5:
       beq $s4,5,quad_6x5color
       bne $s4,5,quad_6x5
jr $ra
linha_s7x6x5:
       beq $s7,5,quad_6x5color
       bne $s7,5,quad_6x5
jr $ra


row_7x5:
    beq $t6,$s5,linha_s5x7x5
    beq $t6,$s6,linha_s6x7x5
    beq $t6,$s4,linha_s4x7x5
    beq $t6,$s7,linha_s7x7x5
        bne $t6,$s5,p_7x5
        p_7x5:bne $t6,$s6,p_7x5x5
        p_7x5x5: bne $t6,$s4,p_7x5x5x5
        p_7x5x5x5: bne $t6,$s7,quad_7x5
jr $ra
linha_s5x7x5:
       beq $s5,5,quad_7x5color
       bne $s5,5,quad_7x5
jr $ra
linha_s6x7x5:
       beq $s6,5,quad_7x5color
       bne $s6,5,quad_7x5
jr $ra
linha_s4x7x5:
       beq $s4,5,quad_7x5color
       bne $s4,5,quad_7x5
jr $ra
linha_s7x7x5:
       beq $s7,5,quad_7x5color
       bne $s7,5,quad_7x5
jr $ra


row_8x5:
    beq $t6,$s5,linha_s5x8x5
    beq $t6,$s6,linha_s6x8x5
    beq $t6,$s4,linha_s4x8x5
    beq $t6,$s7,linha_s7x8x5
        bne $t6,$s5,p_8x5
        p_8x5:bne $t6,$s6,p_8x5x5
        p_8x5x5: bne $t6,$s4,p_8x5x5x5
        p_8x5x5x5: bne $t6,$s7,quad_8x5
jr $ra
linha_s5x8x5:
       beq $s5,5,quad_8x5color
       bne $s5,5,quad_8x5
jr $ra
linha_s6x8x5:
       beq $s6,5,quad_8x5color
       bne $s6,5,quad_8x5
jr $ra
linha_s4x8x5:
       beq $s4,5,quad_8x5color
       bne $s4,5,quad_8x5
jr $ra
linha_s7x8x5:
       beq $s7,5,quad_8x5color
       bne $s7,5,quad_8x5
jr $ra


row_9x5:
    beq $t6,$s5,linha_s5x9x5
    beq $t6,$s6,linha_s6x9x5
    beq $t6,$s4,linha_s4x9x5
    beq $t6,$s7,linha_s7x9x5
        bne $t6,$s5,p_9x5
        p_9x5:bne $t6,$s6,p_9x5x5
        p_9x5x5: bne $t6,$s4,p_9x5x5x5
        p_9x5x5x5: bne $t6,$s7,quad_9x5
jr $ra
linha_s5x9x5:
       beq $s5,5,quad_9x5color
       bne $s5,5,quad_9x5
jr $ra
linha_s6x9x5:
       beq $s6,5,quad_9x5color
       bne $s6,5,quad_9x5
jr $ra
linha_s4x9x5:
       beq $s4,5,quad_9x5color
       bne $s4,5,quad_9x5
jr $ra
linha_s7x9x5:
       beq $s7,5,quad_9x5color
       bne $s7,5,quad_9x5
jr $ra


# ==================== linha 6================== 
row_0x6:
    beq $t6,$s5,linha_s5x0x6
    beq $t6,$s6,linha_s6x0x6
    beq $t6,$s4,linha_s4x0x6
    beq $t6,$s7,linha_s7x0x6
        bne $t6,$s5,p_0x6
        p_0x6:bne $t6,$s6,p_0x6x6
        p_0x6x6: bne $t6,$s4,p_0x6x6x6
        p_0x6x6x6: bne $t6,$s7,quad_0x6
jr $ra
linha_s5x0x6:
       beq $s5,6,quad_0x6color
       bne $s5,6,quad_0x6
jr $ra
linha_s6x0x6:
       beq $s6,6,quad_0x6color
       bne $s6,6,quad_0x6
jr $ra
linha_s4x0x6:
       beq $s4,6,quad_0x6color
       bne $s4,6,quad_0x6
jr $ra
linha_s7x0x6:
       beq $s7,6,quad_0x6color
       bne $s7,6,quad_0x6
jr $ra


row_1x6:
    beq $t6,$s5,linha_s5x1x6
    beq $t6,$s6,linha_s6x1x6
    beq $t6,$s4,linha_s4x1x6
    beq $t6,$s7,linha_s7x1x6
        bne $t6,$s5,p_1x6
        p_1x6:bne $t6,$s6,p_1x6x6
        p_1x6x6: bne $t6,$s4,p_1x6x6x6
        p_1x6x6x6: bne $t6,$s7,quad_1x6
jr $ra
linha_s5x1x6:
       beq $s5,6,quad_1x6color
       bne $s5,6,quad_1x6
jr $ra
linha_s6x1x6:
       beq $s6,6,quad_1x6color
       bne $s6,6,quad_1x6
jr $ra
linha_s4x1x6:
       beq $s4,6,quad_1x6color
       bne $s4,6,quad_1x6
jr $ra
linha_s7x1x6:
       beq $s7,6,quad_1x6color
       bne $s7,6,quad_1x6
jr $ra


row_2x6:
    beq $t6,$s5,linha_s5x2x6
    beq $t6,$s6,linha_s6x2x6
    beq $t6,$s4,linha_s4x2x6
    beq $t6,$s7,linha_s7x2x6
        bne $t6,$s5,p_2x6
        p_2x6:bne $t6,$s6,p_2x6x6
        p_2x6x6: bne $t6,$s4,p_2x6x6x6
        p_2x6x6x6: bne $t6,$s7,quad_2x6
jr $ra
linha_s5x2x6:
       beq $s5,6,quad_2x6color
       bne $s5,6,quad_2x6
jr $ra
linha_s6x2x6:
       beq $s6,6,quad_2x6color
       bne $s6,6,quad_2x6
jr $ra
linha_s4x2x6:
       beq $s4,6,quad_2x6color
       bne $s4,6,quad_2x6
jr $ra
linha_s7x2x6:
       beq $s7,6,quad_2x6color
       bne $s7,6,quad_2x6
jr $ra


row_3x6:
    beq $t6,$s5,linha_s5x3x6
    beq $t6,$s6,linha_s6x3x6
    beq $t6,$s4,linha_s4x3x6
    beq $t6,$s7,linha_s7x3x6
        bne $t6,$s5,p_3x6
        p_3x6:bne $t6,$s6,p_3x6x6
        p_3x6x6: bne $t6,$s4,p_3x6x6x6
        p_3x6x6x6: bne $t6,$s7,quad_3x6
jr $ra
linha_s5x3x6:
       beq $s5,6,quad_3x6color
       bne $s5,6,quad_3x6
jr $ra
linha_s6x3x6:
       beq $s6,6,quad_3x6color
       bne $s6,6,quad_3x6
jr $ra
linha_s4x3x6:
       beq $s4,6,quad_3x6color
       bne $s4,6,quad_3x6
jr $ra
linha_s7x3x6:
       beq $s7,6,quad_3x6color
       bne $s7,6,quad_3x6
jr $ra


row_4x6:
    beq $t6,$s5,linha_s5x4x6
    beq $t6,$s6,linha_s6x4x6
    beq $t6,$s4,linha_s4x4x6
    beq $t6,$s7,linha_s7x4x6
        bne $t6,$s5,p_4x6
        p_4x6:bne $t6,$s6,p_4x6x6
        p_4x6x6: bne $t6,$s4,p_4x6x6x6
        p_4x6x6x6: bne $t6,$s7,quad_4x6
jr $ra
linha_s5x4x6:
       beq $s5,6,quad_4x6color
       bne $s5,6,quad_4x6
jr $ra
linha_s6x4x6:
       beq $s6,6,quad_4x6color
       bne $s6,6,quad_4x6
jr $ra
linha_s4x4x6:
       beq $s4,6,quad_4x6color
       bne $s4,6,quad_4x6
jr $ra
linha_s7x4x6:
       beq $s7,6,quad_4x6color
       bne $s7,6,quad_4x6
jr $ra


row_5x6:
    beq $t6,$s5,linha_s5x5x6
    beq $t6,$s6,linha_s6x5x6
    beq $t6,$s4,linha_s4x5x6
    beq $t6,$s7,linha_s7x5x6
        bne $t6,$s5,p_5x6
        p_5x6:bne $t6,$s6,p_5x6x6
        p_5x6x6: bne $t6,$s4,p_5x6x6x6
        p_5x6x6x6: bne $t6,$s7,quad_5x6
jr $ra
linha_s5x5x6:
       beq $s5,6,quad_5x6color
       bne $s5,6,quad_5x6
jr $ra
linha_s6x5x6:
       beq $s6,6,quad_5x6color
       bne $s6,6,quad_5x6
jr $ra
linha_s4x5x6:
       beq $s4,6,quad_5x6color
       bne $s4,6,quad_5x6
jr $ra
linha_s7x5x6:
       beq $s7,6,quad_5x6color
       bne $s7,6,quad_5x6
jr $ra


row_6x6:
    beq $t6,$s5,linha_s5x6x6
    beq $t6,$s6,linha_s6x6x6
    beq $t6,$s4,linha_s4x6x6
    beq $t6,$s7,linha_s7x6x6
        bne $t6,$s5,p_6x6
        p_6x6:bne $t6,$s6,p_6x6x6
        p_6x6x6: bne $t6,$s4,p_6x6x6x6
        p_6x6x6x6: bne $t6,$s7,quad_6x6
jr $ra
linha_s5x6x6:
       beq $s5,6,quad_6x6color
       bne $s5,6,quad_6x6
jr $ra
linha_s6x6x6:
       beq $s6,6,quad_6x6color
       bne $s6,6,quad_6x6
jr $ra
linha_s4x6x6:
       beq $s4,6,quad_6x6color
       bne $s4,6,quad_6x6
jr $ra
linha_s7x6x6:
       beq $s7,6,quad_6x6color
       bne $s7,6,quad_6x6
jr $ra


row_7x6:
    beq $t6,$s5,linha_s5x7x6
    beq $t6,$s6,linha_s6x7x6
    beq $t6,$s4,linha_s4x7x6
    beq $t6,$s7,linha_s7x7x6
        bne $t6,$s5,p_7x6
        p_7x6:bne $t6,$s6,p_7x6x6
        p_7x6x6: bne $t6,$s4,p_7x6x6x6
        p_7x6x6x6: bne $t6,$s7,quad_7x6
jr $ra
linha_s5x7x6:
       beq $s5,6,quad_7x6color
       bne $s5,6,quad_7x6
jr $ra
linha_s6x7x6:
       beq $s6,6,quad_7x6color
       bne $s6,6,quad_7x6
jr $ra
linha_s4x7x6:
       beq $s4,6,quad_7x6color
       bne $s4,6,quad_7x6
jr $ra
linha_s7x7x6:
       beq $s7,6,quad_7x6color
       bne $s7,6,quad_7x6
jr $ra


row_8x6:
    beq $t6,$s5,linha_s5x8x6
    beq $t6,$s6,linha_s6x8x6
    beq $t6,$s4,linha_s4x8x6
    beq $t6,$s7,linha_s7x8x6
        bne $t6,$s5,p_8x6
        p_8x6:bne $t6,$s6,p_8x6x6
        p_8x6x6: bne $t6,$s4,p_8x6x6x6
        p_8x6x6x6: bne $t6,$s7,quad_8x6
jr $ra
linha_s5x8x6:
       beq $s5,6,quad_8x6color
       bne $s5,6,quad_8x6
jr $ra
linha_s6x8x6:
       beq $s6,6,quad_8x6color
       bne $s6,6,quad_8x6
jr $ra
linha_s4x8x6:
       beq $s4,6,quad_8x6color
       bne $s4,6,quad_8x6
jr $ra
linha_s7x8x6:
       beq $s7,6,quad_8x6color
       bne $s7,6,quad_8x6
jr $ra


row_9x6:
    beq $t6,$s5,linha_s5x9x6
    beq $t6,$s6,linha_s6x9x6
    beq $t6,$s4,linha_s4x9x6
    beq $t6,$s7,linha_s7x9x6
        bne $t6,$s5,p_9x6
        p_9x6:bne $t6,$s6,p_9x6x6
        p_9x6x6: bne $t6,$s4,p_9x6x6x6
        p_9x6x6x6: bne $t6,$s7,quad_9x6
jr $ra
linha_s5x9x6:
       beq $s5,6,quad_9x6color
       bne $s5,6,quad_9x6
jr $ra
linha_s6x9x6:
       beq $s6,6,quad_9x6color
       bne $s6,6,quad_9x6
jr $ra
linha_s4x9x6:
       beq $s4,6,quad_9x6color
       bne $s4,6,quad_9x6
jr $ra
linha_s7x9x6:
       beq $s7,6,quad_9x6color
       bne $s7,6,quad_9x6
jr $ra


# ==================== linha 7================== 
row_0x7:
    beq $t6,$s5,linha_s5x0x7
    beq $t6,$s6,linha_s6x0x7
    beq $t6,$s4,linha_s4x0x7
    beq $t6,$s7,linha_s7x0x7
        bne $t6,$s5,p_0x7
        p_0x7:bne $t6,$s6,p_0x7x7
        p_0x7x7: bne $t6,$s4,p_0x7x7x7
        p_0x7x7x7: bne $t6,$s7,quad_0x7
jr $ra
linha_s5x0x7:
       beq $s5,7,quad_0x7color
       bne $s5,7,quad_0x7
jr $ra
linha_s6x0x7:
       beq $s6,7,quad_0x7color
       bne $s6,7,quad_0x7
jr $ra
linha_s4x0x7:
       beq $s4,7,quad_0x7color
       bne $s4,7,quad_0x7
jr $ra
linha_s7x0x7:
       beq $s7,7,quad_0x7color
       bne $s7,7,quad_0x7
jr $ra


row_1x7:
    beq $t6,$s5,linha_s5x1x7
    beq $t6,$s6,linha_s6x1x7
    beq $t6,$s4,linha_s4x1x7
    beq $t6,$s7,linha_s7x1x7
        bne $t6,$s5,p_1x7
        p_1x7:bne $t6,$s6,p_1x7x7
        p_1x7x7: bne $t6,$s4,p_1x7x7x7
        p_1x7x7x7: bne $t6,$s7,quad_1x7
jr $ra
linha_s5x1x7:
       beq $s5,7,quad_1x7color
       bne $s5,7,quad_1x7
jr $ra
linha_s6x1x7:
       beq $s6,7,quad_1x7color
       bne $s6,7,quad_1x7
jr $ra
linha_s4x1x7:
       beq $s4,7,quad_1x7color
       bne $s4,7,quad_1x7
jr $ra
linha_s7x1x7:
       beq $s7,7,quad_1x7color
       bne $s7,7,quad_1x7
jr $ra


row_2x7:
    beq $t6,$s5,linha_s5x2x7
    beq $t6,$s6,linha_s6x2x7
    beq $t6,$s4,linha_s4x2x7
    beq $t6,$s7,linha_s7x2x7
        bne $t6,$s5,p_2x7
        p_2x7:bne $t6,$s6,p_2x7x7
        p_2x7x7: bne $t6,$s4,p_2x7x7x7
        p_2x7x7x7: bne $t6,$s7,quad_2x7
jr $ra
linha_s5x2x7:
       beq $s5,7,quad_2x7color
       bne $s5,7,quad_2x7
jr $ra
linha_s6x2x7:
       beq $s6,7,quad_2x7color
       bne $s6,7,quad_2x7
jr $ra
linha_s4x2x7:
       beq $s4,7,quad_2x7color
       bne $s4,7,quad_2x7
jr $ra
linha_s7x2x7:
       beq $s7,7,quad_2x7color
       bne $s7,7,quad_2x7
jr $ra


row_3x7:
    beq $t6,$s5,linha_s5x3x7
    beq $t6,$s6,linha_s6x3x7
    beq $t6,$s4,linha_s4x3x7
    beq $t6,$s7,linha_s7x3x7
        bne $t6,$s5,p_3x7
        p_3x7:bne $t6,$s6,p_3x7x7
        p_3x7x7: bne $t6,$s4,p_3x7x7x7
        p_3x7x7x7: bne $t6,$s7,quad_3x7
jr $ra
linha_s5x3x7:
       beq $s5,7,quad_3x7color
       bne $s5,7,quad_3x7
jr $ra
linha_s6x3x7:
       beq $s6,7,quad_3x7color
       bne $s6,7,quad_3x7
jr $ra
linha_s4x3x7:
       beq $s4,7,quad_3x7color
       bne $s4,7,quad_3x7
jr $ra
linha_s7x3x7:
       beq $s7,7,quad_3x7color
       bne $s7,7,quad_3x7
jr $ra


row_4x7:
    beq $t6,$s5,linha_s5x4x7
    beq $t6,$s6,linha_s6x4x7
    beq $t6,$s4,linha_s4x4x7
    beq $t6,$s7,linha_s7x4x7
        bne $t6,$s5,p_4x7
        p_4x7:bne $t6,$s6,p_4x7x7
        p_4x7x7: bne $t6,$s4,p_4x7x7x7
        p_4x7x7x7: bne $t6,$s7,quad_4x7
jr $ra
linha_s5x4x7:
       beq $s5,7,quad_4x7color
       bne $s5,7,quad_4x7
jr $ra
linha_s6x4x7:
       beq $s6,7,quad_4x7color
       bne $s6,7,quad_4x7
jr $ra
linha_s4x4x7:
       beq $s4,7,quad_4x7color
       bne $s4,7,quad_4x7
jr $ra
linha_s7x4x7:
       beq $s7,7,quad_4x7color
       bne $s7,7,quad_4x7
jr $ra


row_5x7:
    beq $t6,$s5,linha_s5x5x7
    beq $t6,$s6,linha_s6x5x7
    beq $t6,$s4,linha_s4x5x7
    beq $t6,$s7,linha_s7x5x7
        bne $t6,$s5,p_5x7
        p_5x7:bne $t6,$s6,p_5x7x7
        p_5x7x7: bne $t6,$s4,p_5x7x7x7
        p_5x7x7x7: bne $t6,$s7,quad_5x7
jr $ra
linha_s5x5x7:
       beq $s5,7,quad_5x7color
       bne $s5,7,quad_5x7
jr $ra
linha_s6x5x7:
       beq $s6,7,quad_5x7color
       bne $s6,7,quad_5x7
jr $ra
linha_s4x5x7:
       beq $s4,7,quad_5x7color
       bne $s4,7,quad_5x7
jr $ra
linha_s7x5x7:
       beq $s7,7,quad_5x7color
       bne $s7,7,quad_5x7
jr $ra


row_6x7:
    beq $t6,$s5,linha_s5x6x7
    beq $t6,$s6,linha_s6x6x7
    beq $t6,$s4,linha_s4x6x7
    beq $t6,$s7,linha_s7x6x7
        bne $t6,$s5,p_6x7
        p_6x7:bne $t6,$s6,p_6x7x7
        p_6x7x7: bne $t6,$s4,p_6x7x7x7
        p_6x7x7x7: bne $t6,$s7,quad_6x7
jr $ra
linha_s5x6x7:
       beq $s5,7,quad_6x7color
       bne $s5,7,quad_6x7
jr $ra
linha_s6x6x7:
       beq $s6,7,quad_6x7color
       bne $s6,7,quad_6x7
jr $ra
linha_s4x6x7:
       beq $s4,7,quad_6x7color
       bne $s4,7,quad_6x7
jr $ra
linha_s7x6x7:
       beq $s7,7,quad_6x7color
       bne $s7,7,quad_6x7
jr $ra


row_7x7:
    beq $t6,$s5,linha_s5x7x7
    beq $t6,$s6,linha_s6x7x7
    beq $t6,$s4,linha_s4x7x7
    beq $t6,$s7,linha_s7x7x7
        bne $t6,$s5,p_7x7
        p_7x7:bne $t6,$s6,p_7x7x7
        p_7x7x7: bne $t6,$s4,p_7x7x7x7
        p_7x7x7x7: bne $t6,$s7,quad_7x7
jr $ra
linha_s5x7x7:
       beq $s5,7,quad_7x7color
       bne $s5,7,quad_7x7
jr $ra
linha_s6x7x7:
       beq $s6,7,quad_7x7color
       bne $s6,7,quad_7x7
jr $ra
linha_s4x7x7:
       beq $s4,7,quad_7x7color
       bne $s4,7,quad_7x7
jr $ra
linha_s7x7x7:
       beq $s7,7,quad_7x7color
       bne $s7,7,quad_7x7
jr $ra


row_8x7:
    beq $t6,$s5,linha_s5x8x7
    beq $t6,$s6,linha_s6x8x7
    beq $t6,$s4,linha_s4x8x7
    beq $t6,$s7,linha_s7x8x7
        bne $t6,$s5,p_8x7
        p_8x7:bne $t6,$s6,p_8x7x7
        p_8x7x7: bne $t6,$s4,p_8x7x7x7
        p_8x7x7x7: bne $t6,$s7,quad_8x7
jr $ra
linha_s5x8x7:
       beq $s5,7,quad_8x7color
       bne $s5,7,quad_8x7
jr $ra
linha_s6x8x7:
       beq $s6,7,quad_8x7color
       bne $s6,7,quad_8x7
jr $ra
linha_s4x8x7:
       beq $s4,7,quad_8x7color
       bne $s4,7,quad_8x7
jr $ra
linha_s7x8x7:
       beq $s7,7,quad_8x7color
       bne $s7,7,quad_8x7
jr $ra


row_9x7:
    beq $t6,$s5,linha_s5x9x7
    beq $t6,$s6,linha_s6x9x7
    beq $t6,$s4,linha_s4x9x7
    beq $t6,$s7,linha_s7x9x7
        bne $t6,$s5,p_9x7
        p_9x7:bne $t6,$s6,p_9x7x7
        p_9x7x7: bne $t6,$s4,p_9x7x7x7
        p_9x7x7x7: bne $t6,$s7,quad_9x7
jr $ra
linha_s5x9x7:
       beq $s5,7,quad_9x7color
       bne $s5,7,quad_9x7
jr $ra
linha_s6x9x7:
       beq $s6,7,quad_9x7color
       bne $s6,7,quad_9x7
jr $ra
linha_s4x9x7:
       beq $s4,7,quad_9x7color
       bne $s4,7,quad_9x7
jr $ra
linha_s7x9x7:
       beq $s7,7,quad_9x7color
       bne $s7,7,quad_9x7
jr $ra


# ==================== linha 8================== 
row_0x8:
    beq $t6,$s5,linha_s5x0x8
    beq $t6,$s6,linha_s6x0x8
    beq $t6,$s4,linha_s4x0x8
    beq $t6,$s7,linha_s7x0x8
        bne $t6,$s5,p_0x8
        p_0x8:bne $t6,$s6,p_0x8x8
        p_0x8x8: bne $t6,$s4,p_0x8x8x8
        p_0x8x8x8: bne $t6,$s7,quad_0x8
jr $ra
linha_s5x0x8:
       beq $s5,8,quad_0x8color
       bne $s5,8,quad_0x8
jr $ra
linha_s6x0x8:
       beq $s6,8,quad_0x8color
       bne $s6,8,quad_0x8
jr $ra
linha_s4x0x8:
       beq $s4,8,quad_0x8color
       bne $s4,8,quad_0x8
jr $ra
linha_s7x0x8:
       beq $s7,8,quad_0x8color
       bne $s7,8,quad_0x8
jr $ra


row_1x8:
    beq $t6,$s5,linha_s5x1x8
    beq $t6,$s6,linha_s6x1x8
    beq $t6,$s4,linha_s4x1x8
    beq $t6,$s7,linha_s7x1x8
        bne $t6,$s5,p_1x8
        p_1x8:bne $t6,$s6,p_1x8x8
        p_1x8x8: bne $t6,$s4,p_1x8x8x8
        p_1x8x8x8: bne $t6,$s7,quad_1x8
jr $ra
linha_s5x1x8:
       beq $s5,8,quad_1x8color
       bne $s5,8,quad_1x8
jr $ra
linha_s6x1x8:
       beq $s6,8,quad_1x8color
       bne $s6,8,quad_1x8
jr $ra
linha_s4x1x8:
       beq $s4,8,quad_1x8color
       bne $s4,8,quad_1x8
jr $ra
linha_s7x1x8:
       beq $s7,8,quad_1x8color
       bne $s7,8,quad_1x8
jr $ra


row_2x8:
    beq $t6,$s5,linha_s5x2x8
    beq $t6,$s6,linha_s6x2x8
    beq $t6,$s4,linha_s4x2x8
    beq $t6,$s7,linha_s7x2x8
        bne $t6,$s5,p_2x8
        p_2x8:bne $t6,$s6,p_2x8x8
        p_2x8x8: bne $t6,$s4,p_2x8x8x8
        p_2x8x8x8: bne $t6,$s7,quad_2x8
jr $ra
linha_s5x2x8:
       beq $s5,8,quad_2x8color
       bne $s5,8,quad_2x8
jr $ra
linha_s6x2x8:
       beq $s6,8,quad_2x8color
       bne $s6,8,quad_2x8
jr $ra
linha_s4x2x8:
       beq $s4,8,quad_2x8color
       bne $s4,8,quad_2x8
jr $ra
linha_s7x2x8:
       beq $s7,8,quad_2x8color
       bne $s7,8,quad_2x8
jr $ra


row_3x8:
    beq $t6,$s5,linha_s5x3x8
    beq $t6,$s6,linha_s6x3x8
    beq $t6,$s4,linha_s4x3x8
    beq $t6,$s7,linha_s7x3x8
        bne $t6,$s5,p_3x8
        p_3x8:bne $t6,$s6,p_3x8x8
        p_3x8x8: bne $t6,$s4,p_3x8x8x8
        p_3x8x8x8: bne $t6,$s7,quad_3x8
jr $ra
linha_s5x3x8:
       beq $s5,8,quad_3x8color
       bne $s5,8,quad_3x8
jr $ra
linha_s6x3x8:
       beq $s6,8,quad_3x8color
       bne $s6,8,quad_3x8
jr $ra
linha_s4x3x8:
       beq $s4,8,quad_3x8color
       bne $s4,8,quad_3x8
jr $ra
linha_s7x3x8:
       beq $s7,8,quad_3x8color
       bne $s7,8,quad_3x8
jr $ra


row_4x8:
    beq $t6,$s5,linha_s5x4x8
    beq $t6,$s6,linha_s6x4x8
    beq $t6,$s4,linha_s4x4x8
    beq $t6,$s7,linha_s7x4x8
        bne $t6,$s5,p_4x8
        p_4x8:bne $t6,$s6,p_4x8x8
        p_4x8x8: bne $t6,$s4,p_4x8x8x8
        p_4x8x8x8: bne $t6,$s7,quad_4x8
jr $ra
linha_s5x4x8:
       beq $s5,8,quad_4x8color
       bne $s5,8,quad_4x8
jr $ra
linha_s6x4x8:
       beq $s6,8,quad_4x8color
       bne $s6,8,quad_4x8
jr $ra
linha_s4x4x8:
       beq $s4,8,quad_4x8color
       bne $s4,8,quad_4x8
jr $ra
linha_s7x4x8:
       beq $s7,8,quad_4x8color
       bne $s7,8,quad_4x8
jr $ra


row_5x8:
    beq $t6,$s5,linha_s5x5x8
    beq $t6,$s6,linha_s6x5x8
    beq $t6,$s4,linha_s4x5x8
    beq $t6,$s7,linha_s7x5x8
        bne $t6,$s5,p_5x8
        p_5x8:bne $t6,$s6,p_5x8x8
        p_5x8x8: bne $t6,$s4,p_5x8x8x8
        p_5x8x8x8: bne $t6,$s7,quad_5x8
jr $ra
linha_s5x5x8:
       beq $s5,8,quad_5x8color
       bne $s5,8,quad_5x8
jr $ra
linha_s6x5x8:
       beq $s6,8,quad_5x8color
       bne $s6,8,quad_5x8
jr $ra
linha_s4x5x8:
       beq $s4,8,quad_5x8color
       bne $s4,8,quad_5x8
jr $ra
linha_s7x5x8:
       beq $s7,8,quad_5x8color
       bne $s7,8,quad_5x8
jr $ra


row_6x8:
    beq $t6,$s5,linha_s5x6x8
    beq $t6,$s6,linha_s6x6x8
    beq $t6,$s4,linha_s4x6x8
    beq $t6,$s7,linha_s7x6x8
        bne $t6,$s5,p_6x8
        p_6x8:bne $t6,$s6,p_6x8x8
        p_6x8x8: bne $t6,$s4,p_6x8x8x8
        p_6x8x8x8: bne $t6,$s7,quad_6x8
jr $ra
linha_s5x6x8:
       beq $s5,8,quad_6x8color
       bne $s5,8,quad_6x8
jr $ra
linha_s6x6x8:
       beq $s6,8,quad_6x8color
       bne $s6,8,quad_6x8
jr $ra
linha_s4x6x8:
       beq $s4,8,quad_6x8color
       bne $s4,8,quad_6x8
jr $ra
linha_s7x6x8:
       beq $s7,8,quad_6x8color
       bne $s7,8,quad_6x8
jr $ra


row_7x8:
    beq $t6,$s5,linha_s5x7x8
    beq $t6,$s6,linha_s6x7x8
    beq $t6,$s4,linha_s4x7x8
    beq $t6,$s7,linha_s7x7x8
        bne $t6,$s5,p_7x8
        p_7x8:bne $t6,$s6,p_7x8x8
        p_7x8x8: bne $t6,$s4,p_7x8x8x8
        p_7x8x8x8: bne $t6,$s7,quad_7x8
jr $ra
linha_s5x7x8:
       beq $s5,8,quad_7x8color
       bne $s5,8,quad_7x8
jr $ra
linha_s6x7x8:
       beq $s6,8,quad_7x8color
       bne $s6,8,quad_7x8
jr $ra
linha_s4x7x8:
       beq $s4,8,quad_7x8color
       bne $s4,8,quad_7x8
jr $ra
linha_s7x7x8:
       beq $s7,8,quad_7x8color
       bne $s7,8,quad_7x8
jr $ra


row_8x8:
    beq $t6,$s5,linha_s5x8x8
    beq $t6,$s6,linha_s6x8x8
    beq $t6,$s4,linha_s4x8x8
    beq $t6,$s7,linha_s7x8x8
        bne $t6,$s5,p_8x8
        p_8x8:bne $t6,$s6,p_8x8x8
        p_8x8x8: bne $t6,$s4,p_8x8x8x8
        p_8x8x8x8: bne $t6,$s7,quad_8x8
jr $ra
linha_s5x8x8:
       beq $s5,8,quad_8x8color
       bne $s5,8,quad_8x8
jr $ra
linha_s6x8x8:
       beq $s6,8,quad_8x8color
       bne $s6,8,quad_8x8
jr $ra
linha_s4x8x8:
       beq $s4,8,quad_8x8color
       bne $s4,8,quad_8x8
jr $ra
linha_s7x8x8:
       beq $s7,8,quad_8x8color
       bne $s7,8,quad_8x8
jr $ra


row_9x8:
    beq $t6,$s5,linha_s5x9x8
    beq $t6,$s6,linha_s6x9x8
    beq $t6,$s4,linha_s4x9x8
    beq $t6,$s7,linha_s7x9x8
        bne $t6,$s5,p_9x8
        p_9x8:bne $t6,$s6,p_9x8x8
        p_9x8x8: bne $t6,$s4,p_9x8x8x8
        p_9x8x8x8: bne $t6,$s7,quad_9x8
jr $ra
linha_s5x9x8:
       beq $s5,8,quad_9x8color
       bne $s5,8,quad_9x8
jr $ra
linha_s6x9x8:
       beq $s6,8,quad_9x8color
       bne $s6,8,quad_9x8
jr $ra
linha_s4x9x8:
       beq $s4,8,quad_9x8color
       bne $s4,8,quad_9x8
jr $ra
linha_s7x9x8:
       beq $s7,8,quad_9x8color
       bne $s7,8,quad_9x8
jr $ra






	coluna_0:			
		beq $t6,0,row_0x0
		beq $t6,1,row_0x1
		beq $t6,2,row_0x2  
		beq $t6,3,row_0x3 
		beq $t6,4,row_0x4 
		beq $t6,5,row_0x5  
		beq $t6,6,row_0x6 
		beq $t6,7,row_0x7 
		beq $t6,8,row_0x8  				
	jr $ra
	
	coluna_1:
		beq $t6,0,row_1x0  
		beq $t6,1,row_1x1
		beq $t6,2,row_1x2
		beq $t6,3,row_1x3
		beq $t6,4,row_1x4
		beq $t6,5,row_1x5 
		beq $t6,6,row_1x6
		beq $t6,7,row_1x7
		beq $t6,8,row_1x8				
	jr $ra
	
	coluna_2:
		beq $t6,0,row_2x0
		beq $t6,1,row_2x1
		beq $t6,2,row_2x2
		beq $t6,3,row_2x3
		beq $t6,4,row_2x4
		beq $t6,5,row_2x5 
		beq $t6,6,row_2x6
		beq $t6,7,row_2x7
		beq $t6,8,row_2x8							
	jr $ra
	
	coluna_3:
		beq $t6,0,row_3x0
		beq $t6,1,row_3x1
		beq $t6,2,row_3x2
		beq $t6,3,row_3x3
		beq $t6,4,row_3x4
		beq $t6,5,row_3x5 
		beq $t6,6,row_3x6
		beq $t6,7,row_3x7
		beq $t6,8,row_3x8							
	jr $ra
	
	coluna_4:
		beq $t6,0,row_4x0
		beq $t6,1,row_4x1
		beq $t6,2,row_4x2
		beq $t6,3,row_4x3
		beq $t6,4,row_4x4
		beq $t6,5,row_4x5 
		beq $t6,6,row_4x6
		beq $t6,7,row_4x7
		beq $t6,8,row_4x8						
	jr $ra
	
	coluna_5:
		beq $t6,0,row_5x0
		beq $t6,1,row_5x1
		beq $t6,2,row_5x2
		beq $t6,3,row_5x3
		beq $t6,4,row_5x4
		beq $t6,5,row_5x5 
		beq $t6,6,row_5x6
		beq $t6,7,row_5x7
		beq $t6,8,row_5x8					
	jr $ra
	
	coluna_6:
		beq $t6,0,row_6x0
		beq $t6,1,row_6x1
		beq $t6,2,row_6x2
		beq $t6,3,row_6x3
		beq $t6,4,row_6x4
		beq $t6,5,row_6x5 
		beq $t6,6,row_6x6
		beq $t6,7,row_6x7
		beq $t6,8,row_6x8					
	jr $ra
	
	coluna_7:
		beq $t6,0,row_7x0
		beq $t6,1,row_7x1
		beq $t6,2,row_7x2
		beq $t6,3,row_7x3
		beq $t6,4,row_7x4
		beq $t6,5,row_7x5 
		beq $t6,6,row_7x6
		beq $t6,7,row_7x7
		beq $t6,8,row_7x8				
	jr $ra
		
	coluna_8:
		beq $t6,0,row_8x0
		beq $t6,1,row_8x1
		beq $t6,2,row_8x2
		beq $t6,3,row_8x3
		beq $t6,4,row_8x4
		beq $t6,5,row_8x5 
		beq $t6,6,row_8x6
		beq $t6,7,row_8x7
		beq $t6,8,row_8x8					
	jr $ra
		
	coluna_9:
		beq $t6,0,row_9x0
		beq $t6,1,row_9x1
		beq $t6,2,row_9x2
		beq $t6,3,row_9x3
		beq $t6,4,row_9x4
		beq $t6,5,row_9x5 
		beq $t6,6,row_9x6 
		beq $t6,7,row_9x7 
		beq $t6,8,row_9x8 					
	jr $ra
	

	# ==================================================================
	# ============================ culuna 0 ============================
	
	quad_0x0:	
	lw $a2, 132($t2)
		bne $a2, $s2, possivel_jogada_0x0			     
		possivel_jogada_0x0:
			sw $s2, 132($t2)	
			sw $s2, 136($t2)
			sw $s2, 260($t2)
			sw $s2, 264($t2)
			
			beq $a2, $s2, jogada_mesma_coordenada
	jr $ra	
	acertou_0x0:
		lw $a2, 132($t2)
		beq $a2, $s1, poss_jogada_0x0 #Se a posicao estiver em azul, e possivel jogar
			poss_jogada_0x0:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 132($t2)	
				sw $s2, 136($t2)
				sw $s2, 260($t2)
				sw $s2, 264($t2)		
				addi $s2, $zero, 0xff3333 #VERMELHA	
			
			bne $a2,$s1,jogada_mesma_coordenada #Se a cor diferente de azul ou verde nao e possivel jogar na posicao
	jr $ra	
	
	quad_0x1:	
	lw $a2, 516($t2)
		bne $a2, $s2, possivel_jogada_0x1			     
		possivel_jogada_0x1:
			move $fp, $zero	
			sw $s2, 516($t2)
			sw $s2, 520($t2)
			sw $s2, 644($t2)
			sw $s2, 648($t2)	
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_0x1:
		lw $a2, 516($t2)
		bne $a2, $s1, poss_jogada_0x1	
			poss_jogada_0x1:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 516($t2)
				sw $s2, 520($t2)
				sw $s2, 644($t2)
				sw $s2, 648($t2)			
				addi $s2, $zero, 0xff3333 #VERMELHA		
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra	
		
	quad_0x2:
	lw $a2, 900($t2)
		bne $a2, $s2, possivel_jogada_0x2			     
		possivel_jogada_0x2:
			move $fp, $zero
			sw $s2, 900($t2)
			sw $s2, 904($t2)
			sw $s2, 1028($t2)
			sw $s2, 1032($t2)
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_0x2:
		lw $a2, 900($t2)
		bne $a2, $s1, poss_jogada_0x2
			poss_jogada_0x2:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 900($t2)
				sw $s2, 904($t2)
				sw $s2, 1028($t2)
				sw $s2, 1032($t2)			
				addi $s2, $zero, 0xff3333 #VERMELHA				
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra	
	
	quad_0x3:
	lw $a2, 1284($t2)
		bne $a2, $s2, possivel_jogada_0x3			     
		possivel_jogada_0x3:
			move $fp, $zero
			sw $s2, 1284($t2)
			sw $s2, 1288($t2)
			sw $s2, 1412($t2)
			sw $s2, 1416($t2)
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_0x3:
		lw $a2, 1284($t2)	
		bne $a2, $s1, poss_jogada_0x3
			poss_jogada_0x3:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1284($t2)
				sw $s2, 1288($t2)
				sw $s2, 1412($t2)
				sw $s2, 1416($t2)			
				addi $s2, $zero, 0xff3333 #VERMELHA				
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra	

	
	quad_0x4:
	lw $a2, 1668($t2)
		bne $a2, $s2, possivel_jogada_0x4			     
		possivel_jogada_0x4:
			move $fp, $zero
			sw $s2, 1668($t2)
			sw $s2, 1672($t2)
			sw $s2, 1796($t2)
			sw $s2, 1800($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_0x4:
		lw $a2, 1668($t2)
		bne $a2, $s1, poss_jogada_0x4
			poss_jogada_0x4:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1668($t2)
				sw $s2, 1672($t2)
				sw $s2, 1796($t2)
				sw $s2, 1800($t2)			
				addi $s2, $zero, 0xff3333 #VERMELHA
				
		bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_0x5:
	lw $a2, 2052($t2)
		bne $a2, $s2, possivel_jogada_0x5			     
		possivel_jogada_0x5:
			move $fp, $zero
			sw $s2, 2052($t2)
			sw $s2, 2056($t2)
			sw $s2, 2180($t2)
			sw $s2, 2184($t2)
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_0x5:
		lw $a2, 2052($t2)
		bne $a2, $s1, poss_jogada_0x5
			poss_jogada_0x5:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2052($t2)
				sw $s2, 2056($t2)
				sw $s2, 2180($t2)
				sw $s2, 2184($t2)		
				addi $s2, $zero, 0xff3333 #VERMELHA			
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_0x6:
	lw $a2, 2436($t2)
		bne $a2, $s2, possivel_jogada_0x6			     
		possivel_jogada_0x6:
			move $fp, $zero
			sw $s2, 2436($t2)
			sw $s2, 2440($t2)
			sw $s2, 2564($t2)
			sw $s2, 2568($t2)	
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_0x6:
		lw $a2, 2436($t2)
		bne $a2, $s1, poss_jogada_0x6
			poss_jogada_0x6:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2436($t2)
				sw $s2, 2440($t2)
				sw $s2, 2564($t2)
				sw $s2, 2568($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada			
	jr $ra
	
	quad_0x7:
	lw $a2, 2820($t2)
		bne $a2, $s2, possivel_jogada_0x7			     
		possivel_jogada_0x7:
			move $fp, $zero
			sw $s2, 2820($t2)
			sw $s2, 2824($t2)
			sw $s2, 2948($t2)
			sw $s2, 2952($t2)
		beq $a2, $s2, jogada_mesma_coordenada			
	jr $ra
	acertou_0x7:
		lw $a2, 2820($t2)
		bne $a2, $s1, poss_jogada_0x7
			poss_jogada_0x7:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2820($t2)
				sw $s2, 2824($t2)
				sw $s2, 2948($t2)
				sw $s2, 2952($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	quad_0x8:
	lw $a2, 3204($t2)
		bne $a2, $s2, possivel_jogada_0x8			     
		possivel_jogada_0x8:
			move $fp, $zero
			sw $s2, 3204($t2)
			sw $s2, 3208($t2)
			sw $s2, 3332($t2)
			sw $s2, 3336($t2)
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_0x8:
		lw $a2, 3204($t2)
		bne $a2, $s1, poss_jogada_0x8
			poss_jogada_0x8:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 3204($t2)
				sw $s2, 3208($t2)
				sw $s2, 3332($t2)
				sw $s2, 3336($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	



	# ==================================================================
	# ============================ culuna 1 ============================
	quad_1x0:
	lw $a2, 144($t2)
		bne $a2, $s2, possivel_jogada_1x0			     
		possivel_jogada_1x0:	
			sw $s2, 144($t2)
			sw $s2, 148($t2)
			sw $s2, 272($t2)
			sw $s2, 276($t2)
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_1x0:
	lw $a2, 144($t2)
		bne $a2, $s1, poss_jogada_1x0
			poss_jogada_1x0:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 144($t2)
				sw $s2, 148($t2)
				sw $s2, 272($t2)
				sw $s2, 276($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_1x1:
	lw $a2, 528($t2)
		bne $a2, $s2, possivel_jogada_1x1			     
		possivel_jogada_1x1:
			move $fp, $zero		
			sw $s2, 528($t2)
			sw $s2, 532($t2)
			sw $s2, 656($t2)
			sw $s2, 660($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_1x1:
	lw $a2, 528($t2)
		bne $a2, $s1, poss_jogada_1x1
			poss_jogada_1x1:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 528($t2)
				sw $s2, 532($t2)
				sw $s2, 656($t2)
				sw $s2, 660($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra	
	
	quad_1x2:
	lw $a2, 912($t2)
		bne $a2, $s2, possivel_jogada_1x2			     
		possivel_jogada_1x2:
			move $fp, $zero		
			sw $s2, 912($t2)
			sw $s2, 916($t2)
			sw $s2, 1040($t2)
			sw $s2, 1044($t2)
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_1x2:
	lw $a2, 912($t2)
		bne $a2, $s1, poss_jogada_1x2
			poss_jogada_1x2:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 912($t2)
				sw $s2, 916($t2)
				sw $s2, 1040($t2)
				sw $s2, 1044($t2)		
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_1x3:
	lw $a2, 1296($t2)
		bne $a2, $s2, possivel_jogada_1x3			     
		possivel_jogada_1x3:
			move $fp, $zero		
			sw $s2, 1296($t2)
			sw $s2, 1300($t2)
			sw $s2, 1424($t2)
			sw $s2, 1428($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	jr $ra
	acertou_1x3:
	lw $a2, 1296($t2)
		bne $a2, $s1, poss_jogada_1x3
			poss_jogada_1x3:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1296($t2)
				sw $s2, 1300($t2)
				sw $s2, 1424($t2)
				sw $s2, 1428($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra	
	
	quad_1x4:
	lw $a2, 1680($t2)
		bne $a2, $s2, possivel_jogada_1x4			     
		possivel_jogada_1x4:
			move $fp, $zero		
			sw $s2, 1680($t2)
			sw $s2, 1684($t2)
			sw $s2, 1808($t2)
			sw $s2, 1812($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_1x4:
	lw $a2, 1680($t2)
		bne $a2, $s1, poss_jogada_1x4
			poss_jogada_1x4:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1680($t2)
				sw $s2, 1684($t2)
				sw $s2, 1808($t2)
				sw $s2, 1812($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	quad_1x5:
	lw $a2, 2064($t2)
		bne $a2, $s2, possivel_jogada_1x5			     
		possivel_jogada_1x5:
			move $fp, $zero		
			sw $s2, 2064($t2)
			sw $s2, 2068($t2)
			sw $s2, 2192($t2)
			sw $s2, 2196($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_1x5:
	lw $a2, 2064($t2)
		bne $a2, $s1, poss_jogada_1x5
			poss_jogada_1x5:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2064($t2)
				sw $s2, 2068($t2)
				sw $s2, 2192($t2)
				sw $s2, 2196($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	quad_1x6:
	lw $a2, 2448($t2)
		bne $a2, $s2, possivel_jogada_1x6		     
		possivel_jogada_1x6:
			move $fp, $zero		
			sw $s2, 2448($t2)
			sw $s2, 2452($t2)
			sw $s2, 2576($t2)
			sw $s2, 2580($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_1x6:
	lw $a2, 2448($t2)
		bne $a2, $s1, poss_jogada_1x6
			poss_jogada_1x6:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2448($t2)
				sw $s2, 2452($t2)
				sw $s2, 2576($t2)
				sw $s2, 2580($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	quad_1x7:
	lw $a2, 2832($t2)
		bne $a2, $s2, possivel_jogada_1x7		     
		possivel_jogada_1x7:
			move $fp, $zero		
			sw $s2, 2832($t2)
			sw $s2, 2836($t2)
			sw $s2, 2960($t2)
			sw $s2, 2964($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_1x7:
	lw $a2, 2832($t2)
		bne $a2, $s1, poss_jogada_1x7
			poss_jogada_1x7:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2832($t2)
				sw $s2, 2836($t2)
				sw $s2, 2960($t2)
				sw $s2, 2964($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada		
	jr $ra
	
	quad_1x8:
	lw $a2, 3216($t2)
		bne $a2, $s2, possivel_jogada_1x8		     
		possivel_jogada_1x8:
			move $fp, $zero		
			sw $s2, 3216($t2)
			sw $s2, 3220($t2)
			sw $s2, 3344($t2)
			sw $s2, 3348($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_1x8:
	lw $a2, 3216($t2)
		bne $a2, $s1, poss_jogada_1x8
			poss_jogada_1x8:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 3216($t2)
				sw $s2, 3220($t2)
				sw $s2, 3344($t2)
				sw $s2, 3348($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	



	# ==================================================================
	# ============================ culuna 2 ============================
	
	quad_2x0: 
	lw $a2, 156($t2)
		bne $a2, $s2, possivel_jogada_2x0		     
		possivel_jogada_2x0:
			move $fp, $zero		
			sw $s2, 156($t2)
			sw $s2, 160($t2)
			sw $s2, 284($t2)
			sw $s2, 288($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_2x0:
	lw $a2, 156($t2)
		bne $a2, $s1, poss_jogada_2x0
			poss_jogada_2x0:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 156($t2)
				sw $s2, 160($t2)
				sw $s2, 284($t2)
				sw $s2, 288($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_2x1:
	lw $a2, 540($t2)
		bne $a2, $s2, possivel_jogada_2x1		     
		possivel_jogada_2x1:
			move $fp, $zero		
			sw $s2, 540($t2)
			sw $s2, 544($t2)
			sw $s2, 668($t2)
			sw $s2, 672($t2)
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_2x1:
	lw $a2, 540($t2)
		bne $a2, $s1, poss_jogada_2x1
			poss_jogada_2x1:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 540($t2)
				sw $s2, 544($t2)
				sw $s2, 668($t2)
				sw $s2, 672($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra	
	
	quad_2x2:
	lw $a2, 924($t2)
		bne $a2, $s2, possivel_jogada_2x2		     
		possivel_jogada_2x2:
			move $fp, $zero		
			sw $s2, 924($t2)
			sw $s2, 928($t2)
			sw $s2, 1052($t2)
			sw $s2, 1056($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_2x2:
	lw $a2, 924($t2)
		bne $a2, $s1, poss_jogada_2x2
			poss_jogada_2x2:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 924($t2)
				sw $s2, 928($t2)
				sw $s2, 1052($t2)
				sw $s2, 1056($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra	
	
	quad_2x3:
	lw $a2, 1308($t2)
		bne $a2, $s2, possivel_jogada_2x3		     
		possivel_jogada_2x3:
			move $fp, $zero		
			sw $s2, 1308($t2)
			sw $s2, 1312($t2)
			sw $s2, 1436($t2)
			sw $s2, 1440($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_2x3:
	lw $a2, 1308($t2)
		bne $a2, $s1, poss_jogada_2x3
			poss_jogada_2x3:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1308($t2)
				sw $s2, 1312($t2)
				sw $s2, 1436($t2)
				sw $s2, 1440($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra	
		
	quad_2x4:
	lw $a2, 1692($t2)
		bne $a2, $s2, possivel_jogada_2x4		     
		possivel_jogada_2x4:
			move $fp, $zero		
			sw $s2, 1692($t2)
			sw $s2, 1696($t2)
			sw $s2, 1820($t2)
			sw $s2, 1824($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_2x4:
	lw $a2, 1692($t2)
		bne $a2, $s1, poss_jogada_2x4
			poss_jogada_2x4:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1692($t2)
				sw $s2, 1696($t2)
				sw $s2, 1820($t2)
				sw $s2, 1824($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_2x5:
	lw $a2, 2076($t2)
		bne $a2, $s2, possivel_jogada_2x5		     
		possivel_jogada_2x5:
			move $fp, $zero		
			sw $s2, 2076($t2)
			sw $s2, 2080($t2)
			sw $s2, 2204($t2)
			sw $s2, 2208($t2)	
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_2x5:
	lw $a2, 2076($t2)
		bne $a2, $s1, poss_jogada_2x5
			poss_jogada_2x5:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2076($t2)
				sw $s2, 2080($t2)
				sw $s2, 2204($t2)
				sw $s2, 2208($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
		
	quad_2x6:
	lw $a2, 2460($t2)
		bne $a2, $s2, possivel_jogada_2x6		     
		possivel_jogada_2x6:
			move $fp, $zero		
			sw $s2, 2460($t2)
			sw $s2, 2464($t2)
			sw $s2, 2588($t2)
			sw $s2, 2592($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_2x6:
	lw $a2, 2460($t2)
		bne $a2, $s1, poss_jogada_2x6
			poss_jogada_2x6:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2460($t2)
				sw $s2, 2464($t2)
				sw $s2, 2588($t2)
				sw $s2, 2592($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_2x7:
	lw $a2, 2844($t2)
		bne $a2, $s2, possivel_jogada_2x7		     
		possivel_jogada_2x7:
			move $fp, $zero		
			sw $s2, 2844($t2)
			sw $s2, 2848($t2)
			sw $s2, 2972($t2)
			sw $s2, 2976($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_2x7:
	lw $a2, 2844($t2)
		bne $a2, $s1, poss_jogada_2x7
			poss_jogada_2x7:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2844($t2)
				sw $s2, 2848($t2)
				sw $s2, 2972($t2)
				sw $s2, 2976($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_2x8:
	lw $a2, 3228($t2)
		bne $a2, $s2, possivel_jogada_2x8		     
		possivel_jogada_2x8:
			move $fp, $zero		
			sw $s2, 3228($t2)
			sw $s2, 3232($t2)
			sw $s2, 3356($t2)
			sw $s2, 3360($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_2x8:
	lw $a2, 3228($t2)
		bne $a2, $s1, poss_jogada_2x8
			poss_jogada_2x8:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 3228($t2)
				sw $s2, 3232($t2)
				sw $s2, 3356($t2)
				sw $s2, 3360($t2)		
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	


	# ==================================================================
	# ============================ culuna 3 ============================
	
	quad_3x0:
	lw $a2, 168($t2)
		bne $a2, $s2, possivel_jogada_3x0		     
		possivel_jogada_3x0:
			move $fp, $zero		
			sw $s2, 168($t2)
			sw $s2, 172($t2)
			sw $s2, 296($t2)
			sw $s2, 300($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_3x0:
	lw $a2, 168($t2)
		bne $a2, $s1, poss_jogada_3x0
			poss_jogada_3x0:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 168($t2)
				sw $s2, 172($t2)
				sw $s2, 296($t2)
				sw $s2, 300($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA
		    bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_3x1:
	lw $a2, 552($t2)
		bne $a2, $s2, possivel_jogada_3x1		     
		possivel_jogada_3x1:
			move $fp, $zero		
			sw $s2, 552($t2)
			sw $s2, 556($t2)
			sw $s2, 680($t2)
			sw $s2, 684($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_3x1:
	lw $a2, 552($t2)
		bne $a2, $s1, poss_jogada_3x1
			poss_jogada_3x1:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 552($t2)
				sw $s2, 556($t2)
				sw $s2, 680($t2)
				sw $s2, 684($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra	
	
	quad_3x2:
	lw $a2, 936($t2)
		bne $a2, $s2, possivel_jogada_3x2		     
		possivel_jogada_3x2:
			move $fp, $zero		
			sw $s2, 936($t2)
			sw $s2, 940($t2)
			sw $s2, 1064($t2)
			sw $s2, 1068($t2)
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_3x2:
	lw $a2, 936($t2)
		bne $a2, $s1, poss_jogada_3x2
			poss_jogada_3x2:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 936($t2)
				sw $s2, 940($t2)
				sw $s2, 1064($t2)
				sw $s2, 1068($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_3x3:
	lw $a2, 1320($t2)
		bne $a2, $s2, possivel_jogada_3x3		     
		possivel_jogada_3x3:
			move $fp, $zero		
			sw $s2, 1320($t2)
			sw $s2, 1324($t2)
			sw $s2, 1448($t2)
			sw $s2, 1452($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_3x3:
	lw $a2, 1320($t2)
		bne $a2, $s1, poss_jogada_3x3
			poss_jogada_3x3:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1320($t2)
				sw $s2, 1324($t2)
				sw $s2, 1448($t2)
				sw $s2, 1452($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra	
		
	quad_3x4:
	lw $a2, 1704($t2)
		bne $a2, $s2, possivel_jogada_3x4	     
		possivel_jogada_3x4:
			move $fp, $zero		
			sw $s2, 1704($t2)
			sw $s2, 1708($t2)
			sw $s2, 1832($t2)
			sw $s2, 1836($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_3x4:
	lw $a2, 1704($t2)
		bne $a2, $s1, poss_jogada_3x4
			poss_jogada_3x4:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1704($t2)
				sw $s2, 1708($t2)
				sw $s2, 1832($t2)
				sw $s2, 1836($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_3x5:
	lw $a2, 2088($t2)
		bne $a2, $s2, possivel_jogada_3x5     
		possivel_jogada_3x5:
			move $fp, $zero		
			sw $s2, 2088($t2)
			sw $s2, 2092($t2)
			sw $s2, 2216($t2)
			sw $s2, 2220($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_3x5:
	lw $a2, 2088($t2)
		bne $a2, $s1, poss_jogada_3x5
			poss_jogada_3x5:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2088($t2)
				sw $s2, 2092($t2)
				sw $s2, 2216($t2)
				sw $s2, 2220($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
		
	quad_3x6:
	lw $a2, 2472($t2)
		bne $a2, $s2, possivel_jogada_3x6    
		possivel_jogada_3x6:
			move $fp, $zero		
			sw $s2, 2472($t2)
			sw $s2, 2476($t2)
			sw $s2, 2600($t2)
			sw $s2, 2604($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_3x6:
	lw $a2, 2472($t2)
		bne $a2, $s1, poss_jogada_3x6
			poss_jogada_3x6:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2472($t2)
				sw $s2, 2476($t2)
				sw $s2, 2600($t2)
				sw $s2, 2604($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_3x7:
	lw $a2, 2856($t2)
		bne $a2, $s2, possivel_jogada_3x7 
		possivel_jogada_3x7:
			move $fp, $zero		
			sw $s2, 2856($t2)
			sw $s2, 2860($t2)
			sw $s2, 2984($t2)
			sw $s2, 2988($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_3x7:
	lw $a2, 2856($t2)
		bne $a2, $s1, poss_jogada_3x7
			poss_jogada_3x7:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2856($t2)
				sw $s2, 2860($t2)
				sw $s2, 2984($t2)
				sw $s2, 2988($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
		bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_3x8:
	lw $a2, 3240($t2)
		bne $a2, $s2, possivel_jogada_3x8
		possivel_jogada_3x8:
			move $fp, $zero		
			sw $s2, 3240($t2)
			sw $s2, 3244($t2)
			sw $s2, 3368($t2)
			sw $s2, 3372($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_3x8:
	lw $a2, 3240($t2)
		bne $a2, $s1, poss_jogada_3x8
			poss_jogada_3x8:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 3240($t2)
				sw $s2, 3244($t2)
				sw $s2, 3368($t2)
				sw $s2, 3372($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	# ==================================================================
	# ============================ culuna 4 ============================
	
	quad_4x0:
	lw $a2, 180($t2)
		bne $a2, $s2, possivel_jogada_4x0
		possivel_jogada_4x0:
			move $fp, $zero	
			sw $s2, 180($t2)
			sw $s2, 184($t2)
			sw $s2, 308($t2)
			sw $s2, 312($t2)
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_4x0:
	lw $a2, 180($t2)
		bne $a2, $s1, poss_jogada_4x0
			poss_jogada_4x0:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 180($t2)
				sw $s2, 184($t2)
				sw $s2, 308($t2)
				sw $s2, 312($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_4x1:
	lw $a2, 564($t2)
		bne $a2, $s2, possivel_jogada_4x1
		possivel_jogada_4x1:
			move $fp, $zero		
			sw $s2, 564($t2)
			sw $s2, 568($t2)
			sw $s2, 692($t2)
			sw $s2, 696($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_4x1:
	lw $a2, 564($t2)
		bne $a2, $s1, poss_jogada_4x1
			poss_jogada_4x1:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 564($t2)
				sw $s2, 568($t2)
				sw $s2, 692($t2)
				sw $s2, 696($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_4x2:
	lw $a2, 948($t2)
		bne $a2, $s2, possivel_jogada_4x2
		possivel_jogada_4x2:
			move $fp, $zero		
			sw $s2, 948($t2)
			sw $s2, 952($t2)
			sw $s2, 1076($t2)
			sw $s2, 1080($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_4x2:
	lw $a2, 948($t2)
		bne $a2, $s1, poss_jogada_4x2
			poss_jogada_4x2:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 948($t2)
				sw $s2, 952($t2)
				sw $s2, 1076($t2)
				sw $s2, 1080($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_4x3:
	lw $a2, 1332($t2)
		bne $a2, $s2, possivel_jogada_4x3
		possivel_jogada_4x3:
			move $fp, $zero		
			sw $s2, 1332($t2)
			sw $s2, 1336($t2)
			sw $s2, 1460($t2)
			sw $s2, 1464($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_4x3:
	lw $a2, 1332($t2)
		bne $a2, $s1, poss_jogada_4x3
			poss_jogada_4x3:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1332($t2)
				sw $s2, 1336($t2)
				sw $s2, 1460($t2)
				sw $s2, 1464($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
		
	quad_4x4:
	lw $a2, 1716($t2)
		bne $a2, $s2, possivel_jogada_4x4
		possivel_jogada_4x4:
			move $fp, $zero		
			sw $s2, 1716($t2)
			sw $s2, 1720($t2)
			sw $s2, 1844($t2)
			sw $s2, 1848($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_4x4:
	lw $a2, 1716($t2)
		bne $a2, $s1, poss_jogada_4x4
			poss_jogada_4x4:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1716($t2)
				sw $s2, 1720($t2)
				sw $s2, 1844($t2)
				sw $s2, 1848($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	quad_4x5:
	lw $a2, 2100($t2)
		bne $a2, $s2, possivel_jogada_4x5
		possivel_jogada_4x5:
			move $fp, $zero		
			sw $s2, 2100($t2)
			sw $s2, 2104($t2)
			sw $s2, 2228($t2)
			sw $s2, 2232($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_4x5:
	lw $a2, 2100($t2)
		bne $a2, $s1, poss_jogada_4x5
			poss_jogada_4x5:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2100($t2)
				sw $s2, 2104($t2)
				sw $s2, 2228($t2)
				sw $s2, 2232($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
		
	quad_4x6:
	lw $a2, 2484($t2)
		bne $a2, $s2, possivel_jogada_4x6
		possivel_jogada_4x6:
			move $fp, $zero		
			sw $s2, 2484($t2)
			sw $s2, 2488($t2)
			sw $s2, 2612($t2)
			sw $s2, 2616($t2)	
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_4x6:
	lw $a2, 2484($t2)
		bne $a2, $s1, poss_jogada_4x6
			poss_jogada_4x6:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2484($t2)
				sw $s2, 2488($t2)
				sw $s2, 2612($t2)
				sw $s2, 2616($t2)		
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	quad_4x7:
	lw $a2, 2868($t2)
		bne $a2, $s2, possivel_jogada_4x7
		possivel_jogada_4x7:
			move $fp, $zero		
			sw $s2, 2868($t2)
			sw $s2, 2872($t2)
			sw $s2, 2996($t2)
			sw $s2, 3000($t2)
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_4x7:
	lw $a2, 2868($t2)
		bne $a2, $s1, poss_jogada_4x7
			poss_jogada_4x7:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2868($t2)
				sw $s2, 2872($t2)
				sw $s2, 2996($t2)
				sw $s2, 3000($t2)		
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_4x8:
	lw $a2, 3252($t2)
		bne $a2, $s2, possivel_jogada_4x8
		possivel_jogada_4x8:
			move $fp, $zero		
			sw $s2, 3252($t2)
			sw $s2, 3256($t2)
			sw $s2, 3380($t2)
			sw $s2, 3384($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_4x8:
	lw $a2, 3252($t2)
		bne $a2, $s1, poss_jogada_4x8
			poss_jogada_4x8:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 3252($t2)
				sw $s2, 3256($t2)
				sw $s2, 3380($t2)
				sw $s2, 3384($t2)		
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	

	# ==================================================================
	# ============================ culuna 5 ============================
	
	quad_5x0:
	lw $a2, 192($t2)
		bne $a2, $s2, possivel_jogada_5x0
		possivel_jogada_5x0:
			move $fp, $zero		
			sw $s2, 192($t2)
			sw $s2, 196($t2)
			sw $s2, 320($t2)
			sw $s2, 324($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_5x0:
	lw $a2, 192($t2)
		bne $a2, $s1, poss_jogada_5x0
			poss_jogada_5x0:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 192($t2)
				sw $s2, 196($t2)
				sw $s2, 320($t2)
				sw $s2, 324($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_5x1:
	lw $a2, 576($t2)
		bne $a2, $s2, possivel_jogada_5x1
		possivel_jogada_5x1:
			move $fp, $zero		
			sw $s2, 576($t2)
			sw $s2, 580($t2)
			sw $s2, 704($t2)
			sw $s2, 708($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_5x1:
	lw $a2, 576($t2)
		bne $a2, $s1, poss_jogada_5x1
			poss_jogada_5x1:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 576($t2)
				sw $s2, 580($t2)
				sw $s2, 704($t2)
				sw $s2, 708($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_5x2:
	lw $a2, 960($t2)
		bne $a2, $s2, possivel_jogada_5x2
		possivel_jogada_5x2:
			move $fp, $zero		
			sw $s2, 960($t2)
			sw $s2, 964($t2)
			sw $s2, 1088($t2)
			sw $s2, 1092($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_5x2:
	lw $a2, 960($t2)
		bne $a2, $s1, poss_jogada_5x2
			poss_jogada_5x2:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 960($t2)
				sw $s2, 964($t2)
				sw $s2, 1088($t2)
				sw $s2, 1092($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_5x3:
	lw $a2, 1344($t2)
		bne $a2, $s2, possivel_jogada_5x3
		possivel_jogada_5x3:
			move $fp, $zero		
			sw $s2, 1344($t2)
			sw $s2, 1348($t2)
			sw $s2, 1472($t2)
			sw $s2, 1476($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_5x3:
	lw $a2, 1344($t2)
		bne $a2, $s1, poss_jogada_5x3
			poss_jogada_5x3:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1344($t2)
				sw $s2, 1348($t2)
				sw $s2, 1472($t2)
				sw $s2, 1476($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
		
	quad_5x4:
	lw $a2, 1728($t2)
		bne $a2, $s2, possivel_jogada_5x4
		possivel_jogada_5x4:
			move $fp, $zero		
			sw $s2, 1728($t2)
			sw $s2, 1732($t2)
			sw $s2, 1856($t2)
			sw $s2, 1860($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_5x4:
	lw $a2, 1728($t2)
		bne $a2, $s1, poss_jogada_5x4
			poss_jogada_5x4:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1728($t2)
				sw $s2, 1732($t2)
				sw $s2, 1856($t2)
				sw $s2, 1860($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_5x5:
	lw $a2, 2112($t2)
		bne $a2, $s2, possivel_jogada_5x5
		possivel_jogada_5x5:
			move $fp, $zero		
			sw $s2, 2112($t2)
			sw $s2, 2116($t2)
			sw $s2, 2240($t2)
			sw $s2, 2244($t2)	
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_5x5:
	lw $a2, 2112($t2)
		bne $a2, $s1, poss_jogada_5x5
			poss_jogada_5x5:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2112($t2)
				sw $s2, 2116($t2)
				sw $s2, 2240($t2)
				sw $s2, 2244($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
		
	quad_5x6:
	lw $a2, 2496($t2)
		bne $a2, $s2, possivel_jogada_5x6
		possivel_jogada_5x6:
			move $fp, $zero		
			sw $s2, 2496($t2)
			sw $s2, 2500($t2)
			sw $s2, 2624($t2)
			sw $s2, 2628($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_5x6:
	lw $a2, 2496($t2)
		bne $a2, $s1, poss_jogada_5x6
			poss_jogada_5x6:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2496($t2)
				sw $s2, 2500($t2)
				sw $s2, 2624($t2)
				sw $s2, 2628($t2)		
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	quad_5x7:
	lw $a2, 2880($t2)
		bne $a2, $s2, possivel_jogada_5x7
		possivel_jogada_5x7:
			move $fp, $zero		
			sw $s2, 2880($t2)
			sw $s2, 2884($t2)
			sw $s2, 3008($t2)
			sw $s2, 3012($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_5x7:
	lw $a2, 2880($t2)
		bne $a2, $s1, poss_jogada_5x7
			poss_jogada_5x7:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2880($t2)
				sw $s2, 2884($t2)
				sw $s2, 3008($t2)
				sw $s2, 3012($t2)		
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_5x8:
	lw $a2, 3264($t2)
		bne $a2, $s2, possivel_jogada_5x8
		possivel_jogada_5x8:
			move $fp, $zero		
			sw $s2, 3264($t2)
			sw $s2, 3268($t2)
			sw $s2, 3392($t2)
			sw $s2, 3396($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	jr $ra
	acertou_5x8:
	lw $a2, 3264($t2)
		bne $a2, $s1, poss_jogada_5x8
			poss_jogada_5x8:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 3264($t2)
				sw $s2, 3268($t2)
				sw $s2, 3392($t2)
				sw $s2, 3396($t2)		
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra



	# ==================================================================
	# ============================ culuna 6 ============================
	
	quad_6x0:
	lw $a2, 204($t2)
		bne $a2, $s2, possivel_jogada_6x0
		possivel_jogada_6x0:
			move $fp, $zero		
			sw $s2, 204($t2)
			sw $s2, 208($t2)
			sw $s2, 332($t2)
			sw $s2, 336($t2)	
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_6x0:
	lw $a2,  204($t2)
		bne $a2, $s1, poss_jogada_6x0
			poss_jogada_6x0:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 204($t2)
				sw $s2, 208($t2)
				sw $s2, 332($t2)
				sw $s2, 336($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_6x1:
	lw $a2, 588($t2)
		bne $a2, $s2, possivel_jogada_6x1
		possivel_jogada_6x1:
			move $fp, $zero		
			sw $s2, 588($t2)
			sw $s2, 592($t2)
			sw $s2, 716($t2)
			sw $s2, 720($t2)
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_6x1:
	lw $a2, 588($t2)
		bne $a2, $s1, poss_jogada_6x1
			poss_jogada_6x1:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 588($t2)
				sw $s2, 592($t2)
				sw $s2, 716($t2)
				sw $s2, 720($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_6x2:
	lw $a2, 972($t2)
		bne $a2, $s2, possivel_jogada_6x2
		possivel_jogada_6x2:
			move $fp, $zero		
			sw $s2, 972($t2)
			sw $s2, 976($t2)
			sw $s2, 1100($t2)
			sw $s2, 1104($t2)		
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_6x2:
	lw $a2, 972($t2)
		bne $a2, $s1, poss_jogada_6x2
			poss_jogada_6x2:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 972($t2)
				sw $s2, 976($t2)
				sw $s2, 1100($t2)
				sw $s2, 1104($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_6x3:
	lw $a2, 1356($t2)
		bne $a2, $s2, possivel_jogada_6x3
		possivel_jogada_6x3:
			move $fp, $zero		
			sw $s2, 1356($t2)
			sw $s2, 1360($t2)
			sw $s2, 1484($t2)
			sw $s2, 1488($t2)
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_6x3:
	lw $a2, 1356($t2)
		bne $a2, $s1, poss_jogada_6x3
			poss_jogada_6x3:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1356($t2)
				sw $s2, 1360($t2)
				sw $s2, 1484($t2)
				sw $s2, 1488($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
		
	quad_6x4:
	lw $a2, 1740($t2)
		bne $a2, $s2, possivel_jogada_6x4
		possivel_jogada_6x4:
			move $fp, $zero		
			sw $s2, 1740($t2)
			sw $s2, 1744($t2)
			sw $s2, 1868($t2)
			sw $s2, 1872($t2)	
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_6x4:
	lw $a2, 1740($t2)
		bne $a2, $s1, poss_jogada_6x4
			poss_jogada_6x4:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1740($t2)
				sw $s2, 1744($t2)
				sw $s2, 1868($t2)
				sw $s2, 1872($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_6x5:
	lw $a2, 2124($t2)
		bne $a2, $s2, possivel_jogada_6x5
		possivel_jogada_6x5:
			move $fp, $zero		
			sw $s2, 2124($t2)
			sw $s2, 2128($t2)
			sw $s2, 2252($t2)
			sw $s2, 2256($t2)
		beq $a2, $s2, jogada_mesma_coordenada			
	jr $ra
	acertou_6x5:
	lw $a2, 2124($t2)
		bne $a2, $s1, poss_jogada_6x5
			poss_jogada_6x5:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2124($t2)
				sw $s2, 2128($t2)
				sw $s2, 2252($t2)
				sw $s2, 2256($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
		
	quad_6x6:
	lw $a2, 2508($t2)
		bne $a2, $s2, possivel_jogada_6x6
		possivel_jogada_6x6:
			move $fp, $zero		
			sw $s2, 2508($t2)
			sw $s2, 2512($t2)
			sw $s2, 2636($t2)
			sw $s2, 2640($t2)
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_6x6:
	lw $a2, 2508($t2)
		bne $a2, $s1, poss_jogada_6x6
			poss_jogada_6x6:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2508($t2)
				sw $s2, 2512($t2)
				sw $s2, 2636($t2)
				sw $s2, 2640($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_6x7:
	lw $a2, 2892($t2)
		bne $a2, $s2, possivel_jogada_6x7
		possivel_jogada_6x7:
			move $fp, $zero		
			sw $s2, 2892($t2)
			sw $s2, 2896($t2)
			sw $s2, 3020($t2)
			sw $s2, 3024($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_6x7:
	lw $a2, 2892($t2)
		bne $a2, $s1, poss_jogada_6x7
			poss_jogada_6x7:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2892($t2)
				sw $s2, 2896($t2)
				sw $s2, 3020($t2)
				sw $s2, 3024($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_6x8:
	lw $a2, 3276($t2)
		bne $a2, $s2, possivel_jogada_6x8
		possivel_jogada_6x8:
			move $fp, $zero		
			sw $s2, 3276($t2)
			sw $s2, 3280($t2)
			sw $s2, 3404($t2)
			sw $s2, 3408($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_6x8:
	lw $a2, 3276($t2)
		bne $a2, $s1, poss_jogada_6x8
			poss_jogada_6x8:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 3276($t2)
				sw $s2, 3280($t2)
				sw $s2, 3404($t2)
				sw $s2, 3408($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra



	# ==================================================================
	# ============================ culuna 7 ============================
	
	quad_7x0:
	lw $a2, 216($t2)
		bne $a2, $s2, possivel_jogada_7x0
		possivel_jogada_7x0:
			move $fp, $zero		
			sw $s2, 216($t2)
			sw $s2, 220($t2)
			sw $s2, 344($t2)
			sw $s2, 348($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_7x0:
	lw $a2, 216($t2)
		bne $a2, $s1, poss_jogada_7x0
			poss_jogada_7x0:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 216($t2)
				sw $s2, 220($t2)
				sw $s2, 344($t2)
				sw $s2, 348($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_7x1:
	lw $a2, 600($t2)
		bne $a2, $s2, possivel_jogada_7x1
		possivel_jogada_7x1:
			move $fp, $zero		
			sw $s2, 600($t2)
			sw $s2, 604($t2)
			sw $s2, 728($t2)	
			sw $s2, 732($t2)	
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_7x1:
	lw $a2, 600($t2)
		bne $a2, $s1, poss_jogada_7x1
			poss_jogada_7x1:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 600($t2)
				sw $s2, 604($t2)
				sw $s2, 728($t2)	
				sw $s2, 732($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	quad_7x2:
	lw $a2, 984($t2)
		bne $a2, $s2, possivel_jogada_7x2
		possivel_jogada_7x2:
			move $fp, $zero		
			sw $s2, 984($t2)
			sw $s2, 988($t2)
			sw $s2, 1112($t2)
			sw $s2, 1116($t2)
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_7x2:
	lw $a2, 984($t2)
		bne $a2, $s1, poss_jogada_7x2
			poss_jogada_7x2:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 984($t2)
				sw $s2, 988($t2)
				sw $s2, 1112($t2)
				sw $s2, 1116($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_7x3:
	lw $a2, 1368($t2)
		bne $a2, $s2, possivel_jogada_7x3
		possivel_jogada_7x3:
			move $fp, $zero		
			sw $s2, 1368($t2)
			sw $s2, 1372($t2)
			sw $s2, 1496($t2)
			sw $s2, 1500($t2)
		beq $a2, $s2, jogada_mesma_coordenada			
	jr $ra
	acertou_7x3:
	lw $a2, 1368($t2)
		bne $a2, $s1, poss_jogada_7x3
			poss_jogada_7x3:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1368($t2)
				sw $s2, 1372($t2)
				sw $s2, 1496($t2)
				sw $s2, 1500($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
		
	quad_7x4:
	lw $a2, 1752($t2)
		bne $a2, $s2, possivel_jogada_7x4
		possivel_jogada_7x4:
			move $fp, $zero		
			sw $s2, 1752($t2)
			sw $s2, 1756($t2)
			sw $s2, 1880($t2)
			sw $s2, 1884($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_7x4:
	lw $a2, 1752($t2)
		bne $a2, $s1, poss_jogada_7x4
			poss_jogada_7x4:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1752($t2)
				sw $s2, 1756($t2)
				sw $s2, 1880($t2)
				sw $s2, 1884($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_7x5:
	lw $a2, 2136($t2)
		bne $a2, $s2, possivel_jogada_7x5
		possivel_jogada_7x5:
			move $fp, $zero		
			sw $s2, 2136($t2)
			sw $s2, 2140($t2)
			sw $s2, 2264($t2)
			sw $s2, 2268($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_7x5:
	lw $a2, 2136($t2)
		bne $a2, $s1, poss_jogada_7x5
			poss_jogada_7x5:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2136($t2)
				sw $s2, 2140($t2)
				sw $s2, 2264($t2)
				sw $s2, 2268($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
		
	quad_7x6:
	lw $a2, 2520($t2)
		bne $a2, $s2, possivel_jogada_7x6
		possivel_jogada_7x6:
			move $fp, $zero		
			sw $s2, 2520($t2)
			sw $s2, 2524($t2)
			sw $s2, 2648($t2)
			sw $s2, 2652($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_7x6:
	lw $a2, 2520($t2)
		bne $a2, $s1, poss_jogada_7x6
			poss_jogada_7x6:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2520($t2)
				sw $s2, 2524($t2)
				sw $s2, 2648($t2)
				sw $s2, 2652($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_7x7:
	lw $a2, 2904($t2)
		bne $a2, $s2, possivel_jogada_7x7
		possivel_jogada_7x7:
			move $fp, $zero		
			sw $s2, 2904($t2)
			sw $s2, 2908($t2)
			sw $s2, 3032($t2)
			sw $s2, 3036($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_7x7:
	lw $a2, 2904($t2)
		bne $a2, $s1, poss_jogada_7x7
			poss_jogada_7x7:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2904($t2)
				sw $s2, 2908($t2)
				sw $s2, 3032($t2)
				sw $s2, 3036($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_7x8:
	lw $a2, 3288($t2)
		bne $a2, $s2, possivel_jogada_7x8
		possivel_jogada_7x8:
			move $fp, $zero		
			sw $s2, 3288($t2)
			sw $s2, 3292($t2)
			sw $s2, 3416($t2)
			sw $s2, 3420($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_7x8:
	lw $a2, 3288($t2)
		bne $a2, $s1, poss_jogada_7x8
			poss_jogada_7x8:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 3288($t2)
				sw $s2, 3292($t2)
				sw $s2, 3416($t2)
				sw $s2, 3420($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	
	
	# ==================================================================
	# ============================ culuna 8 ============================
	
	quad_8x0:
	lw $a2, 228($t2)
		bne $a2, $s2, possivel_jogada_8x0
		possivel_jogada_8x0:
			move $fp, $zero		
			sw $s2, 228($t2)
			sw $s2, 232($t2)
			sw $s2, 356($t2)
			sw $s2, 360($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_8x0:
	lw $a2, 228($t2)
		bne $a2, $s1, poss_jogada_8x0
			poss_jogada_8x0:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 228($t2)
				sw $s2, 232($t2)
				sw $s2, 356($t2)
				sw $s2, 360($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_8x1:
	lw $a2, 612($t2)
		bne $a2, $s2, possivel_jogada_8x1
		possivel_jogada_8x1:
			move $fp, $zero		
			sw $s2, 612($t2)
			sw $s2, 616($t2)
			sw $s2, 740($t2)		
			sw $s2, 744($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_8x1:
	lw $a2, 612($t2)
		bne $a2, $s1, poss_jogada_8x1
			poss_jogada_8x1:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 612($t2)
				sw $s2, 616($t2)
				sw $s2, 740($t2)		
				sw $s2, 744($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_8x2:
	lw $a2, 996($t2)
		bne $a2, $s2, possivel_jogada_8x2
		possivel_jogada_8x2:
			move $fp, $zero		
			sw $s2, 996($t2)
			sw $s2, 1000($t2)
			sw $s2, 1124($t2)
			sw $s2, 1128($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_8x2:
	lw $a2, 996($t2)
		bne $a2, $s1, poss_jogada_8x2
			poss_jogada_8x2:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 996($t2)
				sw $s2, 1000($t2)
				sw $s2, 1124($t2)
				sw $s2, 1128($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_8x3:
	lw $a2, 1380($t2)
		bne $a2, $s2, possivel_jogada_8x3
		possivel_jogada_8x3:
			move $fp, $zero		
			sw $s2, 1380($t2)
			sw $s2, 1384($t2)
			sw $s2, 1508($t2)
			sw $s2, 1512($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_8x3:
	lw $a2, 1380($t2)
		bne $a2, $s1, poss_jogada_8x3
			poss_jogada_8x3:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1380($t2)
				sw $s2, 1384($t2)
				sw $s2, 1508($t2)
				sw $s2, 1512($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
		
	quad_8x4:
	lw $a2, 1764($t2)
		bne $a2, $s2, possivel_jogada_8x4
		possivel_jogada_8x4:
			move $fp, $zero		
			sw $s2, 1764($t2)
			sw $s2, 1768($t2)
			sw $s2, 1892($t2)
			sw $s2, 1896($t2)	
		beq $a2, $s2, jogada_mesma_coordenada
	jr $ra
	acertou_8x4:
	lw $a2, 1764($t2)
		bne $a2, $s1, poss_jogada_8x4
			poss_jogada_8x4:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1764($t2)
				sw $s2, 1768($t2)
				sw $s2, 1892($t2)
				sw $s2, 1896($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_8x5:
	lw $a2, 2148($t2)
		bne $a2, $s2, possivel_jogada_8x5
		possivel_jogada_8x5:
			move $fp, $zero		
			sw $s2, 2148($t2)
			sw $s2, 2152($t2)
			sw $s2, 2276($t2)
			sw $s2, 2280($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_8x5:
	lw $a2, 2148($t2)
		bne $a2, $s1, poss_jogada_8x5
			poss_jogada_8x5:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2148($t2)
				sw $s2, 2152($t2)
				sw $s2, 2276($t2)
				sw $s2, 2280($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
		
	quad_8x6:
	lw $a2, 2532($t2)
		bne $a2, $s2, possivel_jogada_8x6
		possivel_jogada_8x6:
			move $fp, $zero		
			sw $s2, 2532($t2)
			sw $s2, 2536($t2)
			sw $s2, 2660($t2)
			sw $s2, 2664($t2)	
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_8x6:
	lw $a2, 2532($t2)
		bne $a2, $s1, poss_jogada_8x6
			poss_jogada_8x6:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2532($t2)
				sw $s2, 2536($t2)
				sw $s2, 2660($t2)
				sw $s2, 2664($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	quad_8x7:
	lw $a2, 2916($t2)
		bne $a2, $s2, possivel_jogada_8x7
		possivel_jogada_8x7:
			move $fp, $zero		
			sw $s2, 2916($t2)
			sw $s2, 2920($t2)
			sw $s2, 3044($t2)
			sw $s2, 3048($t2)
		beq $a2, $s2, jogada_mesma_coordenada			
	jr $ra
	acertou_8x7:
	lw $a2, 2916($t2)
		bne $a2, $s1, poss_jogada_8x7
			poss_jogada_8x7:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2916($t2)
				sw $s2, 2920($t2)
				sw $s2, 3044($t2)
				sw $s2, 3048($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_8x8:
	lw $a2, 3300($t2)
		bne $a2, $s2, possivel_jogada_8x8
		possivel_jogada_8x8:
			move $fp, $zero		
			sw $s2, 3300($t2)
			sw $s2, 3304($t2)
			sw $s2, 3428($t2)
			sw $s2, 3432($t2)	
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_8x8:
	lw $a2, 3300($t2)
		bne $a2, $s1, poss_jogada_8x8
			poss_jogada_8x8:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 3300($t2)
				sw $s2, 3304($t2)
				sw $s2, 3428($t2)
				sw $s2, 3432($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	
	# ==================================================================
	# ============================ culuna 9 ============================
	
	quad_9x0:
	lw $a2, 240($t2)
		bne $a2, $s2, possivel_jogada_9x0
		possivel_jogada_9x0:
			move $fp, $zero		
			sw $s2, 240($t2)
			sw $s2, 244($t2)
			sw $s2, 368($t2)
			sw $s2, 372($t2)	
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_9x0:
	lw $a2, 240($t2)
		bne $a2, $s1, poss_jogada_9x0
			poss_jogada_9x0:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 240($t2)
				sw $s2, 244($t2)
				sw $s2, 368($t2)
				sw $s2, 372($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_9x1:
	lw $a2, 624($t2)
		bne $a2, $s2, possivel_jogada_9x1
		possivel_jogada_9x1:
			move $fp, $zero		
			sw $s2, 624($t2)
			sw $s2, 628($t2)
			sw $s2, 752($t2)
			sw $s2, 756($t2)
		beq $a2, $s2, jogada_mesma_coordenada				
	jr $ra
	acertou_9x1:
	lw $a2, 624($t2)
		bne $a2, $s1, poss_jogada_9x1
			poss_jogada_9x1:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 624($t2)
				sw $s2, 628($t2)
				sw $s2, 752($t2)
				sw $s2, 756($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_9x2:
	lw $a2, 1008($t2)
		bne $a2, $s2, possivel_jogada_9x2
		possivel_jogada_9x2:
			move $fp, $zero		
			sw $s2, 1008($t2)
			sw $s2, 1012($t2)
			sw $s2, 1136($t2)
			sw $s2, 1140($t2)
		beq $a2, $s2, jogada_mesma_coordenada			
	jr $ra
	acertou_9x2:
	lw $a2, 1008($t2)
		bne $a2, $s1, poss_jogada_9x2
			poss_jogada_9x2:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1008($t2)
				sw $s2, 1012($t2)
				sw $s2, 1136($t2)
				sw $s2, 1140($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	quad_9x3:
	lw $a2, 1392($t2)
		bne $a2, $s2, possivel_jogada_9x3
		possivel_jogada_9x3:
			move $fp, $zero		
			sw $s2, 1392($t2)
			sw $s2, 1396($t2)
			sw $s2, 1520($t2)
			sw $s2, 1524($t2)	
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_9x3:
	lw $a2, 1392($t2)
		bne $a2, $s1, poss_jogada_9x3
			poss_jogada_9x3:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1392($t2)
				sw $s2, 1396($t2)
				sw $s2, 1520($t2)
				sw $s2, 1524($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
		
	quad_9x4:
	lw $a2, 1776($t2)
		bne $a2, $s2, possivel_jogada_9x4
		possivel_jogada_9x4:
			move $fp, $zero		
			sw $s2, 1776($t2)
			sw $s2, 1780($t2)
			sw $s2, 1904($t2)
			sw $s2, 1908($t2)		
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_9x4:
	lw $a2, 1776($t2)
		bne $a2, $s1, poss_jogada_9x4
			poss_jogada_9x4:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 1776($t2)
				sw $s2, 1780($t2)
				sw $s2, 1904($t2)
				sw $s2, 1908($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_9x5:
	lw $a2, 2160($t2)
		bne $a2, $s2, possivel_jogada_9x5
		possivel_jogada_9x5:
			move $fp, $zero		
			sw $s2, 2160($t2)
			sw $s2, 2164($t2)
			sw $s2, 2288($t2)
			sw $s2, 2292($t2)	
		beq $a2, $s2, jogada_mesma_coordenada			
	jr $ra
	acertou_9x5:
	lw $a2, 2160($t2)
		bne $a2, $s1, poss_jogada_9x5
			poss_jogada_9x5:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2160($t2)
				sw $s2, 2164($t2)
				sw $s2, 2288($t2)
				sw $s2, 2292($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
		
	quad_9x6:
	lw $a2, 2544($t2)
		bne $a2, $s2, possivel_jogada_9x6
		possivel_jogada_9x6:
			move $fp, $zero		
			sw $s2, 2544($t2)
			sw $s2, 2548($t2)
			sw $s2, 2672($t2)
			sw $s2, 2676($t2)	
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_9x6:
	lw $a2, 2544($t2)
		bne $a2, $s1, poss_jogada_9x6
			poss_jogada_9x6:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2544($t2)
				sw $s2, 2548($t2)
				sw $s2, 2672($t2)
				sw $s2, 2676($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_9x7:
	lw $a2, 2928($t2)
		bne $a2, $s2, possivel_jogada_9x7
		possivel_jogada_9x7:
			move $fp, $zero		
			sw $s2, 2928($t2)
			sw $s2, 2932($t2)
			sw $s2, 3056($t2)
			sw $s2, 3060($t2)	
		beq $a2, $s2, jogada_mesma_coordenada		
	jr $ra
	acertou_9x7:
	lw $a2, 2928($t2)
		bne $a2, $s1, poss_jogada_9x7
			poss_jogada_9x7:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 2928($t2)
				sw $s2, 2932($t2)
				sw $s2, 3056($t2)
				sw $s2, 3060($t2)
				addi $s2, $zero, 0xff3333 #VERMELHA	
			bne $a2,$s1,jogada_mesma_coordenada
	jr $ra
	
	quad_9x8:
	lw $a2, 3312($t2)
		bne $a2, $s2, possivel_jogada_9x8
		possivel_jogada_9x8:
			move $fp, $zero		
			sw $s2, 3312($t2)
			sw $s2, 3316($t2)
			sw $s2, 3440($t2)
			sw $s2, 3444($t2)
		beq $a2, $s2, jogada_mesma_coordenada	
	jr $ra
	acertou_9x8:
	lw $a2, 3312($t2)
		bne $a2, $s1, poss_jogada_9x8
			poss_jogada_9x8:
				addi $fp, $zero,1
				addi $s2, $zero, 0x17FD04  #Amarela	     
				sw $s2, 3312($t2)
				sw $s2, 3316($t2)
				sw $s2, 3440($t2)
				sw $s2, 3444($t2)	
				addi $s2, $zero, 0xff3333 #VERMELHA
			bne $a2,$s1,jogada_mesma_coordenada	
	jr $ra
	
	on_player_1:
		
		#OFF PLAYER 2
		addi $s0, $zero, 0xFFFF00 #OrangeRed
		sw $s0, 3680($t2)
		sw $s0, 3684($t2)
		sw $s0, 3688($t2)	
		sw $s0, 3696($t2)
		sw $s0, 3700($t2)
		sw $s0, 3704($t2)
		sw $s0, 3808($t2)
		sw $s0, 3812($t2)
		sw $s0, 3816($t2)
		sw $s0, 3832($t2)
		sw $s0, 3936($t2)
		sw $s0, 3952($t2)
		sw $s0, 3956($t2)
		sw $s0, 4064($t2)
		sw $s0, 4080($t2)
		sw $s0, 4084($t2)
		sw $s0, 4088($t2)
		
		#ON PLAYER 1
		addi $s0, $zero, 0xFF4500 #OrangeRed
		sw $s0, 3592($t2)
		sw $s0, 3596($t2)
		sw $s0, 3600($t2)
		sw $s0, 3608($t2)
		sw $s0, 3612($t2)
		sw $s0, 3720($t2)
		sw $s0, 3724($t2)
		sw $s0, 3728($t2)
		sw $s0, 3740($t2)
		sw $s0, 3848($t2)
		sw $s0, 3868($t2)
		sw $s0, 3976($t2)
		sw $s0, 3992($t2)
		sw $s0, 3996($t2)
		sw $s0, 4000($t2)
	jr $ra
	
	on_player_2:
		
		#OFF PLAYER 1
		addi $s0, $zero, 0xFFFF00 #AMARELA
		sw $s0, 3592($t2)
		sw $s0, 3596($t2)
		sw $s0, 3600($t2)
		sw $s0, 3608($t2)
		sw $s0, 3612($t2)
		sw $s0, 3720($t2)
		sw $s0, 3724($t2)
		sw $s0, 3728($t2)
		sw $s0, 3740($t2)
		sw $s0, 3848($t2)
		sw $s0, 3868($t2)
		sw $s0, 3976($t2)
		sw $s0, 3992($t2)
		sw $s0, 3996($t2)
		sw $s0, 4000($t2)
		
		#ON PLAYER 1
		addi $s0, $zero, 0xDC143C 
		sw $s0, 3680($t2)
		sw $s0, 3684($t2)
		sw $s0, 3688($t2)	
		sw $s0, 3696($t2)
		sw $s0, 3700($t2)
		sw $s0, 3704($t2)
		sw $s0, 3808($t2)
		sw $s0, 3812($t2)
		sw $s0, 3816($t2)
		sw $s0, 3832($t2)
		sw $s0, 3936($t2)
		sw $s0, 3952($t2)
		sw $s0, 3956($t2)
		sw $s0, 4064($t2)
		sw $s0, 4080($t2)
		sw $s0, 4084($t2)
		sw $s0, 4088($t2)
	jr $ra
	
	

	desenha_tabuleiro:	
	#Cores das bordas
	addi $s0, $zero, 0xFFFF00 #Amarela
	sw $s0, 0($t2)
	sw $s0, 4($t2)
	sw $s0, 8($t2)		
	sw $s0, 12($t2)	
	sw $s0, 16($t2)
	sw $s0, 20($t2)	
	sw $s0, 24($t2)
	sw $s0, 28($t2)
	sw $s0, 32($t2)
	sw $s0, 36($t2)	
	sw $s0, 40($t2)
	sw $s0, 44($t2)
	sw $s0, 48($t2)
	sw $s0, 52($t2)
	sw $s0, 56($t2)
	sw $s0, 60($t2)
	sw $s0, 64($t2)
	sw $s0, 68($t2)
	sw $s0, 72($t2)
	sw $s0, 76($t2)
	sw $s0, 80($t2)
	sw $s0, 84($t2)
	sw $s0, 88($t2)
	sw $s0, 92($t2)
	sw $s0, 96($t2)
	sw $s0, 100($t2)
	sw $s0, 104($t2)
	sw $s0, 108($t2)
	sw $s0, 112($t2)
	sw $s0, 116($t2)
	sw $s0, 120($t2)
	sw $s0, 124($t2)	
	sw $s0, 128($t2)
	sw $s0, 256($t2)
	sw $s0, 384($t2)	
	sw $s0, 512($t2)
	sw $s0, 640($t2)
	sw $s0, 768($t2)
	sw $s0, 896($t2)
	sw $s0, 1024($t2)
	sw $s0, 1152($t2)
	sw $s0, 1280($t2)
	sw $s0, 1408($t2)
	sw $s0, 1536($t2)
	sw $s0, 1664($t2)
	sw $s0, 1792($t2)
	sw $s0, 1920($t2)
	sw $s0, 2048($t2)
	sw $s0, 2176($t2)	
	sw $s0, 2304($t2)
	sw $s0, 2432($t2)	
	sw $s0, 2560($t2)
	sw $s0, 2688($t2)	
	sw $s0, 2816($t2)
	sw $s0, 2944($t2)
	sw $s0, 3072($t2)	
        sw $s0, 3200($t2)
	sw $s0, 3328($t2)
	sw $s0, 3456($t2)
	sw $s0, 3584($t2)
	sw $s0, 3712($t2)
	
		
	#===========================================================================
		
	
	
	#linha 0 coluna 0
	sw $s1, 132($t2)	
	sw $s1, 136($t2)
	#linha 0 coluna 1
	sw $s1, 144($t2)
	sw $s1, 148($t2)
	
	#linha 0 coluna 2
	sw $s1, 156($t2)
	sw $s1, 160($t2)
	
	#linha 0 coluna 3
	sw $s1, 168($t2)
	sw $s1, 172($t2)
	
	#linha 0 culuna 4
	sw $s1, 180($t2)
	sw $s1, 184($t2)
	
	#linha 0 culuna 5
	sw $s1, 192($t2)
	sw $s1, 196($t2)
	#linha 0 culuna 6
	sw $s1, 204($t2)
	sw $s1, 208($t2)
	#linha 0 culuna 7
	sw $s1, 216($t2)
	sw $s1, 220($t2)
	#linha 0 culuna 8
	sw $s1, 228($t2)
	sw $s1, 232($t2)
	#linha 0 culuna 9
	sw $s1, 240($t2)
	sw $s1, 244($t2)
	
	
	sw $s1, 260($t2)
	sw $s1, 264($t2)
	

	sw $s1, 272($t2)
	sw $s1, 276($t2)
	
	sw $s1, 284($t2)
	sw $s1, 288($t2)
	
	sw $s1, 296($t2)
	sw $s1, 300($t2)
	
	sw $s1, 308($t2)
	sw $s1, 312($t2)
	
	sw $s1, 320($t2)
	sw $s1, 324($t2)
	
	sw $s1, 332($t2)
	sw $s1, 336($t2)
	
	sw $s1, 344($t2)
	sw $s1, 348($t2)
	
	sw $s1, 356($t2)
	sw $s1, 360($t2)
	
	sw $s1, 368($t2)
	sw $s1, 372($t2)
	
	sw $s1, 516($t2)
	sw $s1, 520($t2)
	
	#linha 1 coluna 1
	sw $s1, 528($t2)
	sw $s1, 532($t2)
		
	#linha 1 coluna 2
	sw $s1, 540($t2)
	sw $s1, 544($t2)
	
	#linha 1 coluna 3
	sw $s1, 552($t2)
	sw $s1, 556($t2)
	
	#linha 1 coluna 4
	sw $s1, 564($t2)
	sw $s1, 568($t2)
	
	#linha 1 coluna 5
	sw $s1, 576($t2)
	sw $s1, 580($t2)
	#linha 1 coluna 6
	sw $s1, 588($t2)
	sw $s1, 592($t2)
	#linha 1 coluna 7
	sw $s1, 600($t2)
	sw $s1, 604($t2)
	#linha 1 coluna 8
	sw $s1, 612($t2)
	sw $s1, 616($t2)
	#linha 1 coluna 9
	sw $s1, 624($t2)
	sw $s1, 628($t2)

	sw $s1, 644($t2)
	sw $s1, 648($t2)
	
	sw $s1, 656($t2)
	sw $s1, 660($t2)
	
	sw $s1, 668($t2)
	sw $s1, 672($t2)
	
	sw $s1, 680($t2)
	sw $s1, 684($t2)
	
	sw $s1, 692($t2)
	sw $s1, 696($t2)
	
	sw $s1, 704($t2)
	sw $s1, 708($t2)
	
	sw $s1, 716($t2)
	sw $s1, 720($t2)

	sw $s1, 728($t2)	
	sw $s1, 732($t2)
	

	sw $s1, 740($t2)		
	sw $s1, 744($t2)
		
	sw $s1, 752($t2)
	sw $s1, 756($t2)
	
	#Inicio linha 2
	sw $s1, 900($t2)
	sw $s1, 904($t2)
	
	#linha 2 coluna 1
	sw $s1, 912($t2)
	sw $s1, 916($t2)
	
	#linha 2 coluna 2
	sw $s1, 924($t2)
	sw $s1, 928($t2)
	
	#linha 2 coluna 3
	sw $s1, 936($t2)
	sw $s1, 940($t2)
	
	#linha 2 coluna 4
	sw $s1, 948($t2)
	sw $s1, 952($t2)
	
	#linha 2 coluna 5
	sw $s1, 960($t2)
	sw $s1, 964($t2)
	#linha 2 coluna 6
	sw $s1, 972($t2)
	sw $s1, 976($t2)
	#linha 2 coluna 7
	sw $s1, 984($t2)
	sw $s1, 988($t2)
	#linha 2 coluna 8
	sw $s1, 996($t2)
	sw $s1, 1000($t2)
	#linha 2 coluna 9
	sw $s1, 1008($t2)
	sw $s1, 1012($t2)

        sw $s1, 1028($t2)
	sw $s1, 1032($t2)
	
	sw $s1, 1040($t2)
	sw $s1, 1044($t2)
	
	sw $s1, 1052($t2)
	sw $s1, 1056($t2)
	
	sw $s1, 1064($t2)
	sw $s1, 1068($t2)
	
	sw $s1, 1076($t2)
	sw $s1, 1080($t2)
	
	sw $s1, 1088($t2)
	sw $s1, 1092($t2)
	
	sw $s1, 1100($t2)
	sw $s1, 1104($t2)
	
	sw $s1, 1112($t2)
	sw $s1, 1116($t2)
																																																																																																																																	sw $s1, 1100($t2)
	sw $s1, 1124($t2)
	sw $s1, 1128($t2)
	
	sw $s1, 1136($t2)
	sw $s1, 1140($t2)																																																																																																																																																																																																																																																																
	
	#Inicio linha 3
	sw $s1, 1284($t2)
	sw $s1, 1288($t2)
	#linha 3 coluna 1
	sw $s1, 1296($t2)
	sw $s1, 1300($t2)
	
	# linha 3 coluna 2
	sw $s1, 1308($t2)
	sw $s1, 1312($t2)
	
	#linha 3 coluna 3
	sw $s1, 1320($t2)
	sw $s1, 1324($t2)
	
	#linha 3 coluna 4
	sw $s1, 1332($t2)
	sw $s1, 1336($t2)
	
	#linha 3 coluna 5
	sw $s1, 1344($t2)
	sw $s1, 1348($t2)
	#linha 3 coluna 6
	sw $s1, 1356($t2)
	sw $s1, 1360($t2)
	#linha 3 coluna 7
	sw $s1, 1368($t2)
	sw $s1, 1372($t2)
	#linha 3 coluna 8
	sw $s1, 1380($t2)
	sw $s1, 1384($t2)
	#linha 3 coluna 9
	sw $s1, 1392($t2)
	sw $s1, 1396($t2)
	

	sw $s1, 1412($t2)
	sw $s1, 1416($t2)
	
	
	sw $s1, 1424($t2)
	sw $s1, 1428($t2)
	
	sw $s1, 1436($t2)
	sw $s1, 1440($t2)
	
	sw $s1, 1448($t2)
	sw $s1, 1452($t2)
	
	sw $s1, 1460($t2)
	sw $s1, 1464($t2)
	
	sw $s1, 1472($t2)
	sw $s1, 1476($t2)
	
	sw $s1, 1484($t2)
	sw $s1, 1488($t2)
	
	sw $s1, 1496($t2)
	sw $s1, 1500($t2)
	
	sw $s1, 1508($t2)
	sw $s1, 1512($t2)
	
	sw $s1, 1520($t2)
	sw $s1, 1524($t2)
	
	#Inicio linha 4
	sw $s1, 1668($t2)
	sw $s1, 1672($t2)
#linha 4 coluna 1
sw $s1, 1680($t2)
sw $s1, 1684($t2)
#linha 4 coluna 2
sw $s1, 1692($t2)
sw $s1, 1696($t2)
#linha 4 coluna 3
sw $s1, 1704($t2)
sw $s1, 1708($t2)

#linha 4 coluna 4
sw $s1, 1716($t2)
sw $s1, 1720($t2)

#linha 4 coluna 5
sw $s1, 1728($t2)
sw $s1, 1732($t2)

#linha 4 coluna 6
sw $s1, 1740($t2)
sw $s1, 1744($t2)
#linha 4 coluna 7
sw $s1, 1752($t2)
sw $s1, 1756($t2)
#linha 4 coluna 8
sw $s1, 1764($t2)
sw $s1, 1768($t2)
#linha 4 coluna 9
sw $s1, 1776($t2)
sw $s1, 1780($t2)

sw $s1, 1796($t2)
sw $s1, 1800($t2)
sw $s1, 1808($t2)
sw $s1, 1812($t2)
sw $s1, 1820($t2)
sw $s1, 1824($t2)
sw $s1, 1832($t2)
sw $s1, 1836($t2)
sw $s1, 1844($t2)
sw $s1, 1848($t2)

sw $s1, 1856($t2)
sw $s1, 1860($t2)


sw $s1, 1868($t2)
sw $s1, 1872($t2)
sw $s1, 1880($t2)
sw $s1, 1884($t2)
sw $s1, 1892($t2)
sw $s1, 1896($t2)
sw $s1, 1904($t2)
sw $s1, 1908($t2)

#Inicio linha 5
sw $s1, 2052($t2)
sw $s1, 2056($t2)
#linha 5coluna 1
sw $s1, 2064($t2)
sw $s1, 2068($t2)

#linha 5 coluna 2
sw $s1, 2076($t2)
sw $s1, 2080($t2)

#linha 5 coluna 3
sw $s1, 2088($t2)
sw $s1, 2092($t2)

#linha 5 coluna 4
sw $s1, 2100($t2)
sw $s1, 2104($t2)

#linha 5 coluna 5
sw $s1, 2112($t2)
sw $s1, 2116($t2)
#linha 5 coluna 6
sw $s1, 2124($t2)
sw $s1, 2128($t2)
#linha 5 coluna 7
sw $s1, 2136($t2)
sw $s1, 2140($t2)
#linha 5 coluna 8
sw $s1, 2148($t2)
sw $s1, 2152($t2)
#linha 5 coluna 9
sw $s1, 2160($t2)
sw $s1, 2164($t2)

sw $s1, 2180($t2)
sw $s1, 2184($t2)
sw $s1, 2192($t2)
sw $s1, 2196($t2)

sw $s1, 2204($t2)
sw $s1, 2208($t2)
sw $s1, 2216($t2)
sw $s1, 2220($t2)
sw $s1, 2228($t2)
sw $s1, 2232($t2)

sw $s1, 2240($t2)
sw $s1, 2244($t2)

sw $s1, 2252($t2)
sw $s1, 2256($t2)
sw $s1, 2264($t2)
sw $s1, 2268($t2)
sw $s1, 2276($t2)
sw $s1, 2280($t2)
sw $s1, 2288($t2)
sw $s1, 2292($t2)
#inicio linha 6
sw $s1, 2436($t2)
sw $s1, 2440($t2)
#linha 1 coluna 6
sw $s1, 2448($t2)
sw $s1, 2452($t2)

#linha 6 coluna 2
sw $s1, 2460($t2)
sw $s1, 2464($t2)

#linha 6 coluna 3
sw $s1, 2472($t2)
sw $s1, 2476($t2)

#linha 6 coluna 4
sw $s1, 2484($t2)
sw $s1, 2488($t2)

#linha 6 coluna 5
sw $s1, 2496($t2)
sw $s1, 2500($t2)
#linha 6 coluna 6
sw $s1, 2508($t2)
sw $s1, 2512($t2)
#linha 6 coluna 7
sw $s1, 2520($t2)
sw $s1, 2524($t2)
#linha 6 coluna 8
sw $s1, 2532($t2)
sw $s1, 2536($t2)
#linha 6 coluna 9
sw $s1, 2544($t2)
sw $s1, 2548($t2)

sw $s1, 2564($t2)
sw $s1, 2568($t2)
sw $s1, 2576($t2)
sw $s1, 2580($t2)
sw $s1, 2588($t2)
sw $s1, 2592($t2)
sw $s1, 2600($t2)
sw $s1, 2604($t2)
sw $s1, 2612($t2)
sw $s1, 2616($t2)
sw $s1, 2624($t2)
sw $s1, 2628($t2)
sw $s1, 2636($t2)
sw $s1, 2640($t2)
sw $s1, 2648($t2)
sw $s1, 2652($t2)
sw $s1, 2660($t2)
sw $s1, 2664($t2)
sw $s1, 2672($t2)
sw $s1, 2676($t2)

#inicio linha 7
sw $s1, 2820($t2)
sw $s1, 2824($t2)
#linha 7 coluna 1
sw $s1, 2832($t2)
sw $s1, 2836($t2)
#linha 7 coluna 2
sw $s1, 2844($t2)
sw $s1, 2848($t2)

#linha 7 coluna 3
sw $s1, 2856($t2)
sw $s1, 2860($t2)

#linha 7 coluna 4
sw $s1, 2868($t2)
sw $s1, 2872($t2)

#linha 7 coluna 5
sw $s1, 2880($t2)
sw $s1, 2884($t2)
#linha 7 coluna 6
sw $s1, 2892($t2)
sw $s1, 2896($t2)
#linha 7 coluna 7
sw $s1, 2904($t2)
sw $s1, 2908($t2)
#linha 7 coluna 8
sw $s1, 2916($t2)
sw $s1, 2920($t2)
#linha 7 coluna 9
sw $s1, 2928($t2)
sw $s1, 2932($t2)

sw $s1, 2948($t2)
sw $s1, 2952($t2)
sw $s1, 2960($t2)
sw $s1, 2964($t2)
sw $s1, 2972($t2)
sw $s1, 2976($t2)
sw $s1, 2984($t2)
sw $s1, 2988($t2)
sw $s1, 2996($t2)
sw $s1, 3000($t2)
sw $s1, 3008($t2)
sw $s1, 3012($t2)
sw $s1, 3020($t2)
sw $s1, 3024($t2)
sw $s1, 3032($t2)
sw $s1, 3036($t2)
sw $s1, 3044($t2)
sw $s1, 3048($t2)
sw $s1, 3056($t2)
sw $s1, 3060($t2)

#inicio linha 8
sw $s1, 3204($t2)
sw $s1, 3208($t2)
#coluna 1 linha 8
sw $s1, 3216($t2)
sw $s1, 3220($t2)
#linha 8 coluna 2
sw $s1, 3228($t2)
sw $s1, 3232($t2)
#linha 8 acoluna 3
sw $s1, 3240($t2)
sw $s1, 3244($t2)

#linha 8 acoluna 4
sw $s1, 3252($t2)
sw $s1, 3256($t2)

#linha 8 acoluna 5
sw $s1, 3264($t2)
sw $s1, 3268($t2)
#linha 8 acoluna 6
sw $s1, 3276($t2)
sw $s1, 3280($t2)
#linha 8 acoluna 7
sw $s1, 3288($t2)
sw $s1, 3292($t2)
#linha 8 acoluna 8
sw $s1, 3300($t2)
sw $s1, 3304($t2)
#linha 8 acoluna 9
sw $s1, 3312($t2)
sw $s1, 3316($t2)

sw $s1, 3332($t2)
sw $s1, 3336($t2)
sw $s1, 3344($t2)
sw $s1, 3348($t2)
sw $s1, 3356($t2)
sw $s1, 3360($t2)
sw $s1, 3368($t2)
sw $s1, 3372($t2)
sw $s1, 3380($t2)
sw $s1, 3384($t2)
sw $s1, 3392($t2)
sw $s1, 3396($t2)
sw $s1, 3404($t2)
sw $s1, 3408($t2)
sw $s1, 3416($t2)
sw $s1, 3420($t2)
sw $s1, 3428($t2)
sw $s1, 3432($t2)
sw $s1, 3440($t2)
sw $s1, 3444($t2)

addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3588($t2)
sw $s0, 3592($t2)
sw $s0, 3596($t2)
sw $s0, 3600($t2)
sw $s0, 3604($t2)
sw $s0, 3608($t2)
sw $s0, 3612($t2)
sw $s0, 3616($t2)
sw $s0, 3620($t2)
sw $s0, 3624($t2)
sw $s0, 3628($t2)
sw $s0, 3632($t2)
sw $s0, 3636($t2)
sw $s0, 3640($t2)
sw $s0, 3644($t2)
sw $s0, 3648($t2)
sw $s0, 3652($t2)
sw $s0, 3656($t2)
sw $s0, 3660($t2)
sw $s0, 3664($t2)
sw $s0, 3668($t2)
sw $s0, 3672($t2)
sw $s0, 3676($t2)
sw $s0, 3680($t2)
sw $s0, 3684($t2)
sw $s0, 3688($t2)
sw $s0, 3692($t2)
sw $s0, 3696($t2)
sw $s0, 3700($t2)
sw $s0, 3704($t2)
sw $s0, 3708($t2)
sw $s0, 3712($t2)
sw $s0, 3716($t2)
sw $s0, 3720($t2)
sw $s0, 3724($t2)
sw $s0, 3728($t2)
sw $s0, 3732($t2)
sw $s0, 3736($t2)
sw $s0, 3740($t2)
sw $s0, 3744($t2)
sw $s0, 3748($t2)
sw $s0, 3752($t2)
sw $s0, 3756($t2)
sw $s0, 3760($t2)
sw $s0, 3764($t2)
sw $s0, 3768($t2)
sw $s0, 3772($t2)
sw $s0, 3776($t2)
sw $s0, 3780($t2)
sw $s0, 3784($t2)
sw $s0, 3788($t2)
sw $s0, 3792($t2)
sw $s0, 3796($t2)
sw $s0, 3800($t2)
sw $s0, 3804($t2)
sw $s0, 3808($t2)
sw $s0, 3812($t2)
sw $s0, 3816($t2)
sw $s0, 3820($t2)
sw $s0, 3824($t2)
sw $s0, 3828($t2)
sw $s0, 3832($t2)
sw $s0, 3836($t2)
sw $s0, 3840($t2)
sw $s0, 3844($t2)
sw $s0, 3848($t2)
sw $s0, 3852($t2)
sw $s0, 3856($t2)
sw $s0, 3860($t2)
sw $s0, 3864($t2)
sw $s0, 3868($t2)
sw $s0, 3872($t2)
sw $s0, 3876($t2)
sw $s0, 3880($t2)
sw $s0, 3884($t2)
sw $s0, 3888($t2)
sw $s0, 3892($t2)
sw $s0, 3896($t2)
sw $s0, 3900($t2)
sw $s0, 3904($t2)
sw $s0, 3908($t2)
sw $s0, 3912($t2)
sw $s0, 3916($t2)
sw $s0, 3920($t2)
sw $s0, 3924($t2)
sw $s0, 3928($t2)
sw $s0, 3932($t2)
sw $s0, 3936($t2)
sw $s0, 3940($t2)
sw $s0, 3944($t2)
sw $s0, 3948($t2)
sw $s0, 3952($t2)
sw $s0, 3956($t2)
sw $s0, 3960($t2)
sw $s0, 3964($t2)
sw $s0, 3968($t2)
sw $s0, 3972($t2)
sw $s0, 3976($t2)
sw $s0, 3980($t2)
sw $s0, 3984($t2)
sw $s0, 3988($t2)
sw $s0, 3992($t2)
sw $s0, 3996($t2)
sw $s0, 4000($t2)
sw $s0, 4004($t2)
sw $s0, 4008($t2)
sw $s0, 4012($t2)
sw $s0, 4016($t2)
sw $s0, 4020($t2)
sw $s0, 4024($t2)
sw $s0, 4028($t2)
sw $s0, 4032($t2)
sw $s0, 4036($t2)
sw $s0, 4040($t2)
sw $s0, 4044($t2)
sw $s0, 4048($t2)
sw $s0, 4052($t2)
sw $s0, 4056($t2)
sw $s0, 4060($t2)
sw $s0, 4064($t2)
sw $s0, 4068($t2)
sw $s0, 4072($t2)
sw $s0, 4076($t2)
sw $s0, 4080($t2)
sw $s0, 4084($t2)
sw $s0, 4088($t2)
sw $s0, 4092($t2)
sw $s0, 4096($t2)
jr $ra



	
	

	



	
	
	
	
	

	











  	
  	
  	
	
	
	
	
	


	
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	

