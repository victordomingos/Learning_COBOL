       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRODUCT-PRICES.
      *=================================================================
      * Purpose: Read a file with product data and display it on screen.
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
           SELECT GAS-SALES-FILE ASSIGN TO "..\gas-sales.txt"
           ORGANIZATION IS SEQUENTIAL.
           SELECT GAS-INVOICE-FILE ASSIGN TO "..\gas-sales-invoice.txt"
           ORGANIZATION IS SEQUENTIAL.

      *=================================================================
       DATA DIVISION.
      *-----------------------------------------------------------------
       FILE SECTION.
       FD GAS-SALES-FILE.
       01 GAS-SALE.
           05 FNAME      PIC X(20).
           05 FQTY       PIC 999.
           05 FPRICE     PIC 9(5)V99.
           05 FTAX       PIC 99.

       FD GAS-INVOICE-FILE.
       01 GAS-INVOICE.
           05 INAME      PIC X(20).
           05 IQTY       PIC 999.
           05 IPRICE     PIC 9(5)V99.
           05 ITAX       PIC 99.

      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.

       01 WS-GAS-SALE.
           05 SNAME      PIC X(20).
           05            PIC A(2).
           05 SQTY       PIC 999.
           05 SPRICE     PIC 9(5)V99.
           05 STAX       PIC 99.


       01  C-LINE         PIC S9(8)V99.
       01  C-TOTAL        PIC S9(8)9V99 VALUE ZERO.

       01  M-QTY          PIC ZZ9.
       01  M-PRICE        PIC Z(4)9.99.
       01  M-LINE         PIC Z(6)9.99.
       01  M-TOTAL        PIC Z(8)9.99.

       01  WS-EOF         PIC X(12).


      *=================================================================
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM SHOW-HEAD
           OPEN INPUT  GAS-SALES-FILE
           OPEN OUTPUT GAS-INVOICE-FILE

           READ GAS-SALES-FILE
               AT END MOVE "NO-MORE-DATA" TO WS-EOF
           END-READ

           PERFORM PROCESS-RECORD
           UNTIL WS-EOF="NO-MORE-DATA"


           CLOSE GAS-SALES-FILE
           CLOSE GAS-INVOICE-FILE


       DISPLAY "--------------------+-----+-----------+--------+------"
       DISPLAY "                                  TOTAL: " M-TOTAL
       DISPLAY "------------------------------------------------------"
       STOP RUN.


       PROCESS-RECORD.

           MOVE FNAME  TO SNAME.
           MOVE FQTY   TO SQTY.
           MOVE FPRICE TO SPRICE.
           MOVE FTAX   TO STAX.

           COMPUTE C-LINE = FQTY * FPRICE * (1 + FTAX/100)
           MOVE C-LINE TO M-LINE

           ADD C-LINE TO C-TOTAL
           MOVE C-TOTAL TO M-TOTAL

           MOVE SPRICE TO M-PRICE
           MOVE SQTY   TO M-QTY.
           MOVE SPRICE TO M-PRICE.


           DISPLAY SNAME " | " M-QTY " |  "
      -        M-PRICE " | "  STAX " | " M-LINE.




           MOVE SNAME  TO INAME.
           MOVE SQTY   TO IQTY.
           MOVE SPRICE TO IPRICE.
           MOVE STAX   TO ITAX.

           WRITE GAS-INVOICE AFTER ADVANCING 1 LINE.

           READ GAS-SALES-FILE
               AT END MOVE "NO-MORE-DATA" TO WS-EOF
           END-READ.




       SHOW-HEAD.
       DISPLAY " "
       DISPLAY "-------------------------------------------------------"
       DISPLAY "       PRODUCT       | QTY |   PRICE   | TAX (%)| LINE"
       DISPLAY "---------------------+-----+-----------+--------+------"
       DISPLAY " ".


       END PROGRAM PRODUCT-PRICES.
