       IDENTIFICATION DIVISION.
       PROGRAM-ID. GENKONTOUDSKRIFT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TRANSAKTIONSFIL ASSIGN TO "Transaktioner.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT BANKERFIL ASSIGN TO "Banker.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD TRANSAKTIONSFIL.
       01 TRANSAKTION-RECORD.
        COPY "DataStruktur/TRANSAKTIONER.cpy".
       FD BANKERFIL.
       01 BANK-RECORD.
        COPY "DataStruktur/BANKER.cpy".
       
       WORKING-STORAGE SECTION.
       01 END-OF-BANKER        PIC X   VALUE "N".
       01 END-OF-TRANSAKTIONER PIC X   VALUE "N".


       PROCEDURE DIVISION.
      * PERFORM READ-TRANSAKTIONER
      * PERFORM READ-BANKER

       STOP RUN.

       READ-BANKER.
       OPEN INPUT BANKERFIL
       PERFORM UNTIL END-OF-BANKER = "Y"
       READ BANKERFIL INTO BANK-RECORD
           AT END
               MOVE "Y" TO END-OF-BANKER
           NOT AT END
               DISPLAY "---------------------------------------"
               DISPLAY "NAVN:    " NAVN OF BANK-RECORD
               DISPLAY "REG-NR:  " REG-NR OF BANK-RECORD
               DISPLAY "ADRESSE: " ADRESSE OF BANK-RECORD
               DISPLAY "TELEFON: " TELEFON
               DISPLAY "EMAIL:   " EMAIL
       END-PERFORM
       CLOSE BANKERFIL.

       READ-TRANSAKTIONER.
       OPEN INPUT TRANSAKTIONSFIL
       PERFORM READ-TRANSAKTION UNTIL END-OF-TRANSAKTIONER = "Y"
       CLOSE TRANSAKTIONSFIL.

       READ-TRANSAKTION.
       READ TRANSAKTIONSFIL INTO TRANSAKTION-RECORD
       AT END
           MOVE "Y" TO END-OF-TRANSAKTIONER
       NOT AT END
           DISPLAY "---------------------------------------"
           DISPLAY "CPR:              " CPR
           DISPLAY "NAVN:             " NAVN OF TRANSAKTION-RECORD
           DISPLAY "ADRESSE:          " ADRESSE OF TRANSAKTION-RECORD
           DISPLAY "FODSELSDATO:      " FØDSELSDATO
           DISPLAY "KONTO-ID:         " KONTO-ID
           DISPLAY "REG-NR:           " REG-NR OF TRANSAKTION-RECORD
           DISPLAY "BELOB:            " BELØB
           DISPLAY "VALUTA:           " VALUTA
           DISPLAY "TRANSAKTIONSTYPE: " TRANSAKTIONSTYPE
           DISPLAY "BUTIK:            " BUTIK
           DISPLAY "TIDSPUNKT:        " TIDSPUNKT
           DISPLAY "---------------------------------------"
           DISPLAY " ".
