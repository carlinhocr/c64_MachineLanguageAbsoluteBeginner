; 10 SYS (2304)
WATCH $0334
WATCH $0335
WATCH $0336
WATCH $0337
WATCH $0338

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 
        LDA #$08
        CLC             ;clearing the carry in substraction will give us the wrong answer
        SBC #$05        ;as the carry is zero iw wrongly substracts 8 -5 -1 = 2
        STA $0334

;lets do it right by setting the carry to 1

        LDA #$08
        SEC             ;setting the carry bit
        SBC #$05        ;as the carry is one it does  8 -5 -0 = 3
        STA $0335

        RTS