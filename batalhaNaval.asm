

#Abra o Bitmap Display do Mars para a visualização do jogo
#Configure da seguinte forma:
#	Unit Width/Height in pixels = 16
#	Display Width/Height in Pixels = 512
#	Base address = 0x10000000 (global data)

.data	

.text
	main:			
		jal define_fundo
		jal desenha_tabuleiro
	
	define_fundo:
	    addi $t1, $zero, 1024	#mapa possui 1024 quadrados
		add $t2, $zero, $t1
		lui $t2, 0x1000		#posição inicial dos dados para serem pintados
		jr $ra
	
	desenha_tabuleiro:
	
	#Cores de cordenadas verticais
	addi $s0, $zero, 0xFF00F3 #Rosa
	sw $s0, 4($t2)	
	
	addi $s0, $zero, 0xFF0000 #Vermelha	
	sw $s0, 16($t2)	
	
	addi $s0, $zero, 0xFFFF00 #Amarela	
	sw $s0, 28($t2)
	
	addi $s0, $zero, 0x03FF00 #Verde	
	sw $s0, 40($t2)
	
	addi $s0, $zero, 0x000BFF #Azul	
	sw $s0, 52($t2)
	
	addi $s0, $zero, 0xFF8E00 #Laranja claro
	sw $s0, 64($t2)
	
	addi $s0, $zero, 0xFF5500 #Laranja escuro
	sw $s0, 76($t2)
	
	addi $s0, $zero, 0x00D7FF #Azul claro
	sw $s0, 88($t2)
	
	addi $s0, $zero, 0x9F00C5 #P�rpura
	sw $s0, 100($t2)
	
	addi $s0, $zero, 0xFFFFFF #Branca
	sw $s0, 112($t2)
	
	#Cores de cordenadas horizontais
	addi $s0, $zero, 0xFFFFFF #Branca
	sw $s0, 256($t2)
	
	addi $s0, $zero, 0x9F00C5 #P�rpura
	sw $s0, 640($t2)
	
	addi $s0, $zero, 0x00D7FF #Azul claro
	sw $s0, 1024($t2)
	
	addi $s0, $zero, 0xFF5500 #Laranja escuro
	sw $s0, 1408($t2)
	
	addi $s0, $zero, 0xFF8E00 #Laranja claro
	sw $s0, 1792($t2)
	
	addi $s0, $zero, 0xFF00F3 #Rosa
	sw $s0, 2176($t2)	
	
	addi $s0, $zero, 0xFF0000 #Vermelha	
	sw $s0, 2560($t2)	
	
	addi $s0, $zero, 0xFFFF00 #Amarela	
	sw $s0, 2944($t2)
	
	addi $s0, $zero, 0x03FF00 #Verde	
	sw $s0, 3328($t2)
	
	addi $s0, $zero, 0x000BFF #Azul	
	sw $s0, 3712($t2)
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	

