{@author: Lara Carrión}


program ppt; 

        USES crt;

        TYPE

                tSeleccion = (Piedra, Papel, Tijeras);
                tResultado= (GanaMaquina, GanaHumano, Empate);
                rangoEnteros= 1..3;

        VAR

                cEmpate, cMaquina, cUser, contador: integer;
                resFinal: tResultado;
                terminado: boolean;



{////////////////////// DECLARACIÓN DE SUBPROGRAMAS ////////////////////////}

{===========================================================================}

{ Esta función se encarga de la elección aleatoria de la máquina. Para ello,
se utiliza la función random, que genera un número aleatorio que luego ser 
asignado al resultado, convirtiéndose en Piedra, Papel o Tijeras }

        FUNCTION eleccionMaquina: tSeleccion;

                VAR

                 eMaq: integer;
                 resMaq: tSeleccion;

                BEGIN

                 randomize;
                 eMaq:= random(3)+1;

                 CASE eMaq OF
                        1: resMaq:= Piedra;
                        2: resMaq:= Papel;
                        3: resMaq:= Tijeras;
                 end;

                 eleccionmaquina:= resMaq;

        END; (* FUNCTION eleccionMaquina *)

{===========================================================================}

{ Este procedimiento transforma el entero elegido por el usuario en un valor
del tipo tSeleccion }

        PROCEDURE transformacion (euser: rangoEnteros; VAR resUser: tSeleccion);

              VAR

                 eleccionUsuario: tSeleccion;

              BEGIN

                   CASE euser OF
                        1: eleccionUsuario:= Piedra;
                        2: eleccionUsuario:= Papel;
                        3: eleccionUsuario:= Tijeras;
                   END;

                   resUser := eleccionUsuario;

              END; (* PROCEDURE transformacion *)

{===========================================================================}

{ Este procedimiento hace el recuento de partidas jugadas y ganadas }

        PROCEDURE devuelveGanadas (resFinal: tResultado; VAR cEmpate, cMaquina, cUser,contador:integer);

              BEGIN

                IF (resFinal = Empate) THEN cEmpate:=cEmpate+1;
                IF (resFinal = ganaMaquina) THEN cMaquina:=cMaquina+1;
                IF (resFinal = ganaHumano) THEN cUser:= cUser+1;
                contador:=contador+1;

              END; (* PROCEDURE devuelveGanadas *)

{===========================================================================}

{ Este procedimiento muestra por pantalla el número de partidas jugadas, las
ganadas por la máquina, las ganadas por el usuario y las empatadas }

        PROCEDURE mostrarPuntuacionMaq (cEmpate, cMaquina, cUsuario, contador: integer);


               BEGIN

                writeln;
                writeln('###########################################');
                writeln('           RESUMEN DE PARTIDAS             ');
                writeln('###########################################');
                writeln('+ Partidas jugadas: ',contador);
                writeln('+ Empates: ', cEmpate);
                writeln('+ Máquina: ', cMaquina);
                writeln('+ Usuario: ', cUsuario);
                writeln('###########################################');

                END; (* PROCEDURE mostrarPuntuacion *)

{===========================================================================}

{ Este procedimiento muestra por pantalla el número de partidas jugadas, las
ganadas por el usuario 1, las ganadas por el usuario 2 y las empatadas }

        PROCEDURE mostrarPuntuacionUser (cEmpate, cUser1, cUser2, contador: integer);


               BEGIN

                writeln;
                writeln('###########################################');
                writeln('           RESUMEN DE PARTIDAS             ');
                writeln('###########################################');
                writeln('+ Partidas jugadas: ',contador);
                writeln('+ Empates: ', cEmpate);
                writeln('+ Jugador1: ', cUser1);
                writeln('+ Jugador2: ', cUser2);
                writeln('###########################################');

                END; (* PROCEDURE mostrarPuntuacion *)

{===========================================================================}

{ Esta función acepta cada una de las elecciones y decide quién de los dos es
el ganador de la partida o si se ha producido un empate }

        FUNCTION computar (resUser, eleccionMaquina: tSeleccion): tResultado;

               VAR
                resFinal: tResultado;

               BEGIN
                 IF (resUser = eleccionMaquina) THEN BEGIN
                 resFinal:= Empate;
                 writeln('Se ha producido un EMPATE.');
                 writeln;
                 END

                ELSE BEGIN

                   IF ((resUser = piedra) AND (eleccionMaquina=papel)) or ((resUser=papel) and (eleccionMaquina=tijeras))
                       or ((resUser= tijeras) and (eleccionMaquina = piedra)) then begin
                         resFinal:= ganaMaquina;
                         writeln('Mala suerte. La MÁQUINA gana la partida.');
                         writeln;
                   END;

                   IF ((resUser = piedra) and (eleccionMaquina=tijeras)) or ((resUser=papel) and (eleccionMaquina=piedra))
                      or ((resUser=tijeras) and (eleccionMaquina=papel)) then begin
                        resFinal:= ganaHumano;
                        writeln('Enhorabuena. HAS ganado la partida.');
                        writeln;
                   END;

                END;
                computar:= resFinal;
                devuelveganadas(resFinal, cEmpate, cMaquina, cUser,contador);

        END; (* FUNCTION computar *)

{===========================================================================}

{ Este procedimiento muestra por pantalla la elección de la máquina y del
jugador }

        PROCEDURE eleccionMaquina (resMaq: tSeleccion);

              BEGIN


                IF resMaq=Piedra THEN writeln('Piedra');
                IF resMaq=papel THEN writeln('Papel');
                IF resMaq=Tijeras THEN writeln('Tijeras');
              end;

        PROCEDURE eleccionUsuario (resUser: tSeleccion);
                begin


                IF resUser=Piedra THEN writeln('Piedra');
                IF resUser = Papel THEN writeln('Papel');
                IF resUser = Tijeras THEN writeln('Tijeras');

              END; (* PROCEDURE elecciones *)

{===========================================================================}

{ Este procedimiento muestra las instrucciones contra la máquina }

         PROCEDURE instruccionescontramaquina;

                BEGIN
                  clrscr;
                  writeln('*****************************************');
                  writeln('Va a jugar una partida contra la m quina');
                  writeln('*****************************************');
                  writeln('Instrucciones');
                  writeln('*****************************************');
                  writeln('Pulse 1 si su elección es PIEDRA');
                  writeln('Pulse 2 si su elección es PAPEL');
                  writeln('Pulse 3 si su elección es TIJERAS');
                  writeln('*****************************************');

         END; (* PROCEDURE instruccionescontramaquina *)

{===========================================================================}

{ Este procedimiento muestra las instrucciones contra usuario }

        PROCEDURE instruccionesContraUsuario;

                BEGIN
                 clrscr;
                  writeln('*****************************************');
                  writeln('Va a jugar una partida contra otro usuario');
                  writeln('*****************************************');
                  writeln('Instrucciones');
                  writeln('*****************************************');
                  writeln('Pulse 1 si su elecci¢n es PIEDRA');
                  writeln('Pulse 2 si su elecci¢n es PAPEL');
                  writeln('Pulse 3 si su elecci¢n es TIJERAS');
                  writeln('*****************************************');
                 end;
{===========================================================================}

{ Este procedimiento procesa una partida contra la máquina. }


        PROCEDURE jugarContraMaquina;

              VAR
                eUser:integer;
                resUser, resMaq: tSeleccion;
                resFinal: tResultado;


              BEGIN

                instruccionescontramaquina;
                resMaq:=eleccionMaquina;
                writeln('La máquina ya ha elegido. Es tu turno');
                readln(euser);
                transformacion(euser,resUser);
                write ('La máquina eligió: ');
                eleccionMaquina(resMaq);
                write('El usuario eligió: ');
                eleccionUsuario(resUser);
                resFinal:=computar(resUser, resMaq);

              END; (* PROCEDURE jugarContraMaquina *)

{===========================================================================}

        PROCEDURE jugarContraUsuario;

                VAR
                  eUser1, euser2: integer;
                  resUser1, resUser2: tSeleccion;
                  resFinal: tResultado;
                BEGIN
                  instruccionescontrausuario;
                  clrscr;
                  writeln('Turno del JUGADOR 1. Haga su elección: ');
                  readln(euser1);
                  transformacion(euser1, resuser1);
                  clrscr;
                  writeln('Turno del JUGADOR 2. Haga su elección: ');
                  readln(euser2);
                  transformacion(euser2, resuser2);
                  write('Usuario 1 eligió: ');
                  eleccionUsuario(resUser1);
                  write('Usuario 2 eligió: ');
                  eleccionUsuario(resUser2);
                  resFinal:=computar(resUser1, resUser2);
                end;
{===========================================================================}

{ Este procedimiento ejecuta la opción elegida por el usuario. Si pulsa 0,
el juego termina }

           PROCEDURE menu (opcion: integer);

                BEGIN

                  CASE opcion OF
                          1: jugarContraMaquina ;
                          2: jugarContraUsuario;
                  END;

           END; (* PROCEDURE menu *)

{===========================================================================}

{ Este procedimiento muestra un menú de opciones una vez que el usuario
ha decidido comenzar una partida. El menú sigue apareciendo hasta que
introduce una opción válida }

         PROCEDURE mostrarmenu;

                VAR
                  elec: integer;

                BEGIN

                  clrscr;
                  REPEAT
                        writeln('*********************************');
                        writeln('       Elige una opción');
                        writeln('********************************');
                        writeln('1. Jugar contra la máquina');
                        writeln('2. Jugar contra otro usuario');
                        writeln('0. Salir');
                        writeln('********************************');

                        readln(elec);

                  UNTIL (elec=0) OR (elec=1) OR (elec = 2) ;

                  IF elec<>0 THEN
                         menu(elec);

         END; (* PROCEDURE mostrarmenu *)

{===========================================================================}
{ Esta función pregunta si se desea jugar una nueva partida. En caso de que
sea que no, devuelve un booleano con true, y si es que sí, con false }

        FUNCTION preguntaOtra: boolean;

              VAR
                op: char;
                terminado:boolean;

              BEGIN

                terminado:=false;
                REPEAT
                  writeln('¿Desea jugar otra partida (S/N)?');
                  readln(op);
                  CASE op OF
                        'S': mostrarmenu;
                        'N': BEGIN
                                writeln('¡Hasta la próxima!');
                                terminado:=true;
                             END;
                  END;
              UNTIL (op='N') or (op='S');

              preguntaOtra:=terminado;

              END; (*FUNCTION preguntaOtra*)


{===========================================================================}

{ Este procedimiento muestra las reglas del juego. Pregunta al jugador si
desea iniciar una nueva partida }

        PROCEDURE muestrareglas;

                VAR
                  opc: char;

                BEGIN
                  clrscr;
                  writeln('************************************************');
                  writeln('____________________ REGLAS ____________________');
                  writeln('************************************************');
                  writeln;
                  writeln('- Piedra gana a tijeras');
                  writeln('- Papel gana a piedra');
                  writeln('- Tijeras ganan a papel');
                  writeln('- Si ambos eligen lo mismo, se produce un empate');
                  writeln('************************************************');

                  REPEAT
                     writeln('¿Desea jugar una partida(S/N)?');
                     readln(opc);
                     CASE opc OF
                        'S': mostrarmenu;
                        'N': writeln('¿Demasiado difícil para ti? Mira las puntuaciones: ');
                     END;

                  UNTIL (opc='N') OR (opc='S');

         END; (* PROCEDURE muestrareglas *)

{===========================================================================}

{ Este procedimiento mustra una bienvenida al juego y pregunta al usuario
si desea que se muestren las instrucciones }

        PROCEDURE bienvenida;

                VAR
                  op: char;

                BEGIN
                  writeln('******************************************');
                  writeln('****** JUEGO PIEDRA, PAPEL O TIJERAS *****');
                  writeln('******************************************');
                  writeln;
                  writeln('Bienvenido al juego Piedra, Papel o Tijeras.');

                  REPEAT
                    writeln('¿Desea que se muestren las instrucciones?(S/N)');
                    readln(op);
                    CASE op OF
                        'S': muestrareglas;
                        'N': writeln('¿Estás seguro? Mira las estadísticas: ');
                    END;

                  UNTIL (op='N') OR (op='S');

         END; (*PROCEDURE bienvenida*)

{===========================================================================}

{////////////////////////// PROGRAMA PRINCIPAL ////////////////////////////}

BEGIN

   clrscr;
   cEmpate:=0;
   cMaquina:=0;
   cUser:=0;
   contador:=0;
   terminado:=false;
   bienvenida;

   REPEAT

     mostrarpuntuacion(cEmpate, cMaquina, cUser, contador);
     terminado:= preguntaOtra;

   UNTIL (terminado= true);

END. (* PROGRAMA PRINCIPAL *)
