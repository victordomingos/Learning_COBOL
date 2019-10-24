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
           ORGANIZATION IS SEQUENTIAL.

           SELECT MONEY-OUT ASSIGN TO "..\output-remun.txt"
           ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
           FD MONEY-IN.
       01  MONEY-IN-FILE.
           05 NOME PIC X(15).
           05 APELIDO PIC X(15).

           05  BIRTHDAY.
               06 BD-DAY PIC 99.
               06 BD-MONTH PIC 99.
               06 BD-YEAR PIC 9(4).

           05 CATEGORIA PIC X(20).
           05 SECCAO PIC X(20).

           05  HORARIO.
               06 HH-ENTRADA PIC 99.
               06 MM-ENTRADA PIC 99.
               06 HH-SAIDA PIC 99.
               06 MM-SAIDA PIC 99.

               06 HH-INTERVALO-INICIO PIC 99.
               06 MM-INTERVALO-INICIO PIC 99.
               06 HH-INTERVALO-FIM PIC 99.
               06 MM-INTERVALO-FIM PIC 99.

           05 HORAS-SEMANAIS.
               06 HH-SEMANA PIC 99.
               06 MM-SEMANA PIC 99.

           05 REMUNERATION PIC 9(6).



       01  MONEY-OUT-FILE.
           05 NOME PIC X(15).
           05 APELIDO PIC X(15).

           05  BIRTHDAY.
               06 BD-DAY PIC 99.
               06 BD-MONTH PIC 99.
               06 BD-YEAR PIC 9(4).

           05 CATEGORIA PIC X(20).
           05 SECCAO PIC X(20).

           05  HORARIO.
               06 HH-ENTRADA PIC 99.
               06 MM-ENTRADA PIC 99.
               06 HH-SAIDA PIC 99.
               06 MM-SAIDA PIC 99.

               06 HH-INTERVALO-INICIO PIC 99.
               06 MM-INTERVALO-INICIO PIC 99.
               06 HH-INTERVALO-FIM PIC 99.
               06 MM-INTERVALO-FIM PIC 99.

           05 HORAS-SEMANAIS.
               06 HH-SEMANA PIC 99.
               06 MM-SEMANA PIC 99.

           05 REMUNERATION PIC 9(6).


       WORKING-STORAGE SECTION.
       01  WS-MONEY.
           05 NOME PIC X(15).
           05 APELIDO PIC X(15).

           05  BIRTHDAY.
               06 BD-DAY PIC 99.
               06 BD-MONTH PIC 99.
               06 BD-YEAR PIC 9(4).

           05 CATEGORIA PIC X(20).
           05 SECCAO PIC X(20).

           05  HORARIO.
               06 HH-ENTRADA PIC 99.
               06 MM-ENTRADA PIC 99.
               06 HH-SAIDA PIC 99.
               06 MM-SAIDA PIC 99.

               06 HH-INTERVALO-INICIO PIC 99.
               06 MM-INTERVALO-INICIO PIC 99.
               06 HH-INTERVALO-FIM PIC 99.
               06 MM-INTERVALO-FIM PIC 99.

           05 HORAS-SEMANAIS.
               06 HH-SEMANA PIC 99.
               06 MM-SEMANA PIC 99.

           05 REMUNERATION PIC 9(6).

       01  WS-EOF PIC A(1).


       PROCEDURE DIVISION.
           OPEN INPUT MONEY-IN.
           PERFORM UNTIL WS-EOF='Y'
               READ MONEY-IN INTO WS-MONEY
                   AT END MOVE 'Y' TO WS-EOF
                   NOT AT END PERFORM WRITE-PROCEDURE
               END-READ
           END-PERFORM.
           CLOSE MONEY-IN.
           STOP RUN.


       WRITE-PROCEDURE.
           DISPLAY " "
           DISPLAY "NOME	       APELIDO        "
                   "CATEGORIA           HORAS"
                   "     REMUNERACAO"

           DISPLAY WS-MONEY.





       END PROGRAM MONEY.
