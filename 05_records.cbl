       IDENTIFICATION DIVISION.
       PROGRAM-ID. RECORDS.
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
       01  COSTUMER.
           02 COD   PIC 9(10)   VALUE 1000.
           02 NAME PIC A(25)   VALUE "Doctor Who".
           02 CITY PIC A(15)   VALUE "Gallifrey".

      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           DISPLAY COSTUMER.
           DISPLAY COD.
           DISPLAY NAME.
           DISPLAY CITY.
           STOP RUN.

       END PROGRAM RECORDS.
