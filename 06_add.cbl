       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD-FUNCTION.
      *=================================================================
      * Purpose: ADD function
      * Author:  Victor Domingos
      * Date:    2019-09-03
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
       77  COUNTER1     PIC 9(2) VALUE ZEROS.
       77  COUNTER2     PIC 9(2) VALUE ZEROS.
       77  COUNTER3     PIC 9(2) VALUE ZEROS.
       77  COUNTER4     PIC 9(2) VALUE ZEROS.
       77  TOTAL  PIC 9(3) VALUE ZEROS.

      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           ADD 2 TO COUNTER1.
           ADD 4 TO COUNTER1.
           DISPLAY "The result of COUNTER1 (2, 4)is " COUNTER1 ".".

           ADD 2 3 TO COUNTER2.
           DISPLAY "The result of COUNTER2 (2 3) is " COUNTER2 ".".

           ADD 2 5 7 12 TO COUNTER3.
           DISPLAY "The result of COUNTER3 (2 5 7 12) is " COUNTER3 ".".

           ADD 2 5 TO COUNTER4.
           ADD 7 12 GIVING COUNTER4.
           DISPLAY "The result of COUNTER4 (7 12) is " COUNTER4 ".".

           ADD COUNTER1 COUNTER2 COUNTER3 COUNTER4 GIVING TOTAL.
           DISPLAY " ".
           DISPLAY COUNTER1 " + " COUNTER2 " + " COUNTER3 " + " COUNTER4
      -    " = " TOTAL.


           ADD 1 TO COUNTER1 COUNTER2 COUNTER3 COUNTER4.
           ADD COUNTER1 COUNTER2 COUNTER3 COUNTER4 GIVING TOTAL.
           DISPLAY " ".
           DISPLAY "ALL COUNTERS INCREMENTED BY 1:"
           DISPLAY COUNTER1 "+" COUNTER2 "+" COUNTER3 "+" COUNTER4
      -    " = " TOTAL.
           STOP RUN.

       END PROGRAM ADD-FUNCTION.
