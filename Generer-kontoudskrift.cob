       IDENTIFICATION DIVISION.
       PROGRAM-ID. GENKONTOUDSKRIFT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TRANSAKTIONSFIL ASSIGN TO "Transaktioner.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD TRANSAKTIONSFIL.
       01 TRANSAKTION-RECORD.
        COPY "DataStruktur/TRANSAKTIONER.cpy".
       
       WORKING-STORAGE SECTION.
       01 END-OF-TRANSAKTIONER PIC X   VALUE "N".

       PROCEDURE DIVISION.
       OPEN INPUT TRANSAKTIONSFIL
       
       PERFORM UNTIL END-OF-TRANSAKTIONER = "Y"
           READ TRANSAKTIONSFIL INTO TRANSAKTION-RECORD
               AT END
                   MOVE "Y" TO END-OF-TRANSAKTIONER
               NOT AT END
                   DISPLAY "---------------------------------------"
                   DISPLAY "CPR:              " CPR
                   DISPLAY "NAVN:             " NAVN
                   DISPLAY "ADRESSE:          " ADRESSE
                   DISPLAY "FODSELSDATO:      " FØDSELSDATO
                   DISPLAY "KONTO-ID:         " KONTO-ID
                   DISPLAY "REG-NUMMER:       " REG-NUMMER
                   DISPLAY "BELOB:            " BELØB
                   DISPLAY "VALUTA:           " VALUTA
                   DISPLAY "TRANSAKTIONSTYPE: " TRANSAKTIONSTYPE
                   DISPLAY "BUTIK:            " BUTIK
                   DISPLAY "TIDSPUNKT:        " TIDSPUNKT
                   DISPLAY "---------------------------------------"
                   DISPLAY " "
       END-PERFORM

       CLOSE TRANSAKTIONSFIL

       STOP RUN.
