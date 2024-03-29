; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00
*=$0900

;copy charecter sets to $CE00 and $CF00

        
        LDA #$FE        ;1111 1110 a mask that turns bit 0 Off (to 0)
        AND $DC0E       ;Timer A control Register Memory Address
        STA $DC0E       ;Bit #0: 0 = Stop timer; 1 = Start timer (Stops Timer)
        LDA #$FB        ;1111 1011 a mask that turns off bit 2 (to 0)
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

        LDA #$04        ;0000 0100 mask to turn on bit 2 (to 1)
        ORA $01         ;Processor Port Memory Bits
        STA $01         ;%1xx: I/O area visible at $D000-$DFFF. (Except for the value %100, see above.)
                        ;%x00: RAM visible in all three areas.
        LDA #$01        ;0000 0001 mask to turn on bit 0 (to 1)
        ORA $DC0E       ;Timer A control Register Memory Address
        STA $DC0E       ;Bit #0: 0 = Stop timer; 1 = Start timer (Starts timer)

;look up a list of letters to print "HELLO"

        LDA #$08        ;H
        STA $CD00
        LDA #$05        ;E
        STA $CD01
        LDA #$0C        ;L
        STA $CD02
        STA $CD03
        LDA #$0F        ;O
        STA $CD04        

;draw the characters of "HELLO"
        
        ;set the colour of the screen
        LDA #$0F
        LDX #$FF
STORECOLOURMEM
        STA $400,X
        DEX
        BNE STORECOLOURMEM
        
        ;Memory setup register. Bits
        LDA #$10
        STA $D018   
        ;Set low nad hight byte at zero page for indirect addressing
        ;choosing with character table to use
        ;LDA #$CF ;hight byte use for UPPER CASE
        LDA #$CE ;high byte use for LOWER CASE
        STA $FE  ;store high byte in zero page
        LDA #$00 ;low bytes
        STA $FD  ;store low byte in zero page

        ;Set up Graphics Mode
        ;Screen control register #1. Bits:
        ;Bits #0-#2: Vertical raster scroll.
        ;Bit #3: Screen height; 0 = 24 rows; 1 = 25 rows.
        ;Bit #4: 0 = Screen off, complete screen is covered by border; 1 = Screen on, normal screen contents are visible.
        ;Bit #5: 0 = Text mode; 1 = Bitmap mode.
        ;Bit #6: 1 = Extended background mode on.
        ;Bit #7: Read: Current raster line (bit #8).
        ;Write: Raster line to generate interrupt at (bit #8).
        LDA #$3B ;0011 1011 Bit 5 is 1 => bitmap mode
                 ; bit 4 is 1 => Screen on
                 ; bit 3 is 1 => Screen height 25 rows
        STA $D011
        
        ;Position Pointer
        LDY #$00
        STY $CC00
        
        ;Get next character to print
GETNEXTCHARACTER
        STY $CC01
        LDX $CD00,Y     ;load in X the character of the message
        
        ;find the start of the data for the character
        LDA #$F8
READCHARACTER
        CLC
        ADC #$08
        DEX
        CPX #$FF        ;test if X is 255
        BNE READCHARACTER ; read another character
        TAY
        ;limit the amount of of data copying to $CC02
        LDX $CC00
        LDA #$08
        STA $CC02
        ;copy data from the table to the screen
COPYDATA
        ;LDA $CE00,Y direct addressing
        LDA ($FD),Y ;indirect addressing
        INY
        STA $0400,X
        INX
        DEC $CC02 ; decrease the counter from 8 to count 8 bytes
        BNE COPYDATA
        ;SAVE THE POINTER ON THE SCREEN FOR THE NEXT CHARACTER
        STX $CC00
        ;goes to print the next letter of the message
        LDY $CC01
        INY
        CPY #$06 ;If Y is 6 then we printed the 5 letters of HELLO
        BNE GETNEXTCHARACTER
    
        RTS