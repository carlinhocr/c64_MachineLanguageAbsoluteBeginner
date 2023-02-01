5 REM ** TUNE **
10 CHIP=54272 : C=CHIP : REM STARTING MEMORY ADDRESS OF SOUNF CHIP REGISTERS
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
310 DATA 4820,8,6420,8,6420,12,6068,4,6420,8,8100,8,8100,8,7220,8,9637,8
320 DATA 9637,8,9637,12,8581,4,8100,8,7220,8,8100,16,4820,8,6420,8,6420,12
330 DATA 6068,4,6420,8,8100,8,8100,8,7220,8,9637,8,7220,12,6068,4
340 DATA 6068,8,5396,8,4820,16
350 DATA -1,-1,-1