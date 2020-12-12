

#Abra o Bitmap Display do Mars para a visualização do jogo
#Configure da seguinte forma:
#	Unit Width/Height in pixels = 16
#	Display Width/Height in Pixels = 512
#	Base address = 0x10000000 (global data)

.data	

.text
	main:
	
		jal cores		#jal chama as funções tendo um link pra retorno
		jal define_fundo
		jal desenha_tabuleiro

	
	cores:
	     addi $s0, $zero, 0xE8E80D #Amarelo
	     addi $s1, $zero, 0x1151EA #Azul
	     addi $s2, $zero, 0x2EBFFF #
	     addi $s3, $zero, 0x6495ED #
	    jr $ra
	
	define_fundo:
	    addi $t1, $zero, 1024	#mapa possui 1024 quadrados
		add $t2, $zero, $t1
		lui $t2, 0x1000		#posição inicial dos dados para serem pintados
		jr $ra
	
	desenha_tabuleiro:
	sw $s0, 0($t2)	#for de 0 ate 128
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
	sw $s0, 128($t2) #for ate aqui
	sw $s1, 132($t2)
	sw $s1, 136($t2)
	sw $s1, 144($t2)
	sw $s1, 148($t2)#
	sw $s1, 156($t2)
	sw $s0, 252($t2)
	sw $s0, 256($t2)
	sw $s1, 260($t2)
	sw $s1, 264($t2)
	sw $s1, 272($t2)
	sw $s1, 276($t2)#
	sw $s0, 380($t2)
	sw $s0, 384($t2)
	sw $s0, 508($t2)
	sw $s0, 512($t2)
	sw $s1, 516($t2)
	sw $s1, 520($t2)
	sw $s0, 636($t2)
	sw $s0, 640($t2)
	sw $s1, 644($t2)
	sw $s1, 648($t2)
	sw $s0, 764($t2)
	sw $s0, 768($t2)
	sw $s0, 892($t2)
	sw $s0, 896($t2)
	sw $s1, 900($t2)
	sw $s1, 904($t2)
	sw $s0, 1020($t2)
	sw $s0, 1024($t2)
	sw $s1, 1028($t2)
	sw $s1, 1032($t2)
	sw $s0, 1148($t2)
	sw $s0, 1152($t2)
	sw $s0, 1276($t2)
	sw $s0, 1280($t2)
	sw $s1, 1284($t2)
	sw $s1, 1288($t2)
	sw $s0, 1404($t2)
	sw $s0, 1408($t2)
	sw $s1, 1412($t2)
	sw $s1, 1416($t2)
	sw $s0, 1532($t2) #for de 1532 ate 2044
	sw $s0, 1536($t2)
	sw $s0, 1660($t2)
	sw $s0, 1664($t2)
	sw $s0, 1788($t2)
	sw $s0, 1792($t2)
	sw $s0, 1916($t2)
	sw $s0, 1920($t2)
	sw $s0, 1924($t2)
	sw $s0, 1928($t2)
	sw $s0, 1932($t2)
	sw $s0, 1936($t2)
	sw $s0, 1940($t2)
	sw $s0, 1944($t2)
	sw $s0, 1948($t2)
	sw $s0, 1952($t2)
	sw $s0, 1956($t2)
	sw $s0, 1960($t2)
	sw $s0, 1964($t2)
	sw $s0, 1968($t2)
	sw $s0, 1972($t2)
	sw $s0, 1976($t2)
	sw $s0, 1980($t2)
	sw $s0, 1984($t2)
	sw $s0, 1988($t2)
	sw $s0, 1992($t2)
	sw $s0, 1996($t2)
	sw $s0, 2000($t2)
	sw $s0, 2004($t2)
	sw $s0, 2008($t2)
	sw $s0, 2012($t2)
	sw $s0, 2016($t2)
	sw $s0, 2020($t2)
	sw $s0, 2024($t2)
	sw $s0, 2028($t2)
	sw $s0, 2032($t2)
	sw $s0, 2036($t2)
	sw $s0, 2040($t2)
	sw $s0, 2044($t2)
	jr $ra 