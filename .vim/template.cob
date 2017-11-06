      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc -x
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NEW-PROGRAM.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *SELECT Mnemonic ASSIGN TO "filename.dat".
       DATA DIVISION.
       FILE SECTION.
      *FD OilsFile.
      *01 Record.
       WORKING-STORAGE SECTION.
      *01 SomeVariable PIC X VALUE SPACE.
       PROCEDURE DIVISION.
       Begin.
           DISPLAY "Hello World"
           STOP RUN.
       END PROGRAM NEW-PROGRAM.




