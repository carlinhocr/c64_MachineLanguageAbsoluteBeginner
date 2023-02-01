5 REM ** TUNE **
6 CONSTNOTE = 17.02841924
8 A=440.0 * CONSTNOTE : ASOS = 466,2*CONSTNOTE : G = 784 * 784,0*CONSTNOTE
9 B= 49.0 *CONSTNOTE : Cnote = 532,3 * CONSTNOTE
!-=============
!-2 (B)   493,9
!-3 (C)   523,3
!-4 (C#)  554,4
!-5 (D)   587,3
!-6 (D#)  622,3
!-7 (E)   659,3
!-8 (F)   698,5
!-9 (F#)  740,0
!-10 (G)  784,0
!-11 (G#) 830,6
!-12 (A)  880,0
!-=============
10 CHIP=54272 : C=CHIP :REM STARTING MEMORY ADDRESS OF SOUNF CHIP REGISTERS
11 REM NL = LOW BYTE OF NOTE FREQUENCY, NH = HIGH BYTE OF NOTE FREQUENCY
12 REM W = WAVEFORM CONTROL, AD = ATTACK DECAY, SR = SUSTAIN/RELEASE
20 NL(0)=C+0 : NH(0)=C+1 : W(0) =C+4 : AD(0)=C+5 : SR(0)=C+6 : VOLUME = C+24
29 REM INITIALIZE REGISTER ON ZEERO
30 FOR REG = CHIP TO CHIP+24 : POKE REG,0 : NEXT
40 POKE AD(0),64+9 : POKE SR(0),240+0
50 POKE VOLUME,15
60 READ F,DUR : IF F<0 THEN POKE W(0),0 : END 
65 DUR = DUR *20
70 NH(1)=INT(F/256):NL(1)=F-NH(1)*256: POKE NH(0),NH(1) : POKE NL(0),NL(1)
80 POKE W(0),32+1 : REM ADD 1 FOR GATE
90 FOR COUNT = 1 TO DUR : NEXT COUNT : REM TIME WAITING LOOP
100 POKE W(0),32 : REM TURN OFF GATE
110 FOR PAUSE = 1 TO 50 : NEXT :REM WAITS
120 GOTO 60

310 REM 310 DATA g,8,g,8,a,8,g,8,c,8,b,8
320 DATA 9637,8,9637,12,8581,4,8100,8,7220,8,8100,16,4820,8,6420,8,6420,12
330 DATA 6068,4,6420,8,8100,8,8100,8,7220,8,9637,8,7220,12,6068,4
340 DATA 6068,8,5396,8,4820,16
350 DATA -1,-1,-1







!-==========================================================================
!-FreqTableNtscLo:
!-                ;      C   C#  D   D#  E   F   F#  G   G#  A   A#  B
!-                .byte $0c,$1c,$2d,$3f,$52,$66,$7b,$92,$aa,$c3,$de,$fa  ; 1
!-                .byte $18,$38,$5a,$7e,$a4,$cc,$f7,$24,$54,$86,$bc,$f5  ; 2
!-                .byte $31,$71,$b5,$fc,$48,$98,$ee,$48,$a9,$0d,$79,$ea  ; 3
!-                .byte $62,$e2,$6a,$f8,$90,$30,$dc,$90,$52,$1a,$f2,$d4  ; 4
!-                .byte $c4,$c4,$d4,$f0,$20,$60,$b8,$20,$a4,$34,$e4,$a8  ; 5
!-                .byte $88,$88,$a8,$e0,$40,$c0,$70,$40,$48,$68,$c8,$50  ; 6
!-                .byte $10,$10,$50,$c0,$80,$80,$e0,$80,$90,$d0,$90,$a0  ; 7
!-                .byte $20,$20,$a0,$80,$00,$00,$c0,$00,$20,$a0,$20,$40  ; 8
!-     
!-FreqTableNtscHi:
!-                ;      C   C#  D   D#  E   F   F#  G   G#  A   A#  B
!-                .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01  ; 1
!-                .byte $02,$02,$02,$02,$02,$02,$02,$03,$03,$03,$03,$03  ; 2
!-                .byte $04,$04,$04,$04,$05,$05,$05,$06,$06,$07,$07,$07  ; 3
!-                .byte $08,$08,$09,$09,$0a,$0b,$0b,$0c,$0d,$0e,$0e,$0f  ; 4
!-                .byte $10,$11,$12,$13,$15,$16,$17,$19,$1a,$1c,$1d,$1f  ; 5
!-                .byte $21,$23,$25,$27,$2a,$2c,$2f,$32,$35,$38,$3b,$3f  ; 6
!-                .byte $43,$47,$4b,$4f,$54,$59,$5e,$64,$6a,$70,$77,$7e  ; 7
!-                .byte $86,$8e,$96,$9f,$a9,$b3,$bd,$c9,$d5,$e1,$ef,$fd  ; 8
!-==========================================================================