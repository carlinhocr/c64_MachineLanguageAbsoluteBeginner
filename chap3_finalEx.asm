; 10 SYS (2304)
WATCH $0334

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 
        LDA #$01
        STA $0334       ;load 01 in position $0334
        LDA #$37        ;load the literal 37
        CLC             ;clear the carry flag
        ADC $0334       ;add 37 to what ever is in memory position 0334
        STA $0334