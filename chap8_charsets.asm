; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00
*=$0900

;copy charecter sets to $CE00 and $CF00

        LDA #$FE
        AND $DC0E       ; Timer A control Register Memory Address
        STA $DC0E
        LDA #$FB
        AND $01         ;Processor Port Memory Bits
        STA $01         ;set the %0xx: Character ROM visible at $D000-$DFFF. 
        LDX #$00        ;set the counter X at zero

LOADMORECHARS
        LDA $D000,x     ;load the accumulator the character of the character set 1 indexed by X
        STA $CF00,x     ;store in memory the character of the character set 1 indexed by X
        LDA $D800,x     ;load the accumulator the character of the character set 2 indexed by X
        STA $CE00,x     ;store in memory the character of the character set 2 indexed by X 
        INX             ; increment the index
        BNE LOADMORECHARS ;branch if X <> 0 so it will repeat 255 times

        LDA #$04
        ORA $01
        STA $01
        LDA #$01
        ORA $DC0E
        STA $DC0E
;look up a list of letters to print


        RTS