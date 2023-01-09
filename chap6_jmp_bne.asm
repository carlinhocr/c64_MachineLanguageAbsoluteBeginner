; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 
; create a sprite   

        LDA #$01
        STA $D015
        STA $D027
        STA $2040
        LDA #$32
        STA $D000
        STA $D001

;move the sprite
        LDA $D000
REPITO  ADC #$01
        STA $D000
        CMP #$64
        BNE REPITO ; if less thatn 64 just repeat the loop

FIN     RTS