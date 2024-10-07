% Hechos.
derivaDe( musica_celta, musica_clasica_europea ).
derivaDe( folk_anglosajon, musica_celta ).
derivaDe( country, folk_anglosajon ).
derivaDe( rockabilly, country ).
derivaDe( rockabilly, rock_and_roll ).
derivaDe( danzon, musica_clasica_europea ).
derivaDe( mambo, danzon ).
derivaDe( cha_cha_cha, mambo ).
derivaDe( rock_sinfonico, musica_clasica_europea ).
derivaDe( rock_progresivo, musica_clasica_europea ).
derivaDe( musica_electroacustica, musica_clasica_europea ).
derivaDe( rock_sinfonico, rock_and_roll ).
derivaDe( rock_progresivo, rock_and_roll ).
derivaDe( rock_psicodelico, rock_and_roll ).
derivaDe( musica_electroacustica, musica_electronica ).
derivaDe( vals, musica_clasica_europea ).
derivaDe( ragtime, musica_clasica_europea ).
derivaDe( trash_metal, rock_progresivo ).
derivaDe( trash_metal, heavy_metal ).
derivaDe( metalcore, trash_metal ). 
derivaDe( hard_rock, rock_and_roll ).
derivaDe( heavy_metal, hard_rock ).
derivaDe( goth_metal, heavy_metal ).
derivaDe( death_metal, heavy_metal ). 
derivaDe( new_wave_american_metal, death_metal ).
derivaDe( grindcore, trash_metal ).
derivaDe( nu_metal, metalcore ).
derivaDe( grindcore, black_metal ). 
derivaDe( the_pop, rock_and_roll ). 
derivaDe( punk, rock_and_roll ).
derivaDe( hardcore, punk ).
derivaDe( grunge, hardcore ).
derivaDe( nu_metal, grunge ).
derivaDe( nu_metal, hip_hop ).
derivaDe( cumbe, musica_africana ).
derivaDe( cumbia, cumbe ).
derivaDe( milonga, musica_africana ).
derivaDe( candombe, musica_africana ).
derivaDe( ragtime, musica_africana ).
derivaDe( calipso, musica_africana ).
derivaDe( tango, milonga ).
derivaDe( tango, candombe ).
derivaDe( tango, vals ).
derivaDe( jazz, ragtime ). 
derivaDe( ska, calipso ). 
derivaDe( rock_progresivo, jazz ).
derivaDe( soul, jazz ).
derivaDe( funk, jazz ). 
derivaDe( swing, jazz ). 
derivaDe( blues, musica_africana ).
derivaDe( rhythm_and_blues, blues ).
derivaDe( the_pop, rhythm_and_blues ).
derivaDe( rock_and_roll, rhythm_and_blues ).
derivaDe( doo_wop, rhythm_and_blues ).
derivaDe( ska, rhythm_and_blues ).
derivaDe( rhythm_and_blues, swing ). 
derivaDe( gospel, musica_africana ).
derivaDe( soul, gospel ).
derivaDe( disco, soul ). 
derivaDe( bebop, swing ). 
derivaDe( disco, funk ).
derivaDe( house, disco ).
derivaDe( funk_rock, funk ).
derivaDe( funk_rock, rock_and_roll ).
derivaDe( ska_punk, ska ).
derivaDe( ska_punk, punk ).
derivaDe( rocksteady, ska ).
derivaDe( reggae, rocksteady ).
derivaDe( dub, reggae ).
derivaDe( hip_hop, dub ).
derivaDe( industrial, punk ).
derivaDe( new_wave, punk ).
derivaDe( synthpop, new_wave ).
derivaDe( new_wave, punk ).
derivaDe( hip_hop, electro ).
derivaDe( jungle, hip_hop ).
derivaDe( jungle, musica_electronica ).
derivaDe( electro, musica_electronica ).
derivaDe( techno, electro ).
derivaDe( trance, techno ).
derivaDe( techno, house ).
derivaDe( house, musica_electronica ).

% Consultas
derivaA( X, Y ):- derivaDe( Y, X ).

% Reglas

% 1. Influencias directas e indirectas
influencias(X, Y) :- derivaDe(X, Y).
influencias(X, Y) :- derivaDe(X, Z), influencias(Z, Y).

% 2. Derivados directos e indirectos
derivados(X, Y) :- derivaDe(Y, X).
derivados(X, Y) :- derivaDe(Z, X), derivados(Z, Y).

% 3. Relación entre géneros (comparten alguna influencia)
relacionados(X, Y) :- influencias(X, Z), influencias(Y, Z).
relacionados(X, Y) :- derivados(X, Z), derivados(Y, Z).

% 4. Ancestro común más cercano
ancestro_comun(X, Y, Z) :- influencias(X, Z), influencias(Y, Z).

% 5. Distancia entre géneros (en pasos de derivación)
distancia(X, Y, 1) :- derivaDe(X, Y).
distancia(X, Y, D) :- derivaDe(X, Z), distancia(Z, Y, D1), D is D1 + 1.