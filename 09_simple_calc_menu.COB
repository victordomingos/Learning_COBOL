       IDENTIFICATION DIVISION.
       PROGRAM-ID. OPERATORS.
      *=================================================================
      * Purpose:
      * Author:  Victor Domingos
      * Date:    2019-09-10
      * License: MIT
      *=================================================================
       ENVIRONMENT DIVISION.
      *-----------------------------------------------------------------
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
      *-----------------------------------------------------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

      *=================================================================
       DATA DIVISION.

      *-----------------------------------------------------------------
       FILE SECTION.

      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.
       77  X   PIC 9(13)   VALUE 0.
           88  MAGIC-X     VALUE 666.
       77  XM  PIC Z(12)9.

       77  Y   PIC 9(13)   VALUE 0.
           88  MAGIC-Y     VALUE 666.
       77  YM  PIC Z(12)9.

       77  R   PIC 9(13)   VALUE 0.
           88  MAGIC-R     VALUE 666.
       77  RM  PIC Z(12)9.

       77  N   PIC 999 VALUE 0.
       77  OP  PIC X.


      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM HEAD-PROCEDURE.
           STARTPOSITION.
           PERFORM INPUT-PROCEDURE.
           PERFORM MENU-PROCEDURE.
           PERFORM CALC-PROCEDURE.
           PERFORM FIND-MAGIC-PROCEDURE.

           QUESTIONPOSITION.
           DISPLAY "".
           DISPLAY "Want some more [y/n]?"
           ACCEPT OP.
           EVALUATE OP
               WHEN "Y" GO TO STARTPOSITION
               WHEN "y" GO TO STARTPOSITION
               WHEN "N" DISPLAY "Bye!"
               WHEN "n" DISPLAY "Bye!"
               WHEN OTHER GO TO QUESTIONPOSITION
           END-EVALUATE.

           STOP RUN.


       HEAD-PROCEDURE.
           MOVE 0 TO N
           PERFORM UNTIL N = 5
               DISPLAY ""
               ADD 1 TO N
           END-PERFORM.

           DISPLAY "+-----------------------------------------------+"
           DISPLAY "+   THE AMAZING NPK CALCULATOR, DONE IN COBOL   +"
           DISPLAY "+-----------------------------------------------+"
           DISPLAY "".


       INPUT-PROCEDURE.
           DISPLAY "X?"
           ACCEPT X

           DISPLAY "Y?"
           ACCEPT Y.


       FIND-MAGIC-PROCEDURE.
           DISPLAY ""
           IF X = 666 OR Y = 666
               DISPLAY "You have entered a magic number."
               DISPLAY "Congrats!"
           END-IF.

           IF R = 666
               DISPLAY "You have found a magic number."
               DISPLAY "Congrats!"
           END-IF.


           DISPLAY "".


       MENU-PROCEDURE.
           DISPLAY "Please choose an operator [+ - / *]:"
           ACCEPT OP.


       CALC-PROCEDURE.
           EVALUATE OP
               WHEN "+" ADD X Y GIVING R
               WHEN "-" SUBTRACT Y FROM X GIVING R
               WHEN "*" MULTIPLY X BY Y GIVING R
               WHEN "/" DIVIDE X BY Y GIVING R
           END-EVALUATE.

           MOVE X TO XM
           MOVE Y TO YM
           MOVE R TO RM

           DISPLAY ""
           DISPLAY ""
           DISPLAY " " XM
           DISPLAY OP YM
           DISPLAY "--------------"
           DISPLAY " " RM.


       END PROGRAM OPERATORS.
