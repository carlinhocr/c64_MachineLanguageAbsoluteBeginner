; 10 SYS (2304)
WATCH A
WATCH B

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 
; DEFINE VARIABLES
A = $0334
B = $0335

; MULTIPLY 7 X 3 

        LDA #$00
        STA A
        LDA #$03
        STA B
loop    LDA A
        CLC
        ADC #$07
        STA A
        LDA B
        SEC
        SBC #$01
        STA B
        BNE loop
        RTS
