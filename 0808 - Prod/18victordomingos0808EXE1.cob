      *================================================================*
       IDENTIFICATION                                  DIVISION.
      *================================================================*
       PROGRAM-ID. PRODUCAO1-REMUNERACAO.
      ***************************DOCUMENTAÇÃO***************************
      ******************************************************************
      *                                                       PI 01-19 *
      *    AUTOR:      Victor Domingos, 18                             *
      *    DATA:       2019/10/30                                      *
      *    ESPECIFICACAO DO PROGRAMA: Processamento de ficheiros de    *
      *                               remuneracoes                     *
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
           SELECT MONEY-IN ASSIGN TO "..\REMUNERACAO-IN.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT MONEY-OUT ASSIGN TO "..\REMUNERACAO-OUT.txt".

      *================================================================*
       DATA                                            DIVISION.
      *================================================================*

      *----------------------------------------------------------------*
       FILE                                    SECTION.
      *----------------------------------------------------------------*
           FD MONEY-IN.
       01  MONEY-IN-FILE.
           05 INOME PIC X(9).
           05 IAPELIDO PIC X(8).
           05 IBIRTHDATE PIC 9(8).
           05 ICATEGORIA PIC X(11).

           05 IHH-ENTRADA PIC 99.
           05 IMM-ENTRADA PIC 99.
           05 IHH-SAIDA PIC 99.
           05 IMM-SAIDA PIC 99.

           05 IHH-INTERVALO-INICIO PIC 99.
           05 IMM-INTERVALO-INICIO PIC 99.
           05 IHH-INTERVALO-FIM PIC 99.
           05 IMM-INTERVALO-FIM PIC 99.

           05 IHORAS-SEMANAIS PIC 9999V99.
           05 IREMUNERATION PIC Z999.

           FD MONEY-OUT.
       01  MONEY-OUT-FILE.
           05 OAPELIDO PIC X(8) VALUE SPACES.
           05 FILLER PIC X(2).
           05 ONOME PIC X(9) VALUE SPACES.
           05 OCATEGORIA PIC X(12)  VALUE SPACES.
           05 FILLER PIC X(2).
           05 OBIRTHDATE PIC 99/99/9999.

           05 FILLER          PIC X(2) VALUE SPACES.
           05 OHORARIO.
               06 OHH-ENTRADA PIC 99.
               06 DOISPONTOS1 PIC X(1).
               06 OMM-ENTRADA PIC 99.
               06 FILLER PIC X(2) VALUE SPACES.
               06 OHH-SAIDA PIC 99.
               06 DOISPONTOS2 PIC X(1).
               06 OMM-SAIDA PIC 99.
           05 FILLER          PIC X(4) VALUE SPACES.
           05 OHORAS-SEMANAIS PIC 99.99 VALUE ZEROS.
           05 FILLER          PIC X(4) VALUE SPACES.
           05 OREMUNERATION   PIC Z(3)9.99 VALUE ZEROS.
      *----------------------------------------------------------------*
       WORKING-STORAGE                         SECTION.
      *----------------------------------------------------------------*

       01  WS-MONEY.
           05 WNOME PIC X(9).
           05 WAPELIDO PIC X(8).

           05 WBIRTHDATE PIC 9(8).

           05 WCATEGORIA PIC X(13).

           05  WHORARIO.
               06 WHH-ENTRADA PIC 99.
               06 WMM-ENTRADA PIC 99.
               06 WHH-SAIDA PIC 99.
               06 WMM-SAIDA PIC 99.

               06 WHH-INTERVALO-INICIO PIC 99.
               06 WMM-INTERVALO-INICIO PIC 99.
               06 WHH-INTERVALO-FIM PIC 99.
               06 WMM-INTERVALO-FIM PIC 99.

           05 WHORAS-SEMANAIS PIC 99.99.
           05 WREMUNERATION   PIC Z(3)9.99.

       01  WS-EOF PIC A(1).


      *----------------------------------------------------------------*
       SCREEN                                  SECTION.
      *----------------------------------------------------------------*


      *================================================================*
       PROCEDURE                                       DIVISION.
      *================================================================*
       MAIN-PROCEDURE.
           OPEN INPUT MONEY-IN.
           OPEN OUTPUT MONEY-OUT.

           PERFORM UNTIL WS-EOF='Y'
               READ MONEY-IN INTO WS-MONEY
                   AT END MOVE 'Y' TO WS-EOF
                   NOT AT END PERFORM WRITE-PROCEDURE
               END-READ
           END-PERFORM.

           CLOSE MONEY-IN.
           CLOSE MONEY-OUT.

           STOP RUN.


       WRITE-PROCEDURE.
           MOVE WNOME TO ONOME.
           MOVE WAPELIDO TO OAPELIDO.
           MOVE WCATEGORIA TO OCATEGORIA.

           MOVE WBIRTHDATE TO OBIRTHDATE.

           MOVE WHH-ENTRADA TO OHH-ENTRADA.
           MOVE ":" TO DOISPONTOS1.
           MOVE WMM-ENTRADA TO OMM-ENTRADA.

           MOVE WHH-SAIDA TO OHH-SAIDA.
           MOVE ":" TO DOISPONTOS2.
           MOVE WMM-SAIDA TO OMM-SAIDA.

           MOVE IHORAS-SEMANAIS TO OHORAS-SEMANAIS.
           MOVE IREMUNERATION TO OREMUNERATION.

           WRITE MONEY-OUT-FILE AFTER ADVANCING 1 LINE.


       END PROGRAM PRODUCAO1-REMUNERACAO.
