       IDENTIFICATION DIVISION.
       PROGRAM-ID. REGISTO-DE-VOO.
      *=================================================================
      * Purpose: Read a PS file with date, time and coordinates
      *          and display it on screen.
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
       OPEN INPUT FLIGHT-POSITIONS.
           PERFORM UNTIL WS-EOF="NO-MORE-DATA"
               READ FLIGHT-POSITIONS INTO WS-POSITION
                   AT END MOVE "NO-MORE-DATA" TO WS-EOF
                   NOT AT END PERFORM SHOW-RECORD-PROCEDURE
               END-READ
           END-PERFORM.

       CLOSE FLIGHT-POSITIONS.
       STOP RUN.

       SHOW-RECORD-PROCEDURE.
       DISPLAY SYEAR "-" SMONTH "-" SDAY " " SHOUR ":" SMINUTE ":"
      -    SSECOND " LAT: " LAT " LON: " LON
      -    "  ALT: " ALTITUDE.

       END PROGRAM REGISTO-DE-VOO.
