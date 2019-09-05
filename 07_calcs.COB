       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCS1.
      *=================================================================
      * Purpose: Perform some basic calcs v.1
      * Author:  Victor Domingos
      * Date:    2019-09-05
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
       77  AMOUNT1     PIC 9(10) VALUE ZERO.
       77  AMOUNT2     PIC 9(10) VALUE ZERO.
       77  N           PIC 9(10) VALUE ZERO.
       77  TOTAL       PIC 9(10) VALUE ZERO.

       77  A           PIC 9(10) VALUE 10.
       77  B           PIC 9(10) VALUE 2.
       77  C           PIC 9(10) VALUE ZERO.
       77  D           PIC 9(10) VALUE ZERO.

      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           MOVE 1000 TO AMOUNT1.
           MOVE  100 TO AMOUNT2.
           ADD AMOUNT1 AMOUNT2 TO TOTAL.
           DISPLAY "THE TOTAL IS " TOTAL.

           MOVE AMOUNT1 TO N.
           SUBTRACT AMOUNT2 FROM N.
           DISPLAY AMOUNT1 " - " AMOUNT2 " = " N.

           DISPLAY "A: " A.
           DISPLAY "B: " B.
           DISPLAY "C: " C.

           DIVIDE B INTO A GIVING C.
           DISPLAY "DIVIDE B INTO A GIVING C  ===> "A " / " B " = " C.

           DIVIDE A BY B GIVING C.
           DISPLAY "DIVIDE A BY B GIVING C  ===> "A " / " B " = " C.

           DIVIDE A BY 3 GIVING C REMAINDER D.
           DISPLAY "".
           DISPLAY "DIVIDE A BY 3 GIVING C REMAINDER D  ===> "
      -            A " / " B " = " C.
           DISPLAY "REMAINDER: " D.

           COMPUTE D = 100 * A - (C/B).
           DISPLAY "100 * " A " - (" C "/" B ")".
           DISPLAY D.
           DISPLAY "NOTE HOW ROUNDING WAS MADE JUST IN THE END".
           STOP RUN.

       END PROGRAM CALCS1.
