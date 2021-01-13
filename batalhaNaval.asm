

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
	     addi $s1, $zero, 0x0000b3 #Azul
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
	sw $s1, 160($t2)
	
	sw $s1, 168($t2)
	sw $s1, 172($t2)
	
	sw $s1, 180($t2)
	sw $s1, 184($t2)
	
	sw $s1, 192($t2)
	sw $s1, 196($t2)
	
	sw $s1, 204($t2)
	sw $s1, 208($t2)
	
	sw $s1, 216($t2)
	sw $s1, 220($t2)
		
	sw $s1, 228($t2)
	sw $s1, 232($t2)
	
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
	
	sw $s1, 528($t2)
	sw $s1, 532($t2)
	
	sw $s1, 540($t2)
	sw $s1, 544($t2)
	
	sw $s1, 552($t2)
	sw $s1, 556($t2)
	
	sw $s1, 564($t2)
	sw $s1, 568($t2)
	
	sw $s1, 576($t2)
	sw $s1, 580($t2)
	
	sw $s1, 588($t2)
	sw $s1, 592($t2)
	
	sw $s1, 600($t2)
	sw $s1, 604($t2)
	
	sw $s1, 612($t2)
	sw $s1, 616($t2)
	
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
	
	sw $s1, 900($t2)
	sw $s1, 904($t2)
	
	sw $s1, 912($t2)
	sw $s1, 916($t2)
	
	sw $s1, 924($t2)
	sw $s1, 928($t2)
	
	sw $s1, 936($t2)
	sw $s1, 940($t2)
	
	sw $s1, 948($t2)
	sw $s1, 952($t2)
	
	sw $s1, 960($t2)
	sw $s1, 964($t2)
	
	sw $s1, 972($t2)
	sw $s1, 976($t2)
	
	sw $s1, 984($t2)
	sw $s1, 988($t2)
	
	sw $s1, 996($t2)
	sw $s1, 1000($t2)
	
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
	
	sw $s1, 1284($t2)
	sw $s1, 1288($t2)
	
	sw $s1, 1296($t2)
	sw $s1, 1300($t2)
	
	sw $s1, 1308($t2)
	sw $s1, 1312($t2)
	
	sw $s1, 1320($t2)
	sw $s1, 1324($t2)
	
	sw $s1, 1332($t2)
	sw $s1, 1336($t2)
	
	sw $s1, 1344($t2)
	sw $s1, 1348($t2)
	
	sw $s1, 1356($t2)
	sw $s1, 1360($t2)
	
	sw $s1, 1368($t2)
	sw $s1, 1372($t2)
	
	sw $s1, 1380($t2)
	sw $s1, 1384($t2)
	
	sw $s1, 1392($t2)
	sw $s1, 1396($t2)


	
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	

