       02 CPR              PIC X(15).
       02 NAVN             PIC X(30).
       02 ADRESSE          PIC X(50).
       02 FØDSELSDATO      PIC X(10).
       02 FILLER           PIC X.
       02 KONTO-ID         PIC X(12).
       02 FILLER           PIC X(2).
       02 REG-NR           PIC X(4).
       02 FILLER           PIC X(2).
       02 BELØB            PIC 9(12).9(2).
       02 VALUTA           PIC XXX.
       02 FILLER           PIC X.
       02 TRANSAKTIONSTYPE PIC X(15).
       02 FILLER           PIC X(5).
       02 BUTIK            PIC X(20).
       02 TIDSPUNKT.
           03 DATO.
               04 ÅR       PIC 9(4).
               04 FILLER   PIC X.
               04 MÅNED    PIC 99.
               04 FILLER   PIC X.
               04 DAG      PIC 99.
           03 FILLER       PIC X.
           03 KLOKKESLÆT   PIC X(15).
