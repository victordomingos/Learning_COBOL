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
           ORGANIZATION IS LINE SEQUENTIAL.

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

      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.

       01 WS-GAS-SALE.
           05 SNAME      PIC X(20).
           05 SQTY       PIC 999.
           05 SPRICE     PIC 9(5)V99.
           05 STAX       PIC 99.

       01 WS-EOF        PIC X(12).


      *=================================================================
       PROCEDURE DIVISION.
       DISPLAY " "
       DISPLAY "       PRODUCT       | QTY |   PRICE   | TAX (%)"
       DISPLAY "---------------------+-----+-----------+---------"
       OPEN INPUT GAS-SALES-FILE.
           PERFORM UNTIL WS-EOF="NO-MORE-DATA"
               READ GAS-SALES-FILE INTO WS-GAS-SALE
                   AT END MOVE "NO-MORE-DATA" TO WS-EOF
                   NOT AT END PERFORM SHOW-RECORD-PROCEDURE
               END-READ
           END-PERFORM.

       CLOSE GAS-SALES-FILE.
       STOP RUN.

       SHOW-RECORD-PROCEDURE.
       DISPLAY SNAME " | " SQTY " |  " SPRICE " | "  STAX.

       END PROGRAM PRODUCT-PRICES.
