persona(marsellus).
persona(mia).
persona(pumkin).
persona(honeyBunny).
persona(vincent).
persona(jules).
persona(winston).
persona(bernardo).
persona(bianca).
persona(charo).
persona(george).
persona(demostenes).

%pareja(Persona, Persona)
pareja(marsellus, mia).
pareja(pumkin, honeyBunny).
pareja(bernardo, bianca).
pareja(bernardo, charo).
 


%------punto 1------

saleCon(Persona, Quien):-
   pareja(Persona, Quien).
	
saleCon(Persona, Quien):-
   pareja(Quien, Persona).
   
%------punto 2------
%se agrego arriba


%------punto 3------

%trabajaPara(Empleador, Empleado)
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).

trabajaPara(Empleador, bernardo) :-
    trabajaPara(marsellus, Empleador),
	Empleador \= jules.
	
trabajaPara(Empleador, george) :-
    saleCon(bernardo, Empleador).

%------punto 4------

%------punto 5------

%------parte 2------

% Información base
% la ocupacion puede ser ladron([lugares]), mafioso(jerarquia), actriz([peliculas]), vender(loQueVende).
% personaje(Nombre, Ocupacion)
personaje(pumkin,     ladron([estacionesDeServicio, licorerias])).
personaje(honeyBunny, ladron([licorerias, estacionesDeServicio])).
personaje(vincent,    mafioso(maton)).
personaje(jules,      mafioso(maton)).
personaje(marsellus,  mafioso(capo)).
personaje(winston,    mafioso(resuelveProblemas)).
personaje(mia,        actriz([foxForceFive])).
personaje(butch,      boxeador).
personaje(bernardo,   mafioso(cerebro)).
personaje(bianca,     actriz([elPadrino1])).
personaje(elVendedor, vender([humo, iphone])).
personaje(jimmie,     vender([auto])).

% encargo(Solicitante, Encargado, Tarea). 
% las tareas pueden ser cuidar(Protegido), ayudar(Ayudado), buscar(Buscado, Lugar)
encargo(marsellus, vincent,   cuidar(mia)).
encargo(vincent,  elVendedor, cuidar(mia)).
encargo(marsellus, winston, ayudar(jules)).
encargo(marsellus, winston, ayudar(vincent)).
encargo(marsellus, vincent, buscar(butch, losAngeles)).
encargo(bernardo, vincent, buscar(jules, fuerteApache)).
encargo(bernardo, winston, buscar(jules, sanMartin)).
encargo(bernardo, winston, buscar(jules, lugano)).

amigo(vincent, jules).
amigo(jules, jimmie).
amigo(vincent, elVendedor).

%------punto 6------

esPeligroso(Persona) :-
    actividadPeligrosa(Persona).
  
esPeligroso(Persona) :-
    trabajaPara(Jefe, Persona),
	esPeligroso(Jefe).
  
actividadPeligrosa(Persona) :- 
    personaje(Persona, mafioso(maton)).
	
actividadPeligrosa(Persona) :-
    personaje(Persona, ladron(Lugares)),
	member(licorerias, Lugares).
   
%------punto 7------

sanCayetano(Persona) :-
    encargaALosCercanos(Persona).
	
encargaALosCercanos(Persona) :-
    tieneCerca(Persona, _),
    findall(Cercano, tieneCerca(Persona, Cercano), Cercanos),
	losEncarga(Persona, Cercanos).
    
losEncarga(Persona, [PrimerCercano | Cercanos]) :-
	encargo(Persona, PrimerCercano, _),
	losEncarga(Persona, Cercanos).
	
losEncarga(_, [ ]).
	
tieneCerca(Persona, Quien) :-
    amigo(Persona, Quien).
	
tieneCerca(Persona, Quien) :-
    trabajaPara(Persona, Quien).
	
tieneCerca(Persona, Quien) :-
    trabajaPara(Quien, Persona).
	
%------punto 8------

%------punto 9------

%------punto 10------
