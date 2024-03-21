      ******************************************************************
      * Author: Matthew Gumienny
      * Date: 2012-11-18
      * Purpose: To get job type and pay from external file
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB8-PART3.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PAY-FILE
           ASSIGN TO "..\PayrollData.txt"
           ORGANISATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD PAY-FILE.
       01 PAY-FILE-RECORD.
           05 FILE-JOB-TYPE PIC X(3).
           05 FILE-PAY-VALUE PIC 9(3)V99.

       WORKING-STORAGE SECTION.
       01 WS-INDEX PIC 99.
       01 PAY-TABLE-VALUES-TBL.
           05 PAY-VALUES-TBL OCCURS 5000 TIMES.
               10 JOB-TYPE-TBLE PIC X(3).
               10 PAY-VALUE-TBLE PIC 9(3)V99.

       01 FLAGS-WORKING-FIELDS.
           05 FOUND-FLAG PIC X(3) VALUE "NO".
           05 F-FLAG PIC X(3) VALUE "NO".
           05 SUB-1 PIC 9(4).
           05 JOB-TYPE-IN PIC X(3).
           05 PAY-VALUE-EDITED PIC $$$9.99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT PAY-FILE.

           PERFORM READ-FILE UNTIL F-FLAG = "YES".

           DISPLAY "Enter Job Type:".
           ACCEPT JOB-TYPE-IN.

           PERFORM SEARCH-TABLE.

           IF FOUND-FLAG = "YES" THEN
               DISPLAY "Pay value for Job Type: "
                       JOB-TYPE-IN " is: " PAY-VALUE-EDITED
           ELSE
               DISPLAY "Job Type: " JOB-TYPE-IN
                       " not found in the table."
           END-IF.

           CLOSE PAY-FILE.
           STOP RUN.

           READ-FILE.
               READ PAY-FILE
                   AT END
                       MOVE "YES" TO F-FLAG
                   NOT AT END
                       ADD 1 TO WS-INDEX
                       MOVE PAY-FILE-RECORD TO PAY-VALUES-TBL(WS-INDEX)
                       DISPLAY PAY-VALUES-TBL(WS-INDEX)
               END-READ.


           SEARCH-TABLE.
               MOVE "NO" TO FOUND-FLAG.
               PERFORM VARYING SUB-1 FROM 1 BY 1 UNTIL SUB-1 > 5000
                   IF JOB-TYPE-IN = JOB-TYPE-TBLE(SUB-1)
                       MOVE PAY-VALUE-TBLE(SUB-1) TO PAY-VALUE-EDITED
                       MOVE "YES" TO FOUND-FLAG
                   END-IF
               END-PERFORM.
       EXIT PROGRAM.
