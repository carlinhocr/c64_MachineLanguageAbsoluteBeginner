; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00
*=$0900

;set the F1 key to print the word LIST+<RETURN> when pressed

;initialization routine
        
        ;set up in memory the string LIST + RETURN and a zero signifying end of string
        LDA #$4C
        STA $CFF0
        LDA #$49
        STA $CFF1
        LDA #$53
        STA $CFF2
        LDA #$54
        STA $CFF3
        LDA #$0d
        STA $CFF4
        LDA #$00
        STA $CFF5
        ;turn off the interrupts by setting the interrupt flag
        ;this must be donde before changing the interrupt vector
        SEI
        ;change the interrupt vector to point to part two of the program
        ;it will start in location 0950 as specified
        LDA#$50
        STA $0314
        LDA#$09
        STA $0315
        ;renable interrupts and end routine
        CLI
        RTS
;scan the keyboard 50 times a second for F1 pressed if pressed
;print LIST+<RETURN>

*=$0950
        ;jump to the kernel keyboard scan routine, returns with any key pressed
        ;in the input buffer at $277 onwards
        JSR $FF9F
        ;load X with the lenght of the input buffer
        ;pointer to the next empty space in the buffer
