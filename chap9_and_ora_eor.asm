; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00
*=$0900

;test the AND, ORA, EOR instructions

        LDA #$CA        ;1100 1010 TO THE ACCUMULATOR
        AND #$9F        ; AND 1100 1010
                        ;     1001 1111
                        ;----------------
        STA $0334       ;     1000 1010