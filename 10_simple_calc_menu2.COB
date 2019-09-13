       IDENTIFICATION DIVISION.
       PROGRAM-ID. OPERATORS.
      *=================================================================
      * Purpose: Simple Calculator
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
       77  X   PIC S9(11)V9   VALUE 0.
           88  MAGIC-X     VALUE 666.
       77  XM  PIC -Z(10)9.9.

       77  Y   PIC S9(11)V9   VALUE 0.
           88  MAGIC-Y     VALUE 666.
       77  YM  PIC -Z(10)9.9.

       77  R   PIC S9(11)V9   VALUE 0.
           88  MAGIC-R     VALUE 666.
       77  RM  PIC -Z(10)9.9.

       77  N   PIC 999 VALUE 0.
       77  OP  PIC X.

       77  NOME PIC X(32)  VALUE " ".


      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM HEAD-PROCEDURE.
           STARTPOSITION.
           PERFORM ASK-NAME-PROCEDURE.
           PERFORM INPUT-PROCEDURE-A.
           PERFORM INPUT-PROCEDURE-B.
           PERFORM MENU-PROCEDURE.
           PERFORM CALC-PROCEDURE.
           PERFORM FIND-MAGIC-PROCEDURE.

           QUESTIONPOSITION.
           DISPLAY " ".
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
               DISPLAY " "
               ADD 1 TO N
           END-PERFORM.

           DISPLAY "+-----------------------------------------------+"
           DISPLAY "+   THE AMAZING NPK CALCULATOR, DONE IN COBOL   +"
           DISPLAY "+-----------------------------------------------+"
           DISPLAY " ".


       ASK-NAME-PROCEDURE.
           DISPLAY "Please type your name:"
           ACCEPT NOME
           DISPLAY "Hi, " NOME.
           IF NOME NOT ALPHABETIC
               PERFORM ASK-NAME-PROCEDURE
           END-IF.


       INPUT-PROCEDURE-A.
           DISPLAY "Please enter a number:"
           ACCEPT X
           IF X > 999999999
                 DISPLAY "INVALID ENTRY!"
                 PERFORM INPUT-PROCEDURE-A
           END-IF.


       INPUT-PROCEDURE-B.
           DISPLAY "Please enter another:"
           ACCEPT Y
           IF Y IS ALPHABETIC
               DISPLAY "INVALID ENTRY!"
               PERFORM INPUT-PROCEDURE-B
           END-IF.


       FIND-MAGIC-PROCEDURE.
           DISPLAY " "
           IF X = 666 OR Y = 666
               DISPLAY "You have entered a magic number."
               DISPLAY "Congrats!"
           END-IF.

           IF R = 666
               DISPLAY "You have found a magic number."
               DISPLAY "Congrats!"
           END-IF.


           DISPLAY " ".


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

           DISPLAY " "
           DISPLAY " "
           DISPLAY " " XM
           DISPLAY OP YM
           DISPLAY "---------------"
           DISPLAY " " RM.


       END PROGRAM OPERATORS.
