; 10 SYS (2304)
WATCH $0334
*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 
;store all the numbers less than 38

;fill memory to find less than 38

        LDA #$32
        STA $F001
        STA $F004
        STA $F008
        STA $F00C
        STA $F00A

; initialize counters

        LDX #$00
        LDY #$FF

;start searching and storing

        INY     ;because it was FF itgoes to 00 the first time it is run
        LDA $F000,y     ;read from here
        CMP #$38
        BCS notlessthan38 ; the CMP operation sets the carry flag to 1 if A >=
        
        