      ******************************************************************
      * Author: Matthew Gumienny
      * Date: 2023-10-07
      * Purpose: Display car model from a text file.
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAR.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CAR-FILE-IN
               ASSIGN TO "..\CARFILE.TXT"
                   ORGANISATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD CAR-FILE-IN.
       01 CAR-RECORD-IN.
           05 CAR-MODEL PIC X(15).
           05 CAR-DATA.
               10 ENGINE PIC X(25).
               10 TOWING-CAPACITY PIC 9(8).
               10 OWNER-NAME PIC X(30).

       WORKING-STORAGE SECTION.
       01 CONTROL-FIELDS.
           05 EOF-FLG PIC X.

       PROCEDURE DIVISION.
       100-PRODUCE-CAR-LIST.
           PERFORM 201-INITIATE-CAR-LIST.
           PERFORM 202-DISPLAY-ONE-CAR-RECORD UNTIL EOF-FLG = 'Y'.
           PERFORM 203-CLOSE-CAR-FILE.

           STOP RUN.

       201-INITIATE-CAR-LIST.
           PERFORM 301-OPEN-CAR-FILE.
           PERFORM 305-READ-CAR-RECORD.

       305-READ-CAR-RECORD.
           READ CAR-FILE-IN
               AT END
                   MOVE 'Y' TO EOF-FLG.

       202-DISPLAY-ONE-CAR-RECORD.
           DISPLAY "Car model: " CAR-MODEL
           PERFORM 305-READ-CAR-RECORD.

       301-OPEN-CAR-FILE.
           OPEN INPUT CAR-FILE-IN.

       203-CLOSE-CAR-FILE.
           CLOSE CAR-FILE-IN.

       END PROGRAM CAR.
