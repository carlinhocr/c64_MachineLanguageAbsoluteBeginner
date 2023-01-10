; 10 SYS (2304)
WATCH $0334
WATCH $0335
WATCH $0336

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 

; MULTIPLY 7 X 3 

        LDA #$03
        STA $0334
        LDA #$00
        STA $0335
        STA $0336
loop    CLC
        LDA $0335
        ADC #$07
        STA $0335
        INC $0336
        LDA $0336
        CMP $0334
        BNE loop
        RTS
