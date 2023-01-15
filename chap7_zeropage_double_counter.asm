; 10 SYS (2304)
WATCH $0334
;*=$0801
;
;        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 
;store all the numbers less than 38 but use ZERO PAGE with the X as index

;fill memory to find less than 38 and more than 38

        LDA #$5
        STA $00
        STA $02
        STA $05
        STA $06
        STA $09
        
        LDA #$39
        STA $F001
        STA $F004
        STA $F008
        STA $F00C
        STA $F00A

; initialize counters

        LDY #$00
        LDX #$FF

;start searching and storing

searching
        INX     ;because it was FF itgoes to 00 the first time it is run
        LDA $00,x     ;read from here
        CMP #$38
        BCS getanotherYposition ; the CMP operation sets the carry flag to 1 if A >=
        

        STA $C200,y     ;store at the address the less than 38 number
        INY
        
getanotherYposition

        CPX #$FF        ;check if we have compare 255 memory addresses
        BNE searching
        STY $0334       ;store amount of occurences of numbers < 38
        RTS




