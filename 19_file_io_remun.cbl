       IDENTIFICATION DIVISION.
       PROGRAM-ID. MONEY.
      *=================================================================
      * Purpose: Read a file with salary data and display it on screen.
      * Author:  Victor Domingos
      * Date:    2019-10-24
      * License: MIT
      *=================================================================
       ENVIRONMENT DIVISION.
      *-----------------------------------------------------------------
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
      *-----------------------------------------------------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT MONEY-IN ASSIGN TO "..\input_remun.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT MONEY-OUT ASSIGN TO "..\output-remun.txt".


       DATA DIVISION.
       FILE SECTION.
           FD MONEY-IN.
       01  MONEY-IN-FILE.
           05 INOME PIC X(15).
           05 IAPELIDO PIC X(15).

           05  IBIRTHDAY.
               06 IBD-DAY PIC 99.
               06 IBD-MONTH PIC 99.
               06 IBD-YEAR PIC 9(4).

           05 ICATEGORIA PIC X(20).
           05 ISECCAO PIC X(20).

           05  IHORARIO.
               06 IHH-ENTRADA PIC 99.
               06 IMM-ENTRADA PIC 99.
               06 IHH-SAIDA PIC 99.
               06 IMM-SAIDA PIC 99.

               06 IHH-INTERVALO-INICIO PIC 99.
               06 IMM-INTERVALO-INICIO PIC 99.
               06 IHH-INTERVALO-FIM PIC 99.
               06 IMM-INTERVALO-FIM PIC 99.

           05 IHORAS-SEMANAIS.
               06 IHH-SEMANA PIC 99.
               06 IMM-SEMANA PIC 99.

           05 IREMUNERATION PIC 9999V99.


           FD MONEY-OUT.
       01  MONEY-OUT-FILE.
           05 ONOME PIC X(15).
           05 FILLER          PIC X(2) VALUE SPACES.
           05 OAPELIDO PIC X(15).
           05 FILLER          PIC X(2) VALUE SPACES.

           05 OCATEGORIA PIC X(20).

           05 FILLER          PIC X(2) VALUE SPACES.
           05 OHORAS-SEMANAIS PIC X(19).

           05 FILLER          PIC X(2) VALUE SPACES.
           05 OREMUNERATION PIC X(11) VALUE SPACES.


       WORKING-STORAGE SECTION.
       01  WS-MONEY.
           05 WNOME PIC X(15).
           05 WAPELIDO PIC X(15).

           05  WBIRTHDAY.
               06 WBD-DAY PIC 99.
               06 WBD-MONTH PIC 99.
               06 WBD-YEAR PIC 9(4).

           05 WCATEGORIA PIC X(20).
           05 WSECCAO PIC X(20).

           05  WHORARIO.
               06 WHH-ENTRADA PIC 99.
               06 WMM-ENTRADA PIC 99.
               06 WHH-SAIDA PIC 99.
               06 WMM-SAIDA PIC 99.

               06 WHH-INTERVALO-INICIO PIC 99.
               06 WMM-INTERVALO-INICIO PIC 99.
               06 WHH-INTERVALO-FIM PIC 99.
               06 WMM-INTERVALO-FIM PIC 99.

           05 WHORAS-SEMANAIS.
               06 WHH-SEMANA PIC 99.
               06 WMM-SEMANA PIC 99.

           05 WREMUNERATION PIC 9(6).

       01  WS-EOF PIC A(1).


       PROCEDURE DIVISION.
           OPEN INPUT MONEY-IN.
           OPEN OUTPUT MONEY-OUT.

           MOVE "NOME" TO ONOME.
           MOVE "APELIDO" TO OAPELIDO.
           MOVE "CATEGORIA" TO OCATEGORIA.
           MOVE "HORAS-SEMANAIS" TO OHORAS-SEMANAIS.
           MOVE "REMUNERACAO" TO OREMUNERATION.
           WRITE MONEY-OUT-FILE.

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
           MOVE WHORAS-SEMANAIS TO OHORAS-SEMANAIS.
           MOVE WREMUNERATION TO OREMUNERATION.

           WRITE MONEY-OUT-FILE AFTER ADVANCING 1 LINE.


       END PROGRAM MONEY.
