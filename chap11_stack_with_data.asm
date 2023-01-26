WATCH $0334
WATCH $0335

*=900
;stack with instructions and data

        JSR ROUT1
        INC $D020
        RTS

ROUT1
        PLA

;RETURN TO AND ADDRESS THAT IS NOT THE ORIGINAL STORED ON THE STACK BY JSR but one instruction down the lines
        TAY
        INY
        INY
        INY 
        TYA

        TAX
        PLA
        STX $0334
        STA $0335
        PHA
        TXA
        PHA
        RTS