; 10 SYS (2304)
WATCH $0334
;*=$0801
;
;        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 
;store all the numbers less than 38

;fill memory to find less than 38 and more than 38

        LDA #$5
        STA $F000
        STA $F002
        STA $F005
        STA $F006
        STA $F009
        
        LDA #$39
        STA $F001
        STA $F004
        STA $F008
        STA $F00C
        STA $F00A

; initialize counters

        LDX #$00
        LDY #$FF

;start searching and storing

searching
        INY     ;because it was FF itgoes to 00 the first time it is run
        LDA $F000,y     ;read from here
        CMP #$38
        BCS getanotherYposition ; the CMP operation sets the carry flag to 1 if A >=
        

        STA $C200,x     ;store at the address the less than 38 number
        INX
        
getanotherYposition

        CPY #$FF        ;check if we have compare 255 memory addresses
        BNE searching
        STX $0334       ;store amount of occurences of numbers < 38
        RTS




