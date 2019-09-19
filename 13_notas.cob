       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMNAME.
      *=================================================================
      * Purpose:
      * Author:  Victor Domingos
      * Date:
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
       77  NOME    PIC A(20)   VALUE SPACES.
       77  NOTA1   PIC 99      VALUE ZERO.
       77  NOTA2   PIC 99      VALUE ZERO.
       77  NOTA3   PIC 99      VALUE ZERO.
       77  NOTA4   PIC 99      VALUE ZERO.
       77  MEDIA   PIC 99V99   VALUE ZERO.
       77  MEDIA-M PIC Z9.9    VALUE ZERO.

      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM INPUT-PROCEDURE.
           PERFORM CALC-AVG-PROCEDURE.
           PERFORM REPORT-PROCEDURE.
           STOP RUN.



       INPUT-PROCEDURE.
           PERFORM UNTIL (NOME ALPHABETIC) AND (NOME NOT = SPACES)
               DISPLAY "Por favor, introduza o nome do formando:"
               ACCEPT NOME
           END-PERFORM.

           PERFORM UNTIL (NOTA1 > 0) AND (NOTA1 <= 20)
               DISPLAY "Por favor, introduza a nota 1:"
               ACCEPT NOTA1
           END-PERFORM.

           PERFORM UNTIL (NOTA2 > 0) AND (NOTA2 <= 20)
               DISPLAY "Por favor, introduza a nota 2:"
               ACCEPT NOTA2
           END-PERFORM.

           PERFORM UNTIL (NOTA3 > 0) AND (NOTA3 <= 20)
               DISPLAY "Por favor, introduza a nota 3:"
               ACCEPT NOTA3
           END-PERFORM.

           PERFORM UNTIL (NOTA4 > 0) AND (NOTA4 <= 20)
               DISPLAY "Por favor, introduza a nota 4:"
               ACCEPT NOTA4
           END-PERFORM.


       CALC-AVG-PROCEDURE.
           COMPUTE MEDIA = (NOTA1+NOTA2+NOTA3+NOTA4)/4.
           MOVE MEDIA TO MEDIA-M.



       REPORT-PROCEDURE.
           DISPLAY " "
           DISPLAY "   N1: " NOTA1.
           DISPLAY "   N2: " NOTA2.
           DISPLAY "   N3: " NOTA3.
           DISPLAY "   N4: " NOTA4.
           DISPLAY " "
           DISPLAY "Media: " MEDIA-M " valores.".
           IF MEDIA < 10
               DISPLAY "REPROVADO"
           ELSE
               DISPLAY "APROVADO"
           END-IF.
           DISPLAY " ".


       END PROGRAM PROGRAMNAME.
