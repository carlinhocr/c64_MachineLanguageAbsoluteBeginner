WATCH $0334
WATCH $0335
WATCH $0336

*=900
;multiply two bytes by 4
                        ;Carry 0
        LDA #$17        ;00010111
        STA $0335       ;00010111
        LDA #$0A        ;00001010
        ASL A           ;00010100
                        ;Carry 0
        ROL $0335       ;00101110
        ;170A x2 = 00101110 00010100
        ASL A           ;00101000
                        ;Carry 0
        ROL $0335       ;01011100 5C
        ;170A x4 = 01011100 00101000 5C28
        STA $0334       ;28
        RTS