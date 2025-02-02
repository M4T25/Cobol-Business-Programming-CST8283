      ******************************************************************
      * Author: Matthew Gumienny
      * Date: 2023-11-27
      * Purpose: A line sequential file (inventory file) is to be read
      *          in order to convert it to an Indexed Sequential file.
      * Tectonics: cob
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB9.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INVENT-FILE
           ASSIGN TO "../INPUT-INVENTORY-FILE.TXT"
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT INDEXED-INVENT-FILE
           ASSIGN TO "../OUTPUT-INVENTORY-FILE.IDX"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS INVENTORY-ID-OUT
           ALTERNATE KEY IS VENDOR-NAME-OUT WITH DUPLICATES.

       DATA DIVISION.
       FILE SECTION.
       FD INVENT-FILE.
       01 INVENTORY-RECORD-IN.
           05 INVENTORY-ID PIC X(9).
           05 VENDOR-NAME PIC X(20).
           05 INVENTORY-DESCRIPTION PIC X(40).

       FD INDEXED-INVENT-FILE.
       01 INVENTORY-RECORD-OUT.
           05 INVENTORY-ID-OUT PIC X(9).
           05 VENDOR-NAME-OUT PIC X(20).
           05 INVENTORY-DESCRIPTION-OUT PIC X(40).

       WORKING-STORAGE SECTION.
       01 EOF-FLAG PIC A(3).
       PROCEDURE DIVISION.
       100-CREATE-INVENTORY-FILE.
           PERFORM 101-INITIALIZE-CREATE-FILE.
           PERFORM 102-CREATE-INVENTORY-RECORDS.
           PERFORM 103-TERMINATE-PROGRAM.
           STOP RUN.

       101-INITIALIZE-CREATE-FILE.
       PERFORM 201-OPEN-INV-FILES.

       102-CREATE-INVENTORY-RECORDS.
       PERFORM 202-READ-INVENT-FILE UNTIL EOF-FLAG = "YES".
       PERFORM 203-WRITE-IND-INV-RECORD.

       103-TERMINATE-PROGRAM.
       CLOSE INVENT-FILE.
       CLOSE INDEXED-INVENT-FILE.

           201-OPEN-INV-FILES.
           OPEN INPUT INVENT-FILE.
           OPEN OUTPUT INDEXED-INVENT-FILE.

           202-READ-INVENT-FILE.
           READ INVENT-FILE
            AT END MOVE "YES" TO EOF-FLAG.


           203-WRITE-IND-INV-RECORD.
               MOVE INVENTORY-ID TO INVENTORY-ID-OUT.
               MOVE VENDOR-NAME TO VENDOR-NAME-OUT.
               MOVE INVENTORY-DESCRIPTION TO INVENTORY-DESCRIPTION-OUT.
             WRITE INVENTORY-RECORD-OUT.


       EXIT PROGRAM.
