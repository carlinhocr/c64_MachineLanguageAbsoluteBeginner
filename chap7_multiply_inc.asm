; 10 SYS (2304)
WATCH $0334

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 

; MULTIPLY 7 X 3 

        LDA #$03
        STA $0334
        LDA #$00
loop    CLC
        ADC #$07
        DEC $334
        BNE loop
        RTS
