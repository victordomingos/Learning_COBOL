       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIMPLE-VARIABLES.
      *=================================================================
      * Purpose: Simple Variables
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
       77  CURR_DATE   PIC X(6)  VALUE ZEROS.
       77  CURR_DATE_M PIC 99/99/99.

       77  CURR_TIME   PIC X(6)  VALUE ZEROS.
       77  CURR_TIME_M PIC 999999.


      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           DISPLAY "CURRENT DATE IS: ".
           ACCEPT CURR_DATE FROM DATE.
           MOVE CURR_DATE TO CURR_DATE_M.
           DISPLAY CURR_DATE_M.

           DISPLAY "CURRENT TIME IS: ".
           ACCEPT CURR_TIME FROM TIME.
           MOVE CURR_TIME TO CURR_TIME_M.
           DISPLAY CURR_TIME_M.
           STOP RUN.

       END PROGRAM SIMPLE-VARIABLES.
