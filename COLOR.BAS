DEFINT A-Z

DECLARE SUB PrintVertical (Text$)

DECLARE SUB Terraced ()
DECLARE SUB Pattern3 ()

DECLARE FUNCTION LeadingZeroValue$ (Value%, LeadingZeros%)

DECLARE SUB Splitoff ()

DECLARE SUB DrawPattern2 ()

DECLARE SUB DrawPattern1 ()

DECLARE SUB SetDACs (Entry AS INTEGER, rDAC AS INTEGER, gDAC AS INTEGER, bDAC AS INTEGER)

DECLARE SUB Solids ()
DECLARE SUB Floats ()
DECLARE SUB Dithers ()


CONST Red = 1
CONST Green = 2
CONST Yellow = 3
CONST Blue = 4
CONST Magenta = 5
CONST Cyan = 6
CONST White = 7

DO
  SCREEN 0
  WIDTH 80
  DO
    
    CLS
    PRINT "Choose:"
    PRINT "1. Solids"
    PRINT "2. Floats"
    PRINT "3. Dither"
    PRINT "4. Split off"
    PRINT "5. Terraced"
    PRINT "6. Quit"
    INPUT MainMenuChoice
  LOOP UNTIL MainMenuChoice > 0 AND MainMenuChoice < 7
 
  SELECT CASE MainMenuChoice
  CASE 1
    Solids
  CASE 2
    Floats
  CASE 3
    Dithers
  CASE 4
    Splitoff
  CASE 5
    Terraced
  CASE 6
    END
  END SELECT
LOOP

SUB Dithers
    SHARED DC1R%, DC1G%, DC1B%
    SHARED DC2R%, DC2G%, DC2B%
    SHARED SCR%, SCG%, SCB%
    SCREEN 13
    SetDACs 1, DC1R%, DC1G%, DC1B%
    SetDACs 2, DC2R%, DC2G%, DC2B%
    SetDACs 3, SCR%, SCG%, SCB%

    DrawPattern2
    LOCATE 14, 1
    PRINT "Dither Color 1:"
    PRINT
    PRINT USING "## "; DC1R; DC1G; DC1B
   
    PRINT " R  G  B"
    PRINT " Q  W  E"
    PRINT
    PRINT "Dither Color 2:"
    PRINT
    PRINT USING "## "; DC2R; DC2G; DC2B
    PRINT " R  G  B"
    PRINT " A  S  D";
   
    LOCATE 14, 21
    PRINT "Solid Color:"
    LOCATE 16, 21
    PRINT USING "## "; SCR; SCG; SCB
    LOCATE 17, 21
    PRINT " R  G  B"
    
     LOCATE 18, 21
    
     PRINT " R  T  Y"
   
    LOCATE 25, 15
    PRINT "0 to return to main menu";
   
    'FOR y = 1 TO 25
    'LOCATE y, 1
    'PRINT y;
    'NEXT y
    DO
      Key$ = INKEY$

      SELECT CASE Key$
      CASE "Q", "q"
        DO
          LOCATE 22, 15
          PRINT "Input Dither 1 red"
          LOCATE 23, 15
          INPUT "(0 to 63)"; DC1R%
        LOOP UNTIL DC1R% > -1 AND DC1R% < 64
        LOCATE 22, 15
        PRINT SPACE$(25);
        LOCATE 23, 15
        PRINT SPACE$(25);

        SetDACs 1, DC1R%, DC1G%, DC1B%
        LOCATE 16, 1
        PRINT USING "## "; DC1R; DC1G; DC1B
      CASE "W", "w"
        DO
          LOCATE 22, 15
          PRINT "Input Dither 1 green"
          LOCATE 23, 15
          INPUT "(0 to 63)"; DC1G%
        LOOP UNTIL DC1G% > -1 AND DC1G% < 64
        LOCATE 22, 15
        PRINT SPACE$(25);
        LOCATE 23, 15
        PRINT SPACE$(25);
       
        SetDACs 1, DC1R%, DC1G%, DC1B%
        LOCATE 16, 1
        PRINT USING "## "; DC1R; DC1G; DC1B

      CASE "E", "e"
        DO
          LOCATE 22, 15
          PRINT "Input Dither 1 blue"
          LOCATE 23, 15
          INPUT "(0 to 63)"; DC1B%
        LOOP UNTIL DC1B% > -1 AND DC1B% < 64
        LOCATE 22, 15
        PRINT SPACE$(25);
        LOCATE 23, 15
        PRINT SPACE$(25);

        SetDACs 1, DC1R%, DC1G%, DC1B%
        LOCATE 16, 1
        PRINT USING "## "; DC1R; DC1G; DC1B

      CASE "A", "a"
        DO
          LOCATE 22, 15
          PRINT "Input Dither 2 red"
          LOCATE 23, 15
          INPUT "(0 to 63)"; DC2R%
        LOOP UNTIL DC2R% > -1 AND DC2R% < 64
        LOCATE 22, 15
        PRINT SPACE$(25);
        LOCATE 23, 15
        PRINT SPACE$(25);
       
        SetDACs 2, DC2R%, DC2G%, DC2B%
       
        LOCATE 22, 1
        PRINT USING "## "; DC2R; DC2G; DC2B
    
      CASE "S", "s"
        DO
          LOCATE 22, 15
          PRINT "Input Dither 2 green";
          LOCATE 23, 15
          INPUT "(0 to 63)"; DC2G%
        LOOP UNTIL DC2G% > -1 AND DC2G% < 64
        LOCATE 22, 15
        PRINT SPACE$(25);
        LOCATE 23, 15
        PRINT SPACE$(25);
        SetDACs 2, DC2R%, DC2G%, DC2B%
        LOCATE 22, 1
        PRINT USING "## "; DC2R; DC2G; DC2B

      CASE "D", "d"
        DO
          LOCATE 22, 15
          PRINT "Input Dither 2 blue"
          LOCATE 23, 15
          INPUT "(0 to 63)"; DC2B%
        LOOP UNTIL DC2B% > -1 AND DC2B% < 64
        LOCATE 22, 15
        PRINT SPACE$(25);
        LOCATE 23, 15
        PRINT SPACE$(25);
        SetDACs 2, DC2R%, DC2G%, DC2B%
        LOCATE 22, 1
        PRINT USING "## "; DC2R; DC2G; DC2B
      CASE "R", "r"
        DO
          LOCATE 22, 15
          PRINT "Input Solid red"
          LOCATE 23, 15
          INPUT "(0 to 63)"; SCR%
        LOOP UNTIL SCR% > -1 AND SCR% < 64
        LOCATE 22, 15
        PRINT SPACE$(25);
        LOCATE 23, 15
        PRINT SPACE$(25);
        SetDACs 3, SCR%, SCG%, SCB%
        LOCATE 16, 21
        PRINT USING "## "; SCR; SCG; SCB
    
      CASE "T", "t"
        DO
          LOCATE 22, 15
          PRINT "Input Solid green"
          LOCATE 23, 15
          INPUT "(0 to 63)"; SCG%
        LOOP UNTIL SCG% > -1 AND SCG% < 64
        LOCATE 22, 15
        PRINT SPACE$(25);
        LOCATE 23, 15
        PRINT SPACE$(25);
        SetDACs 3, SCR%, SCG%, SCB%
        LOCATE 16, 21
        PRINT USING "## "; SCR; SCG; SCB

      CASE "Y", "y"
        DO
          LOCATE 22, 15
          PRINT "Input Solid blue"
          LOCATE 23, 15
          INPUT "(0 to 63)"; SCB%

        LOOP UNTIL SCB% > -1 AND SCB% < 64
        LOCATE 22, 15
        PRINT SPACE$(25);
        LOCATE 23, 15
        PRINT SPACE$(25);
        SetDACs 3, SCR%, SCG%, SCB%
        LOCATE 16, 21
        PRINT USING "## "; SCR; SCG; SCB
      CASE "0"
        PALETTE
        SCREEN 0
        WIDTH 80
        EXIT SUB
      END SELECT
    LOOP
END SUB

SUB DrawPattern1
FOR I = 0 TO 63
  LINE ((I MOD 8) * 40, (I \ 8) * 25)-STEP(39, 24), I, BF
  'COLOR ABS(I < 32) * 32
  COLOR 32
  LOCATE (I \ 8) * 3 + 3, (I MOD 8) * 5 + 3
  PRINT LTRIM$(STR$(I));
NEXT
END SUB

SUB DrawPattern2
    FOR J = 0 TO 60
      FOR I = 0 TO 159
      
        IF (I + J) MOD 2 THEN
          PSET (I, J), 1
        ELSE
          PSET (I, J), 2
        END IF
      NEXT I
    NEXT J
   
    FOR J = 0 TO 60
      FOR I = 160 TO 319
        PSET (I, J), 3
      NEXT I
    NEXT J

END SUB

SUB Floats
    'whether the color is sticking floating or reversing
    STATIC rColorState, gColorState, bColorState
    'what color the color is if it is sticking
    STATIC rColorStick, gColorStick, bColorStick
   
    IF rColorState = 0 THEN rColorState = 1
    IF gColorState = 0 THEN gColorState = 1
    IF bColorState = 0 THEN bColorState = 1
   
    SCREEN 0
    WIDTH 80
    CLS
    DO
      LOCATE 1, 1
      PRINT "          Red  Green Blue"
      PRINT "  Stick: Q    W     E    "
      PRINT "  Float: A    S     D"
      PRINT "Reverse: Z    X     C"
      PRINT
      PRINT "0 to return to main menu"
      PRINT "Return to show results"
      PRINT "Stick: the color sticks at a certain color throughout the cycle"
      PRINT "Float: The color goes from 0 to 63"
      PRINT "Reverse: The color goes from 63 to 0"
      SELECT CASE rColorState
      CASE 1
         LOCATE 2, 12
         PRINT USING "##"; rColorStick;
         LOCATE 3, 12
         PRINT " ";
         LOCATE 4, 12
         PRINT " ";
      CASE 2
         'Turn off first entry
         LOCATE 2, 12
         PRINT "  ";
         'Turn on second entry
         LOCATE 3, 12
         PRINT "X";
         'Turn off third
         LOCATE 4, 12
         PRINT " ";
      CASE 3
         'turn off first entry
         LOCATE 2, 12
         PRINT "  ";
         'Turn off second entry
         LOCATE 3, 12
         PRINT " ";
         'Turn on third
         LOCATE 4, 12
         PRINT "X";
      END SELECT
      SELECT CASE gColorState
      CASE 1
         LOCATE 2, 17
         PRINT USING "##"; gColorStick;
         'turn off second
         LOCATE 3, 17
         PRINT " ";
         'Turn off third
         LOCATE 4, 17
         PRINT " ";

      CASE 2
         'Turn off first
         LOCATE 2, 17
         PRINT "  ";
         'turn on second
         LOCATE 3, 17
         PRINT "X";
         'Turn off third
         LOCATE 4, 17
         PRINT " ";

      CASE 3
        'Turn off first
        LOCATE 2, 17
        PRINT "  ";
        'turn off second
        LOCATE 3, 17
        PRINT " ";
        'Turn on third
        LOCATE 4, 17
        PRINT "X";
      END SELECT
      SELECT CASE bColorState
      CASE 1
        LOCATE 2, 23
        PRINT USING "##"; bColorStick;
        'turn off second
        LOCATE 3, 23
        PRINT " ";
        'Turn off third
        LOCATE 4, 23
        PRINT " ";

      CASE 2
        'Turn off first entry
        LOCATE 2, 23
        PRINT "  ";
        'Turn on second entry
        LOCATE 3, 23
        PRINT "X";
        'Turn off third
        LOCATE 4, 23
        PRINT " ";
      CASE 3
        'turn off first entry
        LOCATE 2, 23
        PRINT "  ";
        'Turn off second entry
        LOCATE 3, 23
        PRINT " ";
        'Turn on third
        LOCATE 4, 23
        PRINT "X";
      END SELECT
     
      DO
        Key$ = INKEY$
        SELECT CASE Key$
        CASE "Q", "q"
           rColorState = 1
           DO
             LOCATE 15, 1
             INPUT "Red Color Value(0 to 63)"; rColorStick
           LOOP UNTIL rColorStick > -1 AND rColorStick < 64
           LOCATE 15, 1
           PRINT SPACE$(80);
        CASE "W", "w"
           gColorState = 1
           DO
             LOCATE 15, 1
             INPUT "Green Color Value(0 to 63)"; gColorStick
           LOOP UNTIL gColorStick > -1 AND gColorStick < 64
           LOCATE 15, 1
           PRINT SPACE$(80);
           
        CASE "E", "e"
           bColorState = 1
           DO
             LOCATE 15, 1
             INPUT "Blue Color Value(0 to 63)"; bColorStick
           LOOP UNTIL bColorStick > -1 AND bColorStick < 64
           LOCATE 15, 1
           PRINT SPACE$(80);
        CASE "A", "a"
          rColorState = 2
        CASE "S", "s"
          gColorState = 2
        CASE "D", "d"
          bColorState = 2
        CASE "Z", "z"
          rColorState = 3
        CASE "X", "x"
          gColorState = 3
        CASE "C", "c"
          bColorState = 3
        CASE CHR$(13)
          SCREEN 13
          FOR I = 0 TO 63
            SELECT CASE rColorState
            CASE 1
              rDAC = rColorStick
            CASE 2
              rDAC = I
            CASE 3
              rDAC = 63 - I
            END SELECT
            SELECT CASE gColorState
            CASE 1
              gDAC = gColorStick
            CASE 2
              gDAC = I
            CASE 3
              gDAC = 63 - I
            END SELECT
            SELECT CASE bColorState
            CASE 1
              bDAC = bColorStick
            CASE 2
              bDAC = I
            CASE 3
              bDAC = 63 - I
            END SELECT
            SetDACs I, rDAC, gDAC, bDAC
          NEXT I
          DrawPattern1
          DO: LOOP UNTIL INKEY$ <> ""
          SCREEN 0
          WIDTH 80
          CLS
          PALETTE
        CASE "0"
          EXIT SUB
        END SELECT
      LOOP UNTIL Key$ <> ""
      
    LOOP
END SUB

FUNCTION LeadingZeroValue$ (Value%, LeadingZeros%)
    DIM Temp AS STRING
    Temp = LTRIM$(STR$(Value%))
    IF LeadingZeros% > LEN(Temp) THEN
      Temp = STRING$(LeadingZeros% - LEN(Temp), "0") + Temp
    END IF
    LeadingZeroValue$ = Temp
END FUNCTION

SUB Pattern3
FOR I = 0 TO 63
  LINE ((I MOD 8) * 39, (I \ 8) * 24)-STEP(38, 23), I + 1, BF
  'LOCATE (I \ 8) * 3 + 3, (I MOD 8) * 5 + 3
  'PRINT LTRIM$(STR$(I + 1));
NEXT
END SUB

SUB PrintVertical (Text$)
    DIM X AS INTEGER
    DIM Y AS INTEGER
    X = POS(0)
    Y = CSRLIN
    FOR I = 0 TO LEN(Text$) - 1
      LOCATE Y + I, X
      PRINT MID$(Text$, I + 1, 1)
    NEXT
END SUB

SUB SetDACs (Entry AS INTEGER, rDAC AS INTEGER, gDAC AS INTEGER, bDAC AS INTEGER)
   OUT &H3C8, Entry        'tell controller to get ready
 
   OUT &H3C9, rDAC         'send red component
   OUT &H3C9, gDAC         'send green component
   OUT &H3C9, bDAC         'send blue component
END SUB

SUB Solids
DO
SCREEN 0
WIDTH 80
CLS
DO
LOCATE 1, 1
PRINT "Select a Color:"
PRINT "1. Red"
PRINT "2. Green"
PRINT "3. Yellow"
PRINT "4. Blue"
PRINT "5. Magenta"
PRINT "6. Cyan"
PRINT "7. White"
PRINT "8. Main Menu"
INPUT ColorSelection
LOOP UNTIL ColorSelection > 0 AND ColorSelection < 9
IF ColorSelection = 8 THEN EXIT DO
SCREEN 13

FOR I = 0 TO 63
  SELECT CASE ColorSelection
  CASE Red
           'E  R  G  B
    SetDACs I, I, 0, 0
  CASE Green
    SetDACs I, 0, I, 0
  CASE Yellow
    SetDACs I, I, I, 0
  CASE Blue
    SetDACs I, 0, 0, I
  CASE Magenta
    SetDACs I, I, 0, I
  CASE Cyan
    SetDACs I, 0, I, I
  CASE White
    SetDACs I, I, I, I
  END SELECT
NEXT
  DrawPattern1
DO: LOOP UNTIL INKEY$ <> ""
LOOP

END SUB

SUB Splitoff
    STATIC SOR AS INTEGER, SOG AS INTEGER, SOB AS INTEGER
    DIM SORGB AS INTEGER: SORGB = 1
    DIM LR AS STRING, RR AS STRING
    DIM LG AS STRING, RG AS STRING
    DIM LB AS STRING, RB AS STRING
    DIM TmpStringedValue AS STRING
    SCREEN 13
    COLOR 15
    GOSUB SOUpdateDACs
    TmpStringedValue = LeadingZeroValue(SOR, 2)
    LR = LEFT$(TmpStringedValue, 1)
    RR = RIGHT$(TmpStringedValue, 1)
    TmpStringedValue = LeadingZeroValue(SOG, 2)
    LG = LEFT$(TmpStringedValue, 1)
    RG = RIGHT$(TmpStringedValue, 1)
    TmpStringedValue = LeadingZeroValue(SOB, 2)
    LB = LEFT$(TmpStringedValue, 1)
    RB = RIGHT$(TmpStringedValue, 1)

                           'Filter
    LINE (0, 20)-(20, 170), Red, BF
    LINE (21, 0)-(299, 19), Green, BF
    LINE (0, 0)-(20, 19), Yellow, BF
    LINE (300, 20)-(319, 170), Blue, BF
    LINE (300, 0)-(319, 19), Cyan, BF
    LINE (21, 20)-(299, 170), White, BF
    LINE (21, 150)-(40, 170), Magenta, BF
    LINE (280, 150)-(299, 170), Magenta, BF
    LOCATE 23, 1
    PRINT "Red: "; : PRINT LeadingZeroValue(SOR, 2);
    LOCATE 24, 1
    PRINT "(0-63, +, -)                 ESC exits";
    LOCATE 25, 1
    PRINT "TAB moves from Red to Green to Blue";
    LOCATE 23, 14
    PRINT "Green: "; : PRINT LeadingZeroValue(SOG, 2)
    'PRINT "(0-63, +, -)";
    LOCATE 23, 27
    PRINT "Blue: "; : PRINT LeadingZeroValue(SOB, 2):

    DO
      DO
        Key$ = INKEY$
      LOOP UNTIL Key$ <> ""
      SELECT CASE Key$
      CASE "0" TO "9"
        SELECT CASE SORGB
        CASE 1
          LR = RR
          RR = Key$
          SOR = VAL(LR + RR)
          LOCATE 23, 6
          PRINT LeadingZeroValue(SOR, 2)
        CASE 2
          LG = RG
          RG = Key$
          SOG = VAL(LG + RG)
          LOCATE 23, 21
          PRINT LeadingZeroValue(SOG, 2)
        CASE 3
          LB = RB
          RB = Key$
          SOB = VAL(LR + RR)
          LOCATE 23, 33
          PRINT LeadingZeroValue(SOB, 2)
        END SELECT
        GOSUB SOUpdateDACs
      CASE CHR$(9)
        SELECT CASE SORGB
        CASE 1
          LOCATE 24, 1
          PRINT "             (0-63, +, -)";
          SORGB = 2
        CASE 2
          LOCATE 24, 1
          PRINT "ESC exits                 (0-63, +, -)";
          SORGB = 3
        CASE 3
          LOCATE 24, 1
          PRINT "(0-63, +, -)                 ESC exits";
          SORGB = 1
        END SELECT
      CASE "+"
        SELECT CASE SORGB
        CASE 1
          SOR = SOR + 1
          IF SOR = 64 THEN SOR = 0
          LOCATE 23, 6
          PRINT LeadingZeroValue(SOR, 2)
          TmpStringedValue = LeadingZeroValue(SOR, 2)
          LR = LEFT$(TmpStringedValue, 1)
          RR = RIGHT$(TmpStringedValue, 1)
        CASE 2
          SOG = SOG + 1
          IF SOG = 64 THEN SOG = 0
          LOCATE 23, 21
          PRINT LeadingZeroValue(SOG, 2)
          TmpStringedValue = LeadingZeroValue(SOG, 2)
          LG = LEFT$(TmpStringedValue, 1)
          RG = RIGHT$(TmpStringedValue, 1)
       CASE 3
          SOB = SOB + 1
          IF SOB = 64 THEN SOB = 0
          LOCATE 23, 33
          PRINT LeadingZeroValue(SOB, 2)
          TmpStringedValue = LeadingZeroValue(SOB, 2)
          LB = LEFT$(TmpStringedValue, 1)
          RB = RIGHT$(TmpStringedValue, 1)
        END SELECT
        GOSUB SOUpdateDACs
      CASE "-"
        SELECT CASE SORGB
        CASE 1
          SOR = SOR - 1
          IF SOR = -1 THEN SOR = 63
          LOCATE 23, 6
          PRINT USING "##"; SOR;
          TmpStringedValue = LeadingZeroValue(SOR, 2)
          LR = LEFT$(TmpStringedValue, 1)
          RR = RIGHT$(TmpStringedValue, 1)
        CASE 2
          SOG = SOG - 1
          IF SOG = -1 THEN SOG = 63
          LOCATE 23, 21
          PRINT USING "##"; SOG;
          TmpStringedValue = LeadingZeroValue(SOG, 2)
          LG = LEFT$(TmpStringedValue, 1)
          RG = RIGHT$(TmpStringedValue, 1)
       CASE 3
          SOB = SOB - 1
          IF SOB = -1 THEN SOB = 63
          LOCATE 23, 33
          PRINT USING "##"; SOB;
          TmpStringedValue = LeadingZeroValue(SOB, 2)
          LB = LEFT$(TmpStringedValue, 1)
          RB = RIGHT$(TmpStringedValue, 1)
        END SELECT
        GOSUB SOUpdateDACs

      CASE CHR$(27)
        SCREEN 0
        EXIT SUB
      END SELECT
    LOOP

SOUpdateDACs:
    SetDACs Red, SOR, 0, 0
    SetDACs Green, 0, SOG, 0
    SetDACs Yellow, SOR, SOG, 0
    SetDACs Blue, 0, 0, SOB
    SetDACs Magenta, SOR, 0, SOB
    SetDACs Cyan, 0, SOG, SOB
    SetDACs White, SOR, SOG, SOB
RETURN

END SUB

SUB Terraced
    DIM I  AS INTEGER, J AS INTEGER
    DIM TempR AS INTEGER, TempG AS INTEGER, TempB AS INTEGER
    STATIC TR AS INTEGER, TG AS INTEGER, TB AS INTEGER

    SCREEN 13
    COLOR 255
    
    SetDACs 255, 63, 63, 63
    GOSUB SetTDACS
    
    Pattern3
    LINE (3 * 39, 3 * 24)-STEP(38, 23), 255, B
    LOCATE 25, 1
    PRINT "R Move Up/Down";
    LOCATE 1, 40
    PrintVertical "G Move Left/Right"
    LOCATE 25, 26
    PRINT "Move Diagonal B";
    LOCATE 25, 16
    PRINT USING "## "; TR; TG; TB;
    DO
      Key$ = INKEY$
      SELECT CASE Key$
      CASE CHR$(0) + "H"
        TR = TR - 1
        IF TR = -1 THEN TR = 63
        GOSUB SetTDACS
        LOCATE 25, 16
        PRINT USING "## "; TR; TG; TB;

      CASE CHR$(0) + "P"
        TR = (TR + 1) MOD 64
        GOSUB SetTDACS
        LOCATE 25, 16
        PRINT USING "## "; TR; TG; TB;
      CASE CHR$(0) + "K"
        TG = TG - 1
        IF TG = -1 THEN TG = 63
        GOSUB SetTDACS
        LOCATE 25, 16
        PRINT USING "## "; TR; TG; TB;
      CASE CHR$(0) + "M"
        TG = (TG + 1) MOD 64
        GOSUB SetTDACS
        LOCATE 25, 16
        PRINT USING "## "; TR; TG; TB;
      CASE CHR$(0) + "G"
        TB = TB - 1
        IF TB = -1 THEN TB = 63
        GOSUB SetTDACS
        LOCATE 25, 16
        PRINT USING "## "; TR; TG; TB;
      CASE CHR$(0) + "Q"
        TB = (TB + 1) MOD 64
        GOSUB SetTDACS
        LOCATE 25, 16
        PRINT USING "## "; TR; TG; TB;
      CASE CHR$(0) + "O"
        TB = TB - 1
        IF TB = -1 THEN TB = 63
        GOSUB SetTDACS
        LOCATE 25, 16
        PRINT USING "## "; TR; TG; TB;
      CASE CHR$(0) + "I"
        TB = (TB + 1) MOD 64
        GOSUB SetTDACS
        LOCATE 25, 16
        PRINT USING "## "; TR; TG; TB;

      CASE CHR$(27)
        SCREEN 0
        WIDTH 80
        EXIT SUB
      END SELECT
    LOOP
SetTDACS:
    FOR I = 0 TO 7
    FOR J = 0 TO 7
      IF ABS(J - 3) > ABS(I - 3) THEN
        TempB = ABS(I - 3)
      ELSE
        TempB = ABS(J - 3)
      END IF
      IF J < 3 THEN TempB = -TempB
      TempB = TempB + TB
      IF TempB < 0 THEN TempB = 64 + TempB
      IF TempB > 63 THEN TempB = TempB - 64
      TempD = TempB
      TempR = TR + I - 3
      IF TempR < 0 THEN TempR = 64 + TempR
      IF TempR > 63 THEN TempR = TempR - 64
      TempG = TG + J - 3
      IF TempG < 0 THEN TempG = 64 + TempG
      IF TempG > 63 THEN TempG = TempG - 64
      SetDACs J + I * 8 + 1, TempR, TempG, TempB
      'LOCATE I * 3 + 3, J * 5 + 3
      'PRINT USING "## "; TempR;
  NEXT: NEXT
RETURN
END SUB

