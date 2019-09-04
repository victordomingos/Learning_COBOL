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
       77  NUM       PIC 9(18) VALUE 44.
       77  TEXT      PIC A(23) VALUE "This is a short text...".
       77  TEXT_NUMS PIC X(21) VALUE "Here we got 5 lemons.".
       77  SIGN_NUM  PIC S9(2) VALUE -23.
       77  SIGN_NUM2 PIC S9(3).
      * If the user enters -100, COBOL gets -010 (truncates at 3 chars)

       77  DECIMAL1  PIC 9(3).9(2).
      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           DISPLAY NUM.
           DISPLAY TEXT.
           DISPLAY TEXT_NUMS.
           DISPLAY SIGN_NUM.

           DISPLAY "ENTER A NUMBER:".
           ACCEPT SIGN_NUM2.
           DISPLAY "YOU ENTERED SOMETHING I HAVE INTERPRETED AS: "
      -    NO ADVANCING.
           DISPLAY SIGN_NUM2.

           DISPLAY "ENTER A DECIMAL NUMBER: ".
           ACCEPT DECIMAL1.
           DISPLAY "YOU ENTERED SOMETHING I HAVE INTERPRETED AS: "
      -    NO ADVANCING.
           DISPLAY DECIMAL1.
           STOP RUN.

       END PROGRAM SIMPLE-VARIABLES.
