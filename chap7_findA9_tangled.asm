; 10 SYS (2304)
WATCH $0334
*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 

;find up to four occurences of A9
;fill memory to find A9 easily

        LDA #$A9
        STA $F001
        STA $F004
        STA $F008
        STA $F00C

        LDX #$00
        LDY #$00
        LDA #$A9        ;what to find
COMPARE
        CMP $F000,Y     ;compare the accumulator with A9 to the memory position
        BEQ FOUND       ;BRANCH IF FOUND

INCREMENTY
        INY             ;MOVE TO THE NEXT MEMORY POSITION
        BNE COMPARE     ;IF Y <> 0 BRANCH TO COMPARE Y KEEPS INCREMNTING WHEN Y=255+1 =0 AND IT STOPS BRANCHING
        STX $0334       ;STORE THE AMOUNT OF TIMES A9 WAS FOUND VIA THE X REGISTER
        RTS             ;END THE PROGRAM BY GOING THORUGH 255 MEMORY POSITIONS
FOUND
        INX             ;ADD ONE TO X AS AN A9 WAS FOUND
        CPX #$04        ;COMPARE TO 4 TIMES X REGISTER
        BNE INCREMENTY  ;IF IT WAS NOT FOUND 4 TIMES BRANCH 
        STX $0334       ;STORE THE AMOUNT OF TIMES A9 WAS FOUND VIA THE X REGISTER
        RTS             ;END THE PROGRAM BY FINDING 4 TIMES




         