WATCH $0334
WATCH $0335
WATCH $0336

*=900
;multiply using bit rotation
        ;inititialize values to multiply and the total to 0, a ror followed bya  rol has no effect
        LDA #$1B      ;0001 1011
        STA $0334
        LDA #$09      ;0000 1001
        STA $0335
        LDA #$00
        ROR $0335
MULTIPLY
        ROL $0335       ;multiply the value for 2
        LSR $0334
        BCC TESTEND     ;branchs if the carry is clear 
        CLC
        ADC $0335       ;adds if the carry was set to the accumulator

TESTEND
        BNE MULTIPLY    ;test if the carry is clear if the second number is all zeeros
        STA $0336       ;store result
        RTS

;INITAL CONDITIONS
;       0334 0001 1011
;       0335 0000 1001
;       A    0000 0000
;       CARRY 0
1
;       0334 0000 1101
;       0335 0000 1001
;       A    0000 1001
;       CARRY 1
2
;       0334 0000 0110
;       0335 0001 0010
;       A    0001 1011
;       CARRY 1
3
;       0334 0000 0011
;       0335 0010 0100
;       A    0001 1011
;       CARRY 0
4
;       0334 0000 0001
;       0335 0100 1000
;       A    0110 0011
;       CARRY 1
5
;       0334 0000 0000
;       0335 1001 0000
;       A    1111 0011  F3
;       CARRY 1
      