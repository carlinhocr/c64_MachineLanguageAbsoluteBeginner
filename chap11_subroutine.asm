*=900
;test subroutine

        LDA #$01
        STA $D015
        STA $07F8
        LDA #$32
        STA $D000
        STA $D001

REPJUMP
        JSR ROUTINE1
        CMP #$FA
        BNE REPJUMP
        RTS     ;To end the program
ROUTINE1
        INC $D001
        LDA $D000
        JSR ROUTINE2
        CLC
        ADC #$04
        STA $D000
        RTS     ;Return from subroutine 1

ROUTINE2
        CMP #$50
        BCC ROUT2END
        INC $D001
ROUT2END
        RTS     ;Return from subroutine 2
        