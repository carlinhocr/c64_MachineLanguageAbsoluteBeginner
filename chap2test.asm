; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28, $32 
        BYTE    $33, $30, $34, $29, $00, $00, $00


*=$0900
        lda #1 ; inmediate addressing loading number 1
        sta 2048 
        lda 5 ; zero page addressing with memory address 5
        sta 2049
        lda 2050 ;absolute addressing with memory address 2049
        sta 2051 
        rts