       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO-WORLD2.
      *=================================================================
      * Purpose: Hello World v.2
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
       77  W-NOME    PIC A(15) VALUE "Victor Domingos".


      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
            DISPLAY "Hello world!".
            DISPLAY W-NOME.
            STOP RUN.

       END PROGRAM HELLO-WORLD2.
