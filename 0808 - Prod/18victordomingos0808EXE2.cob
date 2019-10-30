      *================================================================*
       IDENTIFICATION                                  DIVISION.
      *================================================================*
       PROGRAM-ID. PRODUCAO1-ALUGUER.
      ***************************DOCUMENTAÇÃO***************************
      ******************************************************************
      *                                                       PI 01-19 *
      *    AUTOR:      Victor Domingos, 18                             *
      *    DATA:       2019/10/30                                      *
      *    ESPECIFICACAO DO PROGRAMA: Aluguer de automoveis            *
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
           SELECT CAR-IN ASSIGN TO "..\RENTACAR-IN.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT CAR-OUT ASSIGN TO "..\RENTACAR-OUT.txt".

      *================================================================*
       DATA                                            DIVISION.
      *================================================================*

      *----------------------------------------------------------------*
       FILE                                    SECTION.
      *----------------------------------------------------------------*
           FD CAR-IN.
       01  CAR-IN-FILE.
           05 I-NOME     PIC X(20).
           05 I-INICIAL  PIC X.
           05 I-TIPO     PIC 9.
           05 I-KM       PIC 9(5).
           05 I-DIAS     PIC 999.

           FD CAR-OUT.
       01  CAR-OUT-FILE.
           05 O-NOME          PIC X(20).
           05 FILLER          PIC X(3) VALUE SPACES.
           05 O-INICIAL       PIC X.
           05 FILLER          PIC X(3) VALUE SPACES.
           05 O-TIPO-EXTENSO  PIC X(12) VALUE SPACES.
           05 FILLER          PIC X(3) VALUE SPACES.
           05 O-KM            PIC Z(4)9.
           05 FILLER          PIC X(3) VALUE SPACES.
           05 O-DIAS          PIC ZZ9.
           05 FILLER          PIC X(3) VALUE SPACES.
           05 O-MONTANTE      PIC Z(4)9.99.

      *----------------------------------------------------------------*
       WORKING-STORAGE                         SECTION.
      *----------------------------------------------------------------*
       01  WS-CAR.
           05 WS-NOME      PIC X(20).
           05 WS-INICIAL   PIC X.
           05 WS-TIPO      PIC 9.
           05 WS-KM        PIC 9(5).
           05 WS-DIAS      PIC 999.

       01  WS-TIPO-EXTENSO PIC X(12) VALUE SPACES.
       01  WS-KM2          PIC 9(5).
       01  WS-PRECO-DIA    PIC 9999V99.
       01  WS-PRECO-KM     PIC 9999V99.
       01  WS-TOT          PIC 9999V99.

       01  WS-EOF PIC A(1).

      *----------------------------------------------------------------*
       SCREEN                                  SECTION.
      *----------------------------------------------------------------*


      *================================================================*
       PROCEDURE                                       DIVISION.
      *================================================================*
       MAIN-PROCEDURE.
           OPEN INPUT CAR-IN.
           OPEN OUTPUT CAR-OUT.

           PERFORM UNTIL WS-EOF='Y'
               READ CAR-IN INTO WS-CAR
                   AT END MOVE 'Y' TO WS-EOF
                   NOT AT END PERFORM WRITE-PROCEDURE
               END-READ
           END-PERFORM.

           CLOSE CAR-IN.
           CLOSE CAR-OUT.

           STOP RUN.


       WRITE-PROCEDURE.
           MOVE WS-NOME TO O-NOME.
           MOVE WS-INICIAL TO O-INICIAL.

           EVALUATE WS-TIPO
               WHEN 1
                   MOVE "Volkswagen" TO WS-TIPO-EXTENSO
                   MOVE 10.00 TO WS-PRECO-DIA
                   MOVE 0.50 TO WS-PRECO-KM
               WHEN 2
                   MOVE "Toyota" TO WS-TIPO-EXTENSO
                   MOVE 12.50 TO WS-PRECO-DIA
                   MOVE 0.55 TO WS-PRECO-KM
               WHEN 3
                   MOVE "Mercedes" TO WS-TIPO-EXTENSO
                   MOVE 16.00 TO WS-PRECO-DIA
                   MOVE 0.65 TO WS-PRECO-KM
           END-EVALUATE.

           COMPUTE WS-KM2 = WS-KM - 75
           COMPUTE WS-TOT = WS-PRECO-KM*WS-KM2 + WS-PRECO-DIA*WS-DIAS
           MOVE WS-TOT TO O-MONTANTE

           MOVE WS-TIPO-EXTENSO TO O-TIPO-EXTENSO
           MOVE WS-KM TO O-KM.
           MOVE WS-DIAS TO O-DIAS.

           WRITE CAR-OUT-FILE AFTER ADVANCING 1 LINE.


       END PROGRAM PRODUCAO1-ALUGUER.
