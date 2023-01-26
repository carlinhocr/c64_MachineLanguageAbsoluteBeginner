WATCH $0334
WATCH $0335
WATCH $0336

*=900
;multiply two bytes by 4
                        ;Carry 0
        LDA #$17        ;00010111
        STA $0335       ;00010111
        LDA #$A0        ;10100000
        ASL A           ;01000000
                        ;Carry 1
        ROL $0335       ;00101111 (the last one come from the carry bit)
        ;17A0 x2 = 00101111 0100000
        ASL A           ;10000000
                        ;Carry 0
        ROL $0335       ;010111110 5E
        ;17A0 x4 = 01011110 10000000 5E80
        STA $0334       ;80
        RTS