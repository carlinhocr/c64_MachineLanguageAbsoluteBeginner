; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00



*=$900
START_SCREEN = $0400 ;first position of screen memory 1024, top right
        lda #8 ;screen display code for H
        sta START_SCREEN ;first position of screen memory 1024, top right
        lda #5 ;screen display code for E
        sta START_SCREEN+1
        lda #12 ; screen display code for L
        sta START_SCREEN+2 ; print L once
        sta START_SCREEN+3 ; print L twice
        lda #15 ; screen display code for O
        sta START_SCREEN+4 ; print O once
        rts