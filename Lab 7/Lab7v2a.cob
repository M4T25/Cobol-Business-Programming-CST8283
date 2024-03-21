      ******************************************************************
      * Author: Matthew Gumienny
      * Date: 2023-11-11
      * Purpose: accept a gas value from the keyboard and display the correct rating value.
      * Tectonics: cob
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB7-VERSION2A.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
         01 GAS PIC 9(2).
           88 LOW-GAS VALUE 0 THROUGH 5.
           88 MED-GAS VALUE 6 THROUGH 10.
           88 HIGH-GAS VALUE 11 THROUGH 15.
           88 VERY-HIGH-GAS VALUE 16 THROUGH HIGH-VALUES.
         01 RATING PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Enter gas value: ".
            ACCEPT GAS.

            IF LOW-GAS THEN
                MOVE 'E' TO RATING
            ELSE IF MED-GAS THEN
                MOVE 'G' TO RATING
            ELSE IF HIGH-GAS THEN
                MOVE 'F' TO RATING
            ELSE IF VERY-HIGH-GAS THEN
                MOVE 'P' TO RATING
            END-IF.

            DISPLAY "Rating: " RATING.
            STOP RUN.
       END PROGRAM LAB7-VERSION2A.
