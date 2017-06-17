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
