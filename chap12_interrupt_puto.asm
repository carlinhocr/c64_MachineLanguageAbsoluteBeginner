; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00
*=$0900

;set the F1 key to print the word LIST+<RETURN> when pressed

;initialization routine
        
        ;set up in memory the string LIST + RETURN and a zero signifying end of string
        LDA #$50       
        STA $CFF0
        LDA #$55      
        STA $CFF1
        LDA #$54
        STA $CFF2
        LDA #$4F
        STA $CFF3
        LDA #$00
        STA $CFF4
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
        LDX $C6
        ;if buffer empty, so no key pressed return
        BEQ ENDPRG
        ;point the pointer to the previous entry in the buffer
        DEX
        ;load the previous character if it is not F1 then return
        LDA $0277,X
        CMP #$86 ;F3
        BNE ENDPRG
        ;as F1 was pressend put the string LIST+<RETURN> 
        ;on the keyboard buffer
        LDY #$FF ; so that when Y is incremented the first time it starts at zero
LOADKEYS
        INY
        INX
        LDA $CFF0,Y
        STA $0277,X
        BNE LOADKEYS ; our last character is zero if we do not ereache it then keep loading characters
        ;save the new poiter to the buffer lenght
        STX $C6
        

ENDPRG
        ;returns via rom interrupt handler
        JMP $EA31
        
