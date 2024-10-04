/* Sistema experto de diagnóstico de enfermedades
 * Para arrancar el programa se debe escribir la
 * palabra "iniciar",
 * Al momento de ejecutarse, ir respondiendo las preguntas 
 * con las repustas: "si2, "s", o "no", "n"
*/

iniciar:-
  analisis(Enfermedad),
        ( (Enfermedad == desconocido) -> write('Tu diagnostico es: '); write('es probable que tengas: '), true),
        write(Enfermedad),
        nl,
        write('¡Qué te mejores! '),
        deshacer.

/* Tipos de enfermedades que se evaluarán */
analisis(resfriado)   :- resfriado, !.
analisis(gripa)       :- gripa, !.
analisis(tifoidea)    :- tifoidea, !.
analisis(sarampion)   :- sarampion, !.
analisis(malaria)     :- malaria, !.
analisis(covid)       :- covid, !.
analisis(desconocido). /*sin diagnóstico*/

/*Reglas de identificación de la enfermedad*/
resfriado :-
    verificar('Dolor de cabeza'),
    verificar('Escurrimiento nasal'),
    verificar('Estornudos'),
    verificar('Dolor de garganta'),
    write('Consejos y sugerencias de tratamiento'),
    nl,
    write('1. Tylenol/tab'),
    nl,
    write('2: Panadol/tab'),
    nl,
    write('3: Spray para la nariz'),
    nl,
    write('Por favor, guarda reposo y mantente abrigado. '),
    nl.
gripa :- 
    verificar('Calentura'),
    verificar('Dolor de cabeza'),
    verificar('Escalofrios'),
    verificar('Cuerpo cortado'),
    write('Consejos y sugerencias de tratamiento: '),
    nl,
    write('1: Tamigripa/tab'),
    nl,
    write('2: Panadol/tab'),
    nl,
    write('3: Zanamivir/tab'),
    nl,
    write('Por favor, toma un baño tibio y haz gárgaras con sal porque '),
    nl.
tifoidea :-
    verificar('Dolor de cabeza'),
    verificar('Dolor abdominal'),
    verificar('Poco apetito'),
    verificar('Calentura'),
    write('Consejos y sugerencias de tratamiento: '),
    nl,
    write('1: Chloramphenicol/tab'),
    nl,
    write('2: Amoxicilina/tab'),
    nl,
    write('3: Ciprofloxacino/tab'),
    nl,
    write('4: Azithromycin/tab'),
    nl,
    write('Por favor, guarda reposo absoluto y sigue una dieta blanda porque '),
    nl.
sarampion :-
    verificar('Calentura'),
    verificar('Escurrimiento nasal'),
    verificar('Ronchas'),
    verificar('Conjuntivitis'),
    write('Consejos y sugerencias de tratamiento: '),
    nl, 
    write('1: Tylenol/tab'),
    nl,
    write('2: Aleve/tab'),
    nl,
    write('3: Advil/tab'),
    nl,
    write('4: Vitamin A'),
    nl,
    write('Descansa y toma muchos líquidos porque '),
    nl.
malaria:-
    verificar('Calentura'),
    verificar('Suda mucho'),
    verificar('Dolor de cabeza'),
    verificar('Náuseas'),
    verificar('Vómitos'),
    verificar('Diarrea'),
    write('Consejos y sugerencias de tratamiento: '),
    nl, 
    write('1: Aralen/tab'),
    nl,
    write('2: Qualaquin/tab'),
    nl,
    write('3: Plaquenil/tab'),
    nl,
    write('4: Mefloquine'),
    nl,
    write('Por favor, no duermas  a la intemperie y cubre todo tu cuerpo porque '),
    nl.
    
covid:-
    verificar('Dolor de cabeza'),
    verificar('Cuerrpo cortado'),
    verificar('Perdida del olfato'),
    verificar('Calentura'),
    verificar('Estornudos'),
    verificar('Fatiga'),
    verificar('Perdida del gusto'),
    write('Consejos y sugerencias de tratamiento'),
    nl,
    write('1: Tylenol/tab'),
    nl,
    write('2: Motrin/tab'),
    nl,
    write('3: Advil/tab'),
    nl,
    write('Por favor no salgas de casa ni tengas contacto con otras personas'),
    nl.
/*Realizar preguntas*/
preguntar(Pregunta) :-
    write('El paciente tiene alguno de estos sintomas: '),
    write(Pregunta),
    write('? '),
    read(Respuesta),
    nl,
    ( (Respuesta == si; Respuesta == s) -> assert(si(Pregunta)) ; assert(no(Pregunta)), fail).

:- dynamic si/1,no/1.

/*
 * Verifica si existe algún sintoma que se haya evaluado anteriormente,
 * en caso de que no, realiza una pregunta en relación a dicho síntoma.
 *
 */
verificar(S) :-
   (si(S) -> true ; (no(S) -> fail ; preguntar(S))).

/* Limpia la base de conocimiento de los síntomas evaluados */
deshacer :- retract(si(_)),fail.
deshacer :- retract(no(_)),fail.
deshacer.
