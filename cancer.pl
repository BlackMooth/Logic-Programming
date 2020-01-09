num(X):- between(1,7,X).

cancer:-
    num(NFNC),
    num(NFC),
    num(FNC),
    num(FC),
    10 is NFNC + NFC + FNC + FC,
    FC/(FC+FNC) > NFC/(NFC+NFNC),
    num(NFNC2),
    num(NFC2),
    num(FNC2),
    num(FC2),
    10 is NFNC2 + NFC2 + FNC2 + FC2,
    FC2/(FC2+FNC2) > NFC2/(NFC2+NFNC2),
    (FC2+FC)/(FC2+FNC2+FC+FNC) <(NFC2+NFC)/(NFC2+NFNC2+NFC+NFNC),
    write([FC,FNC,NFC,NFNC,FC2,FNC2,NFC2,NFNC2]).
    