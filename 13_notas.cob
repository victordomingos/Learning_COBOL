       IDENTIFICATION DIVISION.
       PROGRAM-ID. NOTAS.
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

       77  NOTA1   PIC 99      VALUE 21.
       77  NOTA2   PIC 99      VALUE 21.
       77  NOTA3   PIC 99      VALUE 21.
       77  NOTA4   PIC 99      VALUE 21.
       77  NFALTAS PIC S99     VALUE -1.
       77  EXAME   PIC 99      VALUE 21.
       77  IN-NOTA PIC Z9.

       77  MEDIA   PIC 99V99   VALUE ZERO.
       77  NOTA-F  PIC 99V99   VALUE ZERO.
       77  NOTA-M  PIC Z9.9    VALUE ZERO.

      * média ponderada com as faltas:
       77  M-FALTAS PIC 99V99   VALUE ZERO.

       01  HOJE.
           02  ANO PIC 99      VALUE ZERO.
           02  MES PIC 99      VALUE ZERO.
           02  DIA PIC 99      VALUE ZERO.

       77  SP    PIC A(1)      VALUE SPACE.
      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM INPUT-PROCEDURE.
           PERFORM CALC-AVG-PROCEDURE.
           PERFORM REPORT-PROCEDURE.

           666.
           ACCEPT SP AT 2001
           STOP RUN.



       INPUT-PROCEDURE.
           DISPLAY SPACE ERASE EOS.
           PERFORM UNTIL (NOME ALPHABETIC) AND (NOME NOT = SPACES)
               DISPLAY "Por favor, introduza o nome:" AT 1101
               ACCEPT NOME AT 1130
           END-PERFORM.

           PERFORM UNTIL (NOTA1 >= 0) AND (NOTA1 <= 20)
               DISPLAY "Por favor, introduza a nota 1:" AT 1301
               ACCEPT IN-NOTA AT 1332
               MOVE IN-NOTA TO NOTA1
           END-PERFORM.

           PERFORM UNTIL (NOTA2 >= 0) AND (NOTA2 <= 20)
               DISPLAY "Por favor, introduza a nota 2:" AT 1401
               ACCEPT IN-NOTA AT 1432
               MOVE IN-NOTA TO NOTA2
           END-PERFORM.

           PERFORM UNTIL (NOTA3 >= 0) AND (NOTA3 <= 20)
               DISPLAY "Por favor, introduza a nota 3:" AT 1501
               ACCEPT IN-NOTA AT 1532
               MOVE IN-NOTA TO NOTA3
           END-PERFORM.

           PERFORM UNTIL (NOTA4 >= 0) AND (NOTA4 <= 20)
               DISPLAY "Por favor, introduza a nota 4:" AT 1601
               ACCEPT IN-NOTA AT 1632
               MOVE IN-NOTA TO NOTA4
           END-PERFORM.

           PERFORM UNTIL (NFALTAS >= 0)
               DISPLAY "Qual o numero de faltas?" AT 1701
               ACCEPT IN-NOTA AT 1725
               MOVE IN-NOTA TO NFALTAS
           END-PERFORM.


       CALC-AVG-PROCEDURE.
           COMPUTE MEDIA = (NOTA1+NOTA2+NOTA3+NOTA4)/4
           COMPUTE M-FALTAS = MEDIA-(2*NFALTAS).


       REPORT-PROCEDURE.
           DISPLAY SPACE ERASE EOS.
           ACCEPT HOJE FROM DATE.
           DISPLAY DIA AT 0101
           DISPLAY "/" AT 0103
           DISPLAY MES AT 0104
           DISPLAY "/" AT 0106
           DISPLAY ANO AT 0107

           DISPLAY NOME AT 0110

           MOVE NOTA1 TO NOTA-M
           DISPLAY "N1:" AT 0303
           NOTA-M AT 0307

           MOVE NOTA2 TO NOTA-M
           DISPLAY "N2:" AT 0403
           NOTA-M AT 0407

           MOVE NOTA3 TO NOTA-M
           DISPLAY "N3:" AT 0503
           NOTA-M AT 0507

           MOVE NOTA4 TO NOTA-M
           DISPLAY "N4:" AT 0603
           NOTA-M AT 0607


           MOVE MEDIA TO NOTA-M.
           DISPLAY "Media: " AT 0801
           DISPLAY NOTA-M AT 0808


           IF MEDIA < 10
               DISPLAY "Media inferior a 10 (REPROVADO)." AT 0901
               GO TO 666
           END-IF.

           IF NFALTAS > (MEDIA * 2)
               DISPLAY "REPROVADO POR FALTAS, COM NOTA DE " AT 0901
               DISPLAY M-FALTAS AT 1001
               GO TO 666
           END-IF.

           IF NFALTAS > 25
               DISPLAY "REPROVADO POR FALTAS, COM NOTA DE " AT 0901
               DISPLAY M-FALTAS AT 1001
               DISPLAY "Numero de faltas: " AT 1101
               DISPLAY NFALTAS AT 1201
               GO TO 666
           END-IF.


           IF MEDIA >= 10
               DISPLAY NFALTAS AT 0901
               DISPLAY "FALTAS" AT 0904
               GO TO 666
           END-IF.




           PERFORM UNTIL (EXAME >= 0) AND (EXAME <= 20)
               DISPLAY "P/favor, introduza a nota do exame:" AT 1001
               ACCEPT IN-NOTA AT 1039
               MOVE IN-NOTA TO EXAME
           END-PERFORM

           COMPUTE NOTA-F = (MEDIA + EXAME)/2
           MOVE NOTA-F TO NOTA-M


           DISPLAY "Nota final: " AT 1201
           DISPLAY NOTA-M AT 1213



           IF NOTA-F < 10
               DISPLAY "== REPROVADO ==" AT 1301
           ELSE
               DISPLAY "== APROVADO ==" AT 1301
           END-IF.

           ACCEPT SP AT 2001.




       END PROGRAM NOTAS.
