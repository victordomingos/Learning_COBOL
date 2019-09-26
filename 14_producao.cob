      *================================================================*
       IDENTIFICATION                                  DIVISION.
      *================================================================*
       PROGRAM-ID. PRODUCAO1-NOTA-ESCOLAR.
      ***************************DOCUMENTAÇÃO***************************
      ******************************************************************
      *                                                       PI 01-19 *
      *    AUTOR:      Victor Domingos, 18                                *
      *    DATA:       2019/09/26                                      *
      *    ESPECIFICACAO DO PROGRAMA: Cálculo da média das notas de um *
      *                               aluno                            *
      *    LOCAL:      Mazagão, Braga, Portugal                        *
      *                                                                *
      *    NOTA ESCOLAR:                                               *
      *                                                                *
      *    COMENTÁRIOS:                                                *
      *                                                                *
      ******************************************************************
      *************************FIM DOCUMENTAÇÃO*************************

      *================================================================*
       ENVIRONMENT                                     DIVISION.
      *================================================================*

      *----------------------------------------------------------------*
       CONFIGURATION                           SECTION.
      *----------------------------------------------------------------*

       SPECIAL-NAMES.

      *----------------------------------------------------------------*
       INPUT-OUTPUT                            SECTION.
      *----------------------------------------------------------------*

       FILE-CONTROL.

      *================================================================*
       DATA                                            DIVISION.
      *================================================================*

      *----------------------------------------------------------------*
       FILE                                    SECTION.
      *----------------------------------------------------------------*

      *----------------------------------------------------------------*
       WORKING-STORAGE                         SECTION.
      *----------------------------------------------------------------*
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
       77  NOTA-M  PIC Z9.99    VALUE ZERO.

      * média ponderada com as faltas:
       77  M-FALTAS    PIC S99V99   VALUE ZERO.
       77  M-FALTAS-M  PIC -Z9.99    VALUE ZERO.

       01  HOJE.
           02  ANO PIC 99      VALUE ZERO.
           02  MES PIC 99      VALUE ZERO.
           02  DIA PIC 99      VALUE ZERO.

       77  SP    PIC A(1)      VALUE SPACE.

      *----------------------------------------------------------------*
       SCREEN                                  SECTION.
      *----------------------------------------------------------------*


      *================================================================*
       PROCEDURE                                       DIVISION.
      *================================================================*

       MAIN-PROCEDURE.
           PERFORM START-SCREEN-PROCEDURE.
           PERFORM INPUT-PROCEDURE.
           PERFORM CALC-AVG-PROCEDURE.
           PERFORM REPORT-PROCEDURE.

           666.
           DISPLAY "-----------FIM DO PROGRAMA------------" AT 2527
           ACCEPT SP AT 2501
           STOP RUN.


       START-SCREEN-PROCEDURE.
           DISPLAY SPACE ERASE EOS.
           ACCEPT HOJE FROM DATE.
           DISPLAY "Data:" AT 0201
           DISPLAY DIA AT 0207
           DISPLAY "/" AT 0209
           DISPLAY MES AT 0210
           DISPLAY "/" AT 0212
           DISPLAY ANO AT 0213

           DISPLAY "XXXXX" AT 0225
           DISPLAY "Calculo da Media das notas do aluno XXXXX" AT 0231
           DISPLAY "Dados para avaliacao" AT 0345.


       INPUT-PROCEDURE.
           DISPLAY "Digite o nome do aluno:" AT 0410
           PERFORM UNTIL (NOME ALPHABETIC) AND (NOME NOT = SPACES)
               ACCEPT NOME AT 0445
           END-PERFORM.

           DISPLAY "Digite a primeira nota:" AT 0510
           DISPLAY "valores" AT 0548
           PERFORM UNTIL (NOTA1 >= 0) AND (NOTA1 <= 20)
               ACCEPT IN-NOTA AT 0545
               MOVE IN-NOTA TO NOTA1
           END-PERFORM.

           DISPLAY "Digite a segunda nota:" AT 0610
           DISPLAY "valores" AT 0648
           PERFORM UNTIL (NOTA2 >= 0) AND (NOTA2 <= 20)
               ACCEPT IN-NOTA AT 0645
               MOVE IN-NOTA TO NOTA2
           END-PERFORM.

           DISPLAY "Digite a terceira nota:" AT 0710
           DISPLAY "valores" AT 0748
           PERFORM UNTIL (NOTA3 >= 0) AND (NOTA3 <= 20)
               ACCEPT IN-NOTA AT 0745
               MOVE IN-NOTA TO NOTA3
           END-PERFORM.

           DISPLAY "Digite a quarta nota:" AT 0810
           DISPLAY "valores" AT 0848
           PERFORM UNTIL (NOTA4 >= 0) AND (NOTA4 <= 20)
               ACCEPT IN-NOTA AT 0845
               MOVE IN-NOTA TO NOTA4
           END-PERFORM.

           DISPLAY "Numero de horas de falta:" AT 0910
           DISPLAY "horas" AT 0948
           PERFORM UNTIL (NFALTAS >= 0)
               ACCEPT IN-NOTA AT 0945
               MOVE IN-NOTA TO NFALTAS
           END-PERFORM.


       CALC-AVG-PROCEDURE.
           COMPUTE MEDIA = (NOTA1+NOTA2+NOTA3+NOTA4)/4
           COMPUTE M-FALTAS = MEDIA-(NFALTAS/2)
           MOVE M-FALTAS TO M-FALTAS-M.


       REPORT-PROCEDURE.
           IF NFALTAS > 26
               DISPLAY "XXXXXX REPROVADO XXXXXX" AT 1135
               GO TO 666
           END-IF.


           DISPLAY "------------------------------" AT 1331
           DISPLAY "A media do aluno:" AT 1435
           DISPLAY "O aluno:" AT 1535
           DISPLAY "------------------------------" AT 1731

           MOVE MEDIA TO NOTA-M.
           DISPLAY NOTA-M AT 1453
           DISPLAY NOME AT 1544



           IF MEDIA >= 10
               DISPLAY "O aluno esta' aprovado." AT 1635
               GO TO 666
           END-IF.

           IF NFALTAS > (MEDIA * 2)
               DISPLAY "O aluno esta' reprovado." AT 1635
               DISPLAY "O aluno esta' reprovado por faltas" AT 1810
               DISPLAY "com o valor de:        valores" AT 1845
               MOVE M-FALTAS TO M-FALTAS-M
               DISPLAY M-FALTAS-M AT 1861
               GO TO 666
           END-IF.

      * ============ Caso seja necessário ir a exame
           DISPLAY "O aluno esta' reprovado." AT 1635

           DISPLAY "Digite a nota do exame:" AT 1910
           PERFORM UNTIL (EXAME >= 0) AND (EXAME <= 20)
               ACCEPT IN-NOTA AT 1945
               MOVE IN-NOTA TO EXAME
           END-PERFORM

           COMPUTE NOTA-F = (MEDIA + EXAME)/2
           MOVE NOTA-F TO NOTA-M

           DISPLAY "------------------------------" AT 2031
           DISPLAY "A media do aluno:" AT 2135
           DISPLAY "O aluno:" AT 2235
           DISPLAY "------------------------------" AT 2431
           MOVE NOTA-F TO NOTA-M
           DISPLAY NOTA-M AT 2153
           DISPLAY NOME AT 2244


           IF NOTA-F < 10
               DISPLAY "O aluno esta' reprovado." AT 2335
           ELSE
               DISPLAY "O aluno esta' aprovado." AT 2335
           END-IF.

           GO TO 666.



       END PROGRAM PRODUCAO1-NOTA-ESCOLAR.
