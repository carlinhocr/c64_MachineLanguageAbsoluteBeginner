
WATCH $0334
WATCH $0335
WATCH $0336

*=$0900

;test the AND, ORA, EOR instructions

        LDA #$CA        ;     1100 1010 TO THE ACCUMULATOR
        AND #$9F        ; AND 1001 1111
                        ;----------------
        STA $0334       ;     1000 1010         8A

        LDA #$A2        ;     1010 0010 TO THE ACCUMULATOR
        ORA #$84        ; OR  1000 0100
                        ;----------------
        STA $0335       ;     1010 0110         A6

        EOR $0334       ;     1010 0010 FROM THE ACCUMULATOR
                        ;     1000 0110
                        ;----------------
        STA $0336       ;     0010 1100         2C
        RTS


