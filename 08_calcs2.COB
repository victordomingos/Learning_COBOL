       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCS2.
      *=================================================================
      * Purpose: ADD function
      * Author:  Victor Domingos
      * Date:    2019-09-05
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
       77  X        PIC 9(10)V99 VALUE ZERO.
       77  Y        PIC 9(10)V99 VALUE ZERO.
       77  RSUM     PIC 9(10)V99 VALUE ZERO.
       77  RSUB     PIC 9(10)V99 VALUE ZERO.
       77  RMUL     PIC 9(10)V99 VALUE ZERO.
       77  RDIV     PIC 9(10)V99 VALUE ZERO.
       77  RREM     PIC 9(10)V99 VALUE ZERO.

       77  MSUM     PIC Z(8)9.99.
       77  MSUB     PIC Z(8)9.99.
       77  MMUL     PIC Z(8)9.99.
       77  MDIV     PIC Z(8)9.99.
       77  MREM     PIC Z(8)9.99.

      *=================================================================
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           DISPLAY "Enter a number:".
           ACCEPT X.
           DISPLAY "Enter another one:".
           ACCEPT Y.

           COMPUTE RSUM = X + Y.
           COMPUTE RSUB = X - Y.
           COMPUTE RMUL = X * Y.
           DIVIDE X BY Y GIVING RDIV REMAINDER RREM.

           MOVE RSUM TO MSUM.
           MOVE RSUB TO MSUB.
           MOVE RMUL TO MMUL.
           MOVE RDIV TO MDIV.
           MOVE RREM TO MREM.

           DISPLAY "SUM:            " MSUM.
           DISPLAY "SUBTRACTION:    " MSUB.
           DISPLAY "MULTIPLICATION: " MMUL.
           DISPLAY "DIVISION:       " MDIV.
           DISPLAY "REMAINDER:      " MREM.

           STOP RUN.

       END PROGRAM CALCS2.
