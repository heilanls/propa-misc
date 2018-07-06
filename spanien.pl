% Normalspur Fernverbindungen
normalspur(barcelona, zaragoza).
normalspur(zaragoza, guadalajara).
normalspur(zaragoza, huesca).
normalspur(guadalajara, madrid).
normalspur(madrid, toledo).
normalspur(toledo, cordoba).
normalspur(cordoba, sevilla).
normalspur(madrid, segovia).
normalspur(segovia, valladolid).

% Iberische Breitspur - Nordwesten

iberisch(valladolid, zamora).
iberisch(zamora, orense).
iberisch(valladolid, palencia).
iberisch(palencia, leon).
iberisch(leon, oviedo).
iberisch(palencia, burgos).

% Iberische Breitspur - Nordosten und Zentral

iberisch(zaragoza, teruel).
iberisch(zaragoza, huesca).
iberisch(barcelona, gerona).
iberisch(barcelona, tarragona).
iberisch(madrid, avila).
iberisch(avila, salamanca).
iberisch(madrid, guadalajara).

% Iberische Breitspur - Süden

iberisch(cordoba, jaen).
iberisch(jaen, almeria).
iberisch(cordoba, sevilla).
iberisch(sevilla, granada).
iberisch(granada, almeria).
iberisch(sevilla, huelva).
iberisch(sevilla, cadiz).

% Fuegen Sie hier unten Ihre eigenen Definitionen ein.
% Distanz2 

distanz2(A, B):-
    normalspur(A, Transit),
    normalspur(Transit, B).
distanz2(A, B):-
    normalspur(B, Transit),
    normalspur(Transit, A).
distanz2(A, B):-
    normalspur(A, B).
distanz2(A, B):-
    normalspur(B, A).

% iberische Breitspur
iverbunden(A, B):-
    iberisch(A, B).
iverbunden(A, B):-
    iberisch(B, A).
iverbunden(A, B):-
    iberisch(Transit, A),
    iverbunden(Transit, B).
iverbunden(A, B):-
    iberisch(Transit, A),
    iverbunden(B, Transit).
iverbunden(A, B):-
    iberisch(A, Transit),
    iberisch(Transit, B),
    iverbunden(Transit, B).

% Verbundenheit testen
verbunden1(A, B):-
    distanz2(A, B).
verbunden1(A, B):-
    distanz2(B, A).
verbunden1(A, B):-
    iberisch(A, B).
verbunden1(A, B):-
    iberisch(B, A).
verbunden1(A, B):-
    iberisch(A, Transit),
    normalspur(Transit, B).
verbunden1(A, B):-
    normalspur(A, Transit),
    iberisch(Transit, B).
verbunden1(A, B):-
    iverbunden(A, B).
verbunden1(A, B):-
    iverbunden(B, A).