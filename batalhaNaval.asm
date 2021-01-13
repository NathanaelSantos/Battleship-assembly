

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
		
	cor_destroyers:
	     addi $s1, $zero, 0x808080 #Cinza
	     jr $ra
		
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
	
	addi $s0, $zero, 0x006400 #Azul	
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
	
	addi $s0, $zero, 0xFFFF00 #Amarelo	
	
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
	
	sw $s1, 1520($t2)
	sw $s1, 1524($t2)
	
	sw $s1, 1668($t2)
sw $s1, 1672($t2)
sw $s1, 1680($t2)
sw $s1, 1684($t2)
sw $s1, 1692($t2)
sw $s1, 1696($t2)
sw $s1, 1704($t2)
sw $s1, 1708($t2)
sw $s1, 1716($t2)
sw $s1, 1720($t2)
sw $s1, 1728($t2)
sw $s1, 1732($t2)
sw $s1, 1740($t2)
sw $s1, 1744($t2)
sw $s1, 1752($t2)
sw $s1, 1756($t2)
sw $s1, 1764($t2)
sw $s1, 1768($t2)
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

sw $s1, 2052($t2)
sw $s1, 2056($t2)
sw $s1, 2064($t2)
sw $s1, 2068($t2)
sw $s1, 2076($t2)
sw $s1, 2080($t2)
sw $s1, 2088($t2)
sw $s1, 2092($t2)
sw $s1, 2100($t2)
sw $s1, 2104($t2)
sw $s1, 2112($t2)
sw $s1, 2116($t2)
sw $s1, 2124($t2)
sw $s1, 2128($t2)
sw $s1, 2136($t2)
sw $s1, 2140($t2)
sw $s1, 2148($t2)
sw $s1, 2152($t2)
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
sw $s1, 2436($t2)
sw $s1, 2440($t2)
sw $s1, 2448($t2)
sw $s1, 2452($t2)
sw $s1, 2460($t2)
sw $s1, 2464($t2)
sw $s1, 2472($t2)
sw $s1, 2476($t2)
sw $s1, 2484($t2)
sw $s1, 2488($t2)
sw $s1, 2496($t2)
sw $s1, 2500($t2)
sw $s1, 2508($t2)
sw $s1, 2512($t2)
sw $s1, 2520($t2)
sw $s1, 2524($t2)
sw $s1, 2532($t2)
sw $s1, 2536($t2)
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
sw $s1, 2820($t2)
sw $s1, 2824($t2)
sw $s1, 2832($t2)
sw $s1, 2836($t2)
sw $s1, 2844($t2)
sw $s1, 2848($t2)
sw $s1, 2856($t2)
sw $s1, 2860($t2)
sw $s1, 2868($t2)
sw $s1, 2872($t2)
sw $s1, 2880($t2)
sw $s1, 2884($t2)
sw $s1, 2892($t2)
sw $s1, 2896($t2)
sw $s1, 2904($t2)
sw $s1, 2908($t2)
sw $s1, 2916($t2)
sw $s1, 2920($t2)
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
sw $s1, 3204($t2)
sw $s1, 3208($t2)
sw $s1, 3216($t2)
sw $s1, 3220($t2)
sw $s1, 3228($t2)
sw $s1, 3232($t2)
sw $s1, 3240($t2)
sw $s1, 3244($t2)
sw $s1, 3252($t2)
sw $s1, 3256($t2)
sw $s1, 3264($t2)
sw $s1, 3268($t2)
sw $s1, 3276($t2)
sw $s1, 3280($t2)
sw $s1, 3288($t2)
sw $s1, 3292($t2)
sw $s1, 3300($t2)
sw $s1, 3304($t2)
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
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3596($t2)
sw $s0, 3600($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3604($t2)
sw $s0, 3608($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3612($t2)
sw $s0, 3616($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3620($t2)
sw $s0, 3624($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3628($t2)
sw $s0, 3632($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3636($t2)
sw $s0, 3640($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3644($t2)
sw $s0, 3648($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3652($t2)
sw $s0, 3656($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3660($t2)
sw $s0, 3664($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3668($t2)
sw $s0, 3672($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3676($t2)
sw $s0, 3680($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3684($t2)
sw $s0, 3688($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3692($t2)
sw $s0, 3696($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3700($t2)
sw $s0, 3704($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3708($t2)
sw $s0, 3712($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3716($t2)
sw $s0, 3720($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3724($t2)
sw $s0, 3728($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3732($t2)
sw $s0, 3736($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3740($t2)
sw $s0, 3744($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3748($t2)
sw $s0, 3752($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3756($t2)
sw $s0, 3760($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3764($t2)
sw $s0, 3768($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3772($t2)
sw $s0, 3776($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3780($t2)
sw $s0, 3784($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3788($t2)
sw $s0, 3792($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3796($t2)
sw $s0, 3800($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3804($t2)
sw $s0, 3808($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3812($t2)
sw $s0, 3816($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3820($t2)
sw $s0, 3824($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3828($t2)
sw $s0, 3832($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3836($t2)
sw $s0, 3840($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3844($t2)
sw $s0, 3848($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3852($t2)
sw $s0, 3856($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3860($t2)
sw $s0, 3864($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3868($t2)
sw $s0, 3872($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3876($t2)
sw $s0, 3880($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3884($t2)
sw $s0, 3888($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3892($t2)
sw $s0, 3896($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3900($t2)
sw $s0, 3904($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3908($t2)
sw $s0, 3912($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3916($t2)
sw $s0, 3920($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3924($t2)
sw $s0, 3928($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3932($t2)
sw $s0, 3936($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3940($t2)
sw $s0, 3944($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3948($t2)
sw $s0, 3952($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3956($t2)
sw $s0, 3960($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3964($t2)
sw $s0, 3968($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3972($t2)
sw $s0, 3976($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3980($t2)
sw $s0, 3984($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3988($t2)
sw $s0, 3992($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 3996($t2)
sw $s0, 4000($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4004($t2)
sw $s0, 4008($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4012($t2)
sw $s0, 4016($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4020($t2)
sw $s0, 4024($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4028($t2)
sw $s0, 4032($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4036($t2)
sw $s0, 4040($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4044($t2)
sw $s0, 4048($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4052($t2)
sw $s0, 4056($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4060($t2)
sw $s0, 4064($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4068($t2)
sw $s0, 4072($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4076($t2)
sw $s0, 4080($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4084($t2)
sw $s0, 4088($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4092($t2)
sw $s0, 4096($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4100($t2)
sw $s0, 4104($t2)
addi $s0, $zero, 0xFFFF00 #Amarela
sw $s0, 4108($t2)
sw $s0, 4112($t2)






  	
  	
  	
	
	
	
	
	


	
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
