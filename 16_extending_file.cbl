       IDENTIFICATION DIVISION.
       PROGRAM-ID. BLACK-BOX.
      *=================================================================
      * Purpose: Write date, time and coordinates into a file
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
           SELECT FLIGHT-POSITIONS ASSIGN TO "..\input.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

      *=================================================================
       DATA DIVISION.
      *-----------------------------------------------------------------
       FILE SECTION.
       FD FLIGHT-POSITIONS.
       01 POSITION-RECORD.
           05 FSYEAR     PIC 9(4).
           05 FSMONTH    PIC 9(2).
           05 FSDAY      PIC 99.
           05 FSHOUR     PIC 99.
           05 FSMINUTE   PIC 99.
           05 FSSECOND   PIC 99.
           05 FLATITUDE  PIC 99.9(15).
           05 FLONGITUDE PIC 99.9(15).
           05 FALTITUDE  PIC 9(5).

      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.

       01 WS-POSITION.
           05 SYEAR     PIC 9(4).
           05 SMONTH    PIC 9(2).
           05 SDAY      PIC 9(2).
           05 SHOUR     PIC 99.
           05 SMINUTE   PIC 99.
           05 SSECOND   PIC 99.
           05 LAT       PIC 99.9(15).
           05 LON       PIC 99.9(15).
           05 ALTITUDE  PIC 9(5).

       01 WS-EOF        PIC X(12).

      *=================================================================
       PROCEDURE DIVISION.
       OPEN EXTEND FLIGHT-POSITIONS.
           MOVE 2019 TO FSYEAR.
           MOVE 10 TO FSMONTH.
           MOVE 31 TO FSDAY.
           MOVE 22 TO FSHOUR.
           MOVE 18 TO FSMINUTE.
           MOVE 01 TO FSSECOND.
           MOVE 00.7182029800003 TO FLATITUDE
           MOVE 00.1504473815200 TO FLONGITUDE
           MOVE 10100 TO FALTITUDE
           WRITE POSITION-RECORD
           END-WRITE.
       CLOSE FLIGHT-POSITIONS.

       STOP RUN.

       END PROGRAM BLACK-BOX.
