      ******************************************************************
      * Author: Matthew Gumienny
      * Date: 2023-11-11
      * Purpose: accept a gas value from the keyboard and display the correct rating value.
      * Tectonics: cob
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB7-VERSION1A.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
         01 GAS    PIC 9(2).
         01 RATING PIC X.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Enter gas value: ".
           ACCEPT GAS.

            IF GAS >= 0 AND GAS <= 5
                MOVE 'E' TO RATING
            ELSE IF GAS >= 6 AND GAS <= 10
                MOVE 'G' TO RATING
            ELSE IF GAS >= 11 AND GAS <= 15
                MOVE 'F' TO RATING
            ELSE
                MOVE 'P' TO RATING
            END-IF.

            DISPLAY "RATING: " RATING.

            STOP RUN.
       END PROGRAM LAB7-VERSION1A.
