; 10 SYS (2304)
WATCH $0334
WATCH $0335
WATCH $0336

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$900 
        LDA #$03        ;load the literal "#", hex number"$" 03 to the accumulator
        CLC             ; clear the carry flag
        ADC #$05        ;add with carry to the acumulator the literal value 05
        STA $0334       ;store the result in memory position 0334 hexa

;prepate to print the value of sum (does not work on the debugger)

;        LDA #$00        ;load the high byte as $BDCD only prints two bytes
;        LDX $0334       ;store the x register with the past result
;        JSR $BDCD       ;print the accumulator as the high byte and the x register as the low byte

;add two numbers that produce a carry

        LDA #$27        
        CLC             
        ADC #$F4         
        STA $0335          

;force a carry and see the result on the next sum

        LDA #$03        
        SEC ; set carry flag             
        ADC #$05         
        STA $0336
        RTS        


