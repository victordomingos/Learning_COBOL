       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO-WORLD.
      *=================================================================
      * Purpose: Just saying hello
      *          A Basic COBOL template for use in exercises.
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



      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.

       END PROGRAM HELLO-WORLD.
