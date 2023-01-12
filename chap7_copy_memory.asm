; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 

;fill line six with the letter A

        LDX #$00
        LDA #$01   
loop1   STA $04C8,X     ;fill line six with the letter A
        INX
        CPX #$28        ;28 hexa is 40 decimal the lenght of the columns
        BNE loop1

;copy memory the 6th line to the 7th line of the screen     
        LDX #$00        
LOOP2   LDA $04C8,X     ;load to the accumulator whatever is on the screen 
                        ;(memory position 04C8 + 0) 
        STA $04F0,X     ;STORE TO SCREEN MEMORY whatever is on the screen 
                        ;(memory position 04F0 + 0)        
        INX
        CPX #$28
        BNE LOOP2
        RTS