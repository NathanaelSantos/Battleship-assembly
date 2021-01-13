

#Abra o Bitmap Display do Mars para a visualização do jogo
#Configure da seguinte forma:
#	Unit Width/Height in pixels = 16
#	Display Width/Height in Pixels = 512
#	Base address = 0x10000000 (global data)

.data	

.text
	main:	
		jal cores
		jal define_fundo
		jal desenha_tabuleiro
		
	cores:
	     addi $s1, $zero, 0xa0a0a0 #Cinza claro
	    jr $ra
	
	define_fundo:
	    addi $t1, $zero, 1024	#mapa possui 1024 quadrados
		add $t2, $zero, $t1
		lui $t2, 0x1000		#posição inicial dos dados para serem pintados
		jr $ra
		
		
	desenha_tabuleiro:
	
	#Cores de cordenadas verticais
	addi $s0, $zero, 0xFF00F3 #Rosa
	sw $s0, 4($t2)
	sw $s0, 8($t2)		
	
	addi $s0, $zero, 0xFF0000 #Vermelha	
	sw $s0, 16($t2)
	sw $s0, 20($t2)	
	
	addi $s0, $zero, 0xFFFF00 #Amarela	
	sw $s0, 28($t2)
	sw $s0, 32($t2)
	
	addi $s0, $zero, 0x03FF00 #Verde	
	sw $s0, 40($t2)
	sw $s0, 44($t2)
	
	addi $s0, $zero, 0x0000b3 #Azul	
	sw $s0, 52($t2)
	sw $s0, 56($t2)
	
	addi $s0, $zero, 0xFF8E00 #Laranja claro
	sw $s0, 64($t2)
	sw $s0, 68($t2)
	
	addi $s0, $zero, 0xFF5500 #Laranja escuro
	sw $s0, 76($t2)
	sw $s0, 80($t2)
	
	addi $s0, $zero, 0x00D7FF #Azul claro
	sw $s0, 88($t2)
	sw $s0, 92($t2)
	
	addi $s0, $zero, 0x9F00C5 #P�rpura
	sw $s0, 100($t2)
	sw $s0, 104($t2)
	
	addi $s0, $zero, 0xFFFFFF #Branca
	sw $s0, 112($t2)
	sw $s0, 116($t2)
	
	#Cores de cordenadas horizontais
	addi $s0, $zero, 0xFFFFFF #Branca
	sw $s0, 128($t2)
	sw $s0, 256($t2)
	
	addi $s0, $zero, 0x9F00C5 #P�rpura
	sw $s0, 512($t2)
	sw $s0, 640($t2)
	
	
	addi $s0, $zero, 0x00D7FF #Azul claro
	sw $s0, 896($t2)
	sw $s0, 1024($t2)
	
	addi $s0, $zero, 0xFF5500 #Laranja escuro
	sw $s0, 1280($t2)
	sw $s0, 1408($t2)
	
	addi $s0, $zero, 0xFF8E00 #Laranja claro
	sw $s0, 1664($t2)
	sw $s0, 1792($t2)
	
	addi $s0, $zero, 0xFF00F3 #Rosa
	sw $s0, 2048($t2)
	sw $s0, 2176($t2)	
	
	addi $s0, $zero, 0xFF0000 #Vermelha
	sw $s0, 2432($t2)	
	sw $s0, 2560($t2)
		
	addi $s0, $zero, 0xFFFF00 #Amarela	
	sw $s0, 2816($t2)
	sw $s0, 2944($t2)
	
	addi $s0, $zero, 0x03FF00 #Verde
        sw $s0, 3200($t2)
	sw $s0, 3328($t2)
	
	addi $s0, $zero, 0x0000b3 #Azul	
	sw $s0, 3584($t2)
	sw $s0, 3712($t2)
	
	sw $s1, 132($t2)
	sw $s1, 136($t2)
	sw $s1, 144($t2)
	sw $s1, 148($t2)
	sw $s1, 156($t2)
	sw $s1, 260($t2)
	sw $s1, 264($t2)
	sw $s1, 272($t2)
	sw $s1, 276($t2)
	sw $s1, 516($t2)
	sw $s1, 520($t2)
	sw $s1, 644($t2)
	sw $s1, 648($t2)
	sw $s1, 900($t2)
	sw $s1, 904($t2)
	sw $s1, 1028($t2)
	sw $s1, 1032($t2)
	sw $s1, 1284($t2)
	sw $s1, 1288($t2)
	sw $s1, 1412($t2)
	sw $s1, 1416($t2)
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	

