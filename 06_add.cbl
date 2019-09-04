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
       77  COUNTER     PIC 9(2) VALUE ZEROS.

      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           ADD 2 TO COUNTER.
           ADD 4 TO COUNTER.
           DISPLAY "The result is " COUNTER ".".
           STOP RUN.

       END PROGRAM ADD-FUNCTION.
