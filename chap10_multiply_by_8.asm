WATCH $0334
WATCH $0335
WATCH $0336

*=900
;multiply using bit rotation by 8

        LDA #$0A        ;00001010
        ASL A           ;00010100
        ASL A           ;00101000
        ASL A           ;01010000
        STA $0334
        RTS