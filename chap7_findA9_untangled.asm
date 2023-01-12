; 10 SYS (2304)
WATCH $0334
*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 

;find up to four occurences of A9 but better written program
;fill memory to find A9 easily

        LDA #$A9
        STA $F001
        STA $F004
        STA $F008
        STA $F00C

;start program

        LDX #$00
        LDY #$00
        LDA #$A9        ;what to find
COMPARE
        INY     ;MOVE TO THE NEXT MEMORY POSITION
        BEQ ENDBYEXHAUSTION       ;BRANCH IF ALL 255 POSITIONS HAVE BEEN SEARCHED
        CMP $EFFF,Y ; because Y starts in 0 because of INY y make $EFFF + 1 = $F000
        BNE COMPARE     ;IF Y <> 0 BRANCH TO COMPARE Y KEEPS INCREMNTING WHEN Y=255+1 =0 AND IT STOPS BRANCHING
        INX             ;ADD ONE TO X AS AN A9 WAS FOUND
        CPX #$04        ;COMPARE TO 4 TIMES X REGISTER
        BNE COMPARE     ;IF Y <> 0 BRANCH TO COMPARE Y KEEPS INCREMNTING WHEN Y=255+1 =0 AND IT STOPS BRANCHING
ENDBYEXHAUSTION
        STX $0334       ;STORE THE AMOUNT OF TIMES A9 WAS FOUND VIA THE X REGISTER


        RTS             ;END THE PROGRAM




         