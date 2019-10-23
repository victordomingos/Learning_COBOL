       IDENTIFICATION DIVISION.
       PROGRAM-ID. BOOKSTORE.
      *=================================================================
      * Purpose: Read a file with book sales data and write a report.
      * Author:  Victor Domingos
      * Date:    2019-10-16
      * License: MIT
      *=================================================================
       ENVIRONMENT DIVISION.
      *-----------------------------------------------------------------
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
      *-----------------------------------------------------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT BOOK-SALES-FILE
               ASSIGN TO "..\input-bookstore.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SALES-REPORT-FILE
               ASSIGN TO "..\book-sales-report.txt".

      *=================================================================
       DATA DIVISION.
      *-----------------------------------------------------------------
       FILE SECTION.
       FD BOOK-SALES-FILE.
       01 BOOK-SALES.
           05 FTITLE      PIC X(80).
           05 FAUTHOR     PIC X(30).
           05 FPUBLISHER  PIC X(20).
           05 FISBN.
               06 FISBN-COUNTRY   PIC 999.
               06 FISBN-PUBLISHER PIC 99.
               06 FISBN-BOOK      PIC 9999.
               06 FISBN-CONTROL   PIC X(1).
           05 FQTY       PIC 9999.
           05 FPRICE     PIC 9(5).
           05 FDISCOUNT  PIC 99.

       FD SALES-REPORT-FILE.
       01 SALES-REPORT.
           05 SISBN.
               06 SISBN-COUNTRY   PIC 999.
               06 FISBN-PUBLISHER PIC 99.
               06 SISBN-BOOK      PIC 9999.
               06 SISBN-COONTROL  PIC X(1).
           05 FILLER          PIC X(5) VALUE SPACES.
           05 SQTY            PIC 9999.
           05 FILLER          PIC X(5) VALUE SPACES.
           05 SPRICE          PIC 9(5).
           05 FILLER          PIC X(5) VALUE SPACES.
           05 SDISCOUNT       PIC 99.
           05 FILLER          PIC X(5) VALUE SPACES.
           05 SINVOICED-VALUE PIC 9(8).
           05 FILLER          PIC X(5) VALUE SPACES.
           05 SOBSERVATIONS   PIC X(15).

      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.

       01 CPRICE          PIC 9(8)V99  VALUE ZERO.
       01 CDISCOUNT       PIC 99V99    VALUE ZERO.
       01 CINVOICED-VALUE PIC 9(8)V99  VALUE ZERO.
       01 CTAX            PIC 99V99    VALUE 5.00.
       01 C-TOTAL         PIC 9(10)V99 VALUE ZERO.

       01  M-PRICE        PIC Z(4)9.99.

       01  WS-EOF         PIC X(12).


      *=================================================================
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT  BOOK-SALES-FILE
           OPEN OUTPUT SALES-REPORT-FILE

           READ BOOK-SALES-FILE
               AT END MOVE "NO-MORE-DATA" TO WS-EOF
           END-READ

           PERFORM PROCESS-RECORD
           UNTIL WS-EOF="NO-MORE-DATA"


           CLOSE BOOK-SALES-FILE
           CLOSE SALES-REPORT-FILE

       STOP RUN.


       PROCESS-RECORD.

           MOVE FISBN TO SISBN.
           MOVE FQTY TO SQTY.
           MOVE FPRICE TO CPRICE.
           MOVE FDISCOUNT TO CDISCOUNT.

           COMPUTE CINVOICED-VALUE = CPRICE * FQTY
           COMPUTE CINVOICED-VALUE = CINVOICED-VALUE*(1 - CDISCOUNT/100)
           COMPUTE CINVOICED-VALUE = CINVOICED-VALUE * (1+CTAX/100).

           ADD CINVOICED-VALUE TO C-TOTAL.

           MOVE FDISCOUNT TO SDISCOUNT.
           MOVE CINVOICED-VALUE TO SINVOICED-VALUE.

           MOVE FPRICE TO SPRICE.


           IF FISBN-CONTROL IS NOT NUMERIC AND FISBN-CONTROL <> 'X'
               MOVE "INVALID ISBN" TO SOBSERVATIONS
           ELSE
               MOVE " " TO SOBSERVATIONS.


           DISPLAY SALES-REPORT.

           WRITE SALES-REPORT AFTER ADVANCING 1 LINE.

           READ BOOK-SALES-FILE
               AT END MOVE "NO-MORE-DATA" TO WS-EOF
           END-READ.


       END PROGRAM BOOKSTORE.
