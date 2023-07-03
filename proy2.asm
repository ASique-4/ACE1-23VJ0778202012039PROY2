NADA        equ      00
JUGADOR     equ      01
PARED       equ      02
CAJA        equ      03
OBJETIVO    equ      04
SUELO       equ      05
.MODEL SMALL
.RADIX 16
.STACK
.DATA
dim_sprite_jug    db   08, 08
data_sprite_jug   db   95, 95, 0f, 95, 95, 95, 0f, 95
                  db   95, 95, 0f, 0f, 0f, 0f, 0f, 95
                  db   95, 95, 0f, 10, 5b, 5b, 10, 95
                  db   02, 77, 0f, 5b, 5b, 5b, 5b, 95
                  db   30, 47, 35, 36, 36, 36, 36, 95
                  db   5b, 30, 36, 36, 36, 36, 36, 5b
                  db   95, 95, 37, 37, 37, 37, 37, 95
                  db   95, 95, 5b, 95, 95, 95, 5b, 95
dim_sprite_flcha  db   08, 08
data_sprite_flcha db   00, 00, 00, 34, 00, 00, 00, 00
				  db   00, 24, 24, 2c, 24, 24, 00, 00
                  db   2c, 2c, 2c, 2c, 2c, 2c, 2c, 00
                  db   24, 24, 24, 24, 24, 24, 24, 00
                  db   24, 3c, 3c, 3c, 3c, 3c, 24, 00
                  db   24, 3c, 10, 3c, 10, 3c, 24, 00
                  db   24, 3c, 3c, 3c, 3c, 3c, 24, 00
                  db   24, 24, 3c, 3c, 3c, 24, 24, 00

dim_sprite_vacio  db   08, 08
data_sprite_vacio db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
dim_sprite_suelo  db   08, 08
data_sprite_suelo db   95, 95, 95, 95, 95, 95, 95, 95
                  db   95, 95, 95, 95, 95, 95, 95, 95
                  db   95, 95, 95, 95, 95, 95, 95, 95
                  db   95, 95, 95, 95, 95, 95, 95, 95
                  db   95, 95, 95, 95, 95, 95, 95, 95
                  db   95, 95, 95, 95, 95, 95, 95, 95
                  db   95, 95, 95, 95, 95, 95, 95, 95
                  db   95, 95, 95, 95, 95, 95, 95, 95
dim_sprite_pared  db   08, 08
data_sprite_pared db   7e, 7e, 7e, 7e, 7e, 7e, 7e, 7e
                  db   7e, 34, 34, 34, 34, 34, 34, 7e
                  db   7e, 34, 34, 34, 34, 34, 34, 7e
                  db   7e, 34, 34, 34, 34, 34, 34, 7e
                  db   7e, 34, 34, 34, 34, 34, 34, 7e
                  db   7e, 34, 34, 34, 34, 34, 34, 7e
                  db   7e, 34, 34, 34, 34, 34, 34, 7e
                  db   7e, 7e, 7e, 7e, 7e, 7e, 7e, 7e
dim_sprite_caja   db   08, 08
data_sprite_caja  db   95, 95, 95, 11, 11, 95, 95, 95
                  db   95, 95, 11, 1f, 34, 11, 95, 95
                  db   95, 11, 1f, 11, 11, 1f, 11, 95
                  db   95, 11, 34, 11, 11, 34, 11, 95
                  db   95, 95, 11, 1f, 1f, 11, 95, 95
                  db   95, 95, 11, 34, 11, 95, 95, 95
                  db   95, 95, 11, 34, 34, 11, 95, 95
                  db   95, 95, 11, 11, 11, 11, 95, 95
dim_sprite_obj    db   08, 08
data_sprite_obj   db   95, 95, 95, 11, 11, 95, 95, 95
                  db   95, 95, 11, 18, 17, 11, 95, 95
                  db   95, 11, 18, 11, 11, 18, 11, 95
                  db   95, 11, 17, 11, 11, 17, 11, 95
                  db   95, 95, 11, 18, 18, 11, 95, 95
                  db   95, 95, 11, 17, 11, 95, 95, 95
                  db   95, 95, 11, 17, 17, 11, 95, 95
                  db   95, 95, 11, 11, 11, 11, 95, 95
mapa              db   3e8 dup (0)
iniciar_juego db "INICIAR JUEGO$"
cargar_nivel  db "CARGAR NIVEL$"
configuracion db "CONFIGURACION$"
puntajes      db "PUNTAJES ALTOS$"
salir         db "SALIR$"
iniciales     db "AFSS - 202012039$"
contador_cronometro db  "00:00:00$"
puntaje_label 	  db "00000$"
;; JUEGO
mensaje_cargar db "<< CARGAR NIVEL >>$"
mensaje_indicar db "Escriba el nombre del nivel$"
nueva_lin  db    0a,"$"
prompt_nombre    db    "NOMBRE: ","$"
buffer_entrada   db  20, 00
xJugador      db 0
yJugador      db 0
xObjetivo      db 0
yObjetivo      db 0
puntos        dw 0
bandera      db 0
bandera_caja      db 0
;; MENÚS
opcion        db 0
maximo        db 0
opcion1        db 0
maximo1        db 0
opcion_Pausa        db 0
maximo_Pausa        db 0
xFlecha       dw 0
yFlecha       dw 0
xFlecha1       dw 0
yFlecha1       dw 0
xFlecha_Pausa       dw 0
yFlecha_Pausa       dw 0
mensaje_pausa db "JUEGO PAUSADO$"
;; CONTROLES
control_arriba    db  48
control_abajo     db  50
control_izquierda db  4b
control_derecha   db  4d
derecha_control db 0
izquierda_control db 0
arriba_control db 0
abajo_control db 0
mensaje_cambiar db "Cambiar Controles$"
mensaje_actuales db "Controles Actuales$"
mensaje_arriba   db "Arriba: $"
mensaje_abajo    db "Abajo: $"
mensaje_izquierda db "Izquierda: $"
mensaje_derecha  db "Derecha: $"
;; NIVELES
cod_name    	  db    20 dup (0)
nivel_1           db  "NIV.00",00
nivel_2           db  "NIV.01",00
nivel_3           db  "NIV.10",00
handle_nivel      dw  0000
linea             db  100 dup (0)
elemento_actual   db  0
xElemento         db  0
yElemento         db  0
;; TOKENS
tk_pared      db  05,"pared"
tk_suelo      db  05,"suelo"
tk_jugador    db  07,"jugador"
tk_caja       db  04,"caja"
tk_objetivo   db  08,"objetivo"
tk_coma       db  01,","
;;
numero        db  5 dup (30)
label_actuales db "Controles Actuales$"
label_arriba   db "Arriba: $"
label_abajo    db "Abajo: $"
label_izquierda db "Izquierda: $"
label_derecha  db "Derecha: $"

mensaje_cambiar_controles db "Cambiar Controles$"
nueva_tecla   db "PRESIONE UNA TECLA PARA: $"
nuevo_derecha db "DIRECCION DERECHA$"
nuevo_izquierda db "DIRECCION IZQUIERDA$"
nuevo_arriba db "DIRECCION ARRIBA$"
nuevo_abajo db "DIRECCION ABAJO$"
regresar  db "Regresar$"
mensaje_continuar db "Reanudar juego$"
mensaje_abandonar db "Abandonar juego$"
label_flecha_arriba db "FLECHA ARRIBA$"
label_flecha_abajo  db "FLECHA ABAJO$"
label_flecha_izquierda db "FLECHA IZQUIERDA$"
label_flecha_derecha  db "FLECHA DERECHA$"
mensaje_bienvenida db "BIENVENIDO A SOKOBAN$"
mensaje_datos_desarrollador db "Angel Sique - 202012039$"
.CODE
.STARTUP
mensaje_inicial:
		;; MODO VIDEO ;;
		mov AH, 00
		mov AL, 13
		int 10
		;;;;;;;;;;;;;;;;
		mov DL, 0c
		mov DH, 09
		mov BH, 00
		mov AH, 02
		int 10
		;; <<-- posicionar el cursor
		push DX
		mov DX, offset mensaje_bienvenida
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; DATOS
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset mensaje_datos_desarrollador
		mov AH, 09
		int 21
		pop DX
		;; Delay de 5 segundos
		call delay
		;;;;;;;;;;;;;;;;
		je inicio

inicio:
		;;;;;;;;;;;;;;;;
		call menu_principal
		mov AL, [opcion]
		;; > INICIAR JUEGO
		cmp AL, 0
		je ciclo_juego
		;; > CARGAR NIVEL
		cmp AL, 1
		je pedir_nivel_juego
		;; > CONFIGURACION
		cmp AL, 3
		je menu_configuracion
		;; > PUNTAJES ALTOS
		;; > SALIR
		cmp AL, 4
		je fin
		;;;;;;;;;;;;;;;;

ciclo_juego:
		call pintar_mapa
		call entrada_juego
		call pintar_nombre_prueba
		jmp ciclo_juego
		;;;;;;;;;;;;;;;;


		;;
ciclo_lineas:
		mov BX, [handle_nivel]
		call siguiente_linea
		cmp DL, 0ff      ;; fin-del-archivo?
		je fin_parseo
		cmp DH, 00      ;; línea-con-algo?
		je ciclo_lineas
		;;;;;;;;;;;;;;;;;;;;;;;
		;; lógica del parseo ;;
		;;;;;;;;;;;;;;;;;;;;;;;
		;; al principio del buffer de la línea está: pared, caja, jugador, suelo, objetivo
		mov DI, offset linea
		push DI
		mov SI, offset tk_pared
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_pared
		pop DI
		push DI
		mov SI, offset tk_caja
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_caja
		pop DI
		push DI
		mov SI, offset tk_suelo
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_suelo
		pop DI
		push DI
		mov SI, offset tk_objetivo
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_objetivo
		pop DI
		push DI
		mov SI, offset tk_jugador
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_jugador
		pop DI
		jmp ciclo_lineas
es_pared:
		mov AL, PARED
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_caja:
		mov AL, CAJA
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_suelo:
		mov AL, SUELO
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_objetivo:
		mov AL, OBJETIVO
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_jugador:
		mov AL, JUGADOR
		mov [elemento_actual], AL
		jmp continuar_parseo0
		;; ignorar espacios
continuar_parseo0:
		pop SI         ; ignorara valor inicial de DI
		mov AL, [DI]
		cmp AL, 20
		jne ciclo_lineas
		call ignorar_espacios
		;; obtener una cadena numérica
		call leer_cadena_numerica
		push DI
		mov DI, offset numero
		call cadenaAnum
		mov [xElemento], AL
		pop DI
		;; ignorar espacios
		mov AL, [DI]
		cmp AL, 20
		je continuar_parseo1
		cmp AL, ','
		je continuar_parseo2
		jmp ciclo_lineas
continuar_parseo1:
		;; ignorar espacios
		call ignorar_espacios
continuar_parseo2:
		;; obtener una coma
		mov SI, offset tk_coma
		call cadena_igual
		cmp DL, 0ff
		jne ciclo_lineas
		;; ignorar espacios
		mov AL, [DI]
		cmp AL, 20
		jne ciclo_lineas
		call ignorar_espacios
		;; obtener una cadena numérica
		call leer_cadena_numerica
		push DI
		mov DI, offset numero
		call cadenaAnum
		mov [yElemento], AL
		pop DI
		;; ignorar_espacios
		mov AL, [DI]
		cmp AL, 20
		jne ver_final_de_linea
		call ignorar_espacios
		;; ver si es el final de la cadena
ver_final_de_linea:
		mov AL, [DI]
		cmp AL, 00
		jne ciclo_lineas
		;; usar la información
		;;
		mov DL, [elemento_actual]
		mov AH, [xElemento]
		mov AL, [yElemento]
		call colocar_en_mapa
		mov AL, JUGADOR
		cmp AL, [elemento_actual]
		je guardar_coordenadas_jugador
		jmp ciclo_lineas
guardar_coordenadas_jugador:
		mov AH, [xElemento]
		mov AL, [yElemento]
		mov [xJugador], AH
		mov [yJugador], AL
		jmp ciclo_lineas
		;;;;;;;;;;;;;;;;;;;;;;;
fin_parseo:
		;; cerrar archivo
		mov AH, 3e
		mov BX, [handle_nivel]
		int 21
		;;
		int 03
		jmp ciclo_juego
		jmp fin

;; pintar_pixel - pintar un pixel
;; ENTRADA:
;;     AX --> x pixel
;;     BX --> y pixel
;;     CL --> color
;; SALIDA: pintar pixel
;; AX + 320*BX
pintar_pixel:
		push AX
		push BX
		push CX
		push DX
		push DI
		push SI
		push DS
		mov DX, 0a000
		mov DS, DX
		;; (
		;; 	posicionarse en X
		mov SI, AX
		mov AX, 140
		mul BX
		add AX, SI
		mov DI, AX
		;;
		mov [DI], CL  ;; pintar
		;; )
		pop DS
		pop SI
		pop DI
		pop DX
		pop CX
		pop BX
		pop AX
		ret

;; pintar_sprite - pinta un sprite
;; Entrada:
;;    - DI: offset del sprite
;;    - SI: offset de las dimensiones
;;    - AX: x sprite 320x200
;;    - BX: y sprite 320x200
pintar_sprite:
		push DI
		push SI
		push AX
		push BX
		push CX
		inc SI
		mov DH, [SI]  ;; vertical
		dec SI        ;; dirección de tam horizontal
		;;
inicio_pintar_fila:
		cmp DH, 00
		je fin_pintar_sprite
		push AX
		mov DL, [SI]
pintar_fila:
		cmp DL, 00
		je pintar_siguiente_fila
		mov CL, [DI]
		call pintar_pixel
		inc AX
		inc DI
		dec DL
		jmp pintar_fila
pintar_siguiente_fila:
		pop AX
		inc BX
		dec DH
		jmp inicio_pintar_fila
fin_pintar_sprite:
		pop CX
		pop BX
		pop AX
		pop SI
		pop DI
		ret

;; delay - subrutina de retardo
delay:
		push SI
		push DI
		mov SI, 1300
cicloA:
		mov DI, 0130
		dec SI
		cmp SI, 0000
		je fin_delay
cicloB:
		dec DI
		cmp DI, 0000
		je cicloA
		jmp cicloB
fin_delay:
		pop DI
		pop SI
		ret
		

;; clear_pantalla - limpia la pantalla
;; ..
;; ..
clear_pantalla:
		mov CX, 19  ;; 25
		mov BX, 00
clear_v:
		push CX
		mov CX, 28  ;; 40
		mov AX, 00
clear_h:
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		add AX, 08
		loop clear_h
		add BX, 08
		pop CX
		loop clear_v
		ret


;; menu_principal - menu principal
;; ..
;; SALIDA
;;    - [opcion] -> código numérico de la opción elegida
menu_principal:
		call clear_pantalla
		mov AL, 0
		mov [opcion], AL      ;; reinicio de la variable de salida
		mov AL, 5
		mov [maximo], AL
		mov AX, 50
		mov BX, 28
		mov [xFlecha], AX
		mov [yFlecha], BX
		;; IMPRIMIR OPCIONES ;;
		;;;; INICIAR JUEGO
		mov DL, 0c
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		;; <<-- posicionar el cursor
		push DX
		mov DX, offset iniciar_juego
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CARGAR NIVEL
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset cargar_nivel
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; PUNTAJES ALTOS
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset puntajes
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CONFIGURACION
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset configuracion
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; SALIR
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salir
		mov AH, 09
		int 21
		pop DX
		;;;;
		call pintar_flecha
		;;;;
		;; LEER TECLA
		;;;;
entrada_menu_principal:
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_principal
		cmp AH, 50
		je sumar_opcion_menu_principal
		cmp AH, 3b  ;; le doy F1
		je fin_menu_principal
		jmp entrada_menu_principal
restar_opcion_menu_principal:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero
		mov [opcion], AL
		jmp mover_flecha_menu_principal
sumar_opcion_menu_principal:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_cero:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_maximo:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_principal
mover_flecha_menu_principal:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 28
		mov CL, [opcion]
ciclo_ubicar_flecha_menu_principal:
		cmp CL, 0
		je pintar_flecha_menu_principal
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_principal
pintar_flecha_menu_principal:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_principal
		;;
fin_menu_principal:
		ret

;; pintar_flecha - pinta una flecha
pintar_flecha:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_flcha
		mov DI, offset data_sprite_flcha
		call pintar_sprite
		ret

pintar_flecha_configuracion:
		mov AX, [xFlecha1]
		mov BX, [yFlecha1]
		mov SI, offset dim_sprite_flcha
		mov DI, offset data_sprite_flcha
		call pintar_sprite
		ret

pintar_flecha_pausa:
		mov AX, [xFlecha_Pausa]
		mov BX, [yFlecha_Pausa]
		mov SI, offset dim_sprite_flcha
		mov DI, offset data_sprite_flcha
		call pintar_sprite
		ret
;; Menu Configuracion
;; ...
;; SALIDA
;;    - [opcion] -> código numérico de la opción elegida
ciclo_cambios_teclas:
cambiar_direccion_abajo:
		call clear_pantalla
        mov AL, 0
        ;; Mensaje de pausa
        mov DL, 08
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		;;
		mov DX, offset nueva_tecla
		mov AH, 09
		int 21

        mov DL, 08
		mov DH, 08
		mov BH, 00
		mov AH, 02
		int 10

        mov DX, offset nuevo_abajo
		mov AH, 09
		int 21

        mov DL, 0c
		mov DH, 08
        ;add DH, 06 
		mov BH, 00
		mov AH, 02
		int 10

        mov AH, 00 
        int 16           

        mov abajo_control, AL
        mov control_abajo, AH

cambiar_direccion_arriba:
		call clear_pantalla
        mov AL, 0
        ;; Mensaje de cambio
        mov DL, 08
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		;;
		mov DX, offset nueva_tecla
		mov AH, 09
		int 21

        mov DL, 08
		mov DH, 08
		mov BH, 00
		mov AH, 02
		int 10

        mov DX, offset nuevo_arriba
		mov AH, 09
		int 21

        mov DL, 0c
		mov DH, 08
        ;add DH, 06 
		mov BH, 00
		mov AH, 02
		int 10

        mov DL, 08
		mov DH, 08
        add DH, 06
		mov BH, 00
		mov AH, 02
		int 10

        mov AH, 00 
        int 16    
        
        mov arriba_control, AL
        mov control_arriba, AH

cambiar_direccion_derecha:
        call clear_pantalla
        mov AL, 0
        ;; Mensaje de pausa
        mov DL, 08
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		;;
		mov DX, offset nueva_tecla
		mov AH, 09
		int 21

        mov DL, 08
		mov DH, 08
		mov BH, 00
		mov AH, 02
		int 10

        mov DX, offset nuevo_derecha
		mov AH, 09
		int 21

        mov DL, 0c
		mov DH, 08
        ;add DH, 06 
		mov BH, 00
		mov AH, 02
		int 10

        mov AH, 10
        int 16
        mov derecha_control, AL     
    
        mov control_derecha, AH
cambiar_direccion_izquierda:
		call clear_pantalla
        mov AL, 0
        ;; Mensaje de cambio
        mov DL, 08
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		;;
		mov DX, offset nueva_tecla
		mov AH, 09
		int 21

        mov DL, 08
		mov DH, 08
		mov BH, 00
		mov AH, 02
		int 10

        mov DX, offset nuevo_izquierda
		mov AH, 09
		int 21

        mov DL, 0c
		mov DH, 08
		mov BH, 00
		mov AH, 02
		int 10

        mov AH, 00 
        int 16           

        mov izquierda_control, AL
        mov control_izquierda, AH


fin_ciclos_cambios:
    jmp menu_configuracion

; Menu configuracion
menu_configuracion:
        call menu_configuracion_1
		mov AL, [opcion1]
		;; CAMBIAR TECLAS
		cmp AL, 0
		je ciclo_cambios_teclas
		;; REGRESAR
		cmp AL, 1
		je inicio

menu_configuracion_1:
        call clear_pantalla
		mov AL, 0
		mov [opcion1], AL      ;; reinicio de la variable de salida
		mov AL, 2
		mov [maximo1], AL
		mov AX, 50
		mov BX, 80
		mov [xFlecha1], AX
		mov [yFlecha1], BX
		
        ;; Mensaje de controles actuales
        mov DL, 5c
		mov DH, 03
		mov BH, 00
		mov AH, 02
		int 10
		;;
		push DX
		mov DX, offset mensaje_actuales
		mov AH, 09
		int 21
		pop DX

        ;; Mensaje de control abajo
        mov DL, 09
		mov DH, 06
		mov BH, 00
		mov AH, 02
		int 10
		;;
		push DX
		mov DX, offset label_abajo
		mov AH, 09
		int 21
		pop DX

        ;; Flecha abajo
        mov DL, 10
        add DL, 04 
		mov DH, 06
		mov BH, 00
		mov AH, 02
		int 10

        cmp control_abajo, 50
        je mapear_abajo
        
        mov DX, offset abajo_control
        mov AH, 40h
        mov BX, 01
        mov CX, 0001
		int 21
        ;;

actual_control_arriba:
        ;;;
        ;; Mensaje de control arriba 
        mov DL, 09
		mov DH, 08
		mov BH, 00
		mov AH, 02
		int 10
		;;
		push DX
		mov DX, offset label_arriba
		mov AH, 09
		int 21
		pop DX
        

        ;; Flecha arriba

        mov DL, 10
        add DL, 04   
		mov DH, 08
		mov BH, 00
		mov AH, 02
		int 10

        cmp control_arriba, 48
        je mapear_arriba
		;;
		mov DX, offset arriba_control
        mov AH, 40h
        mov BX, 01
        mov CX, 0001
		int 21

actual_control_derecha:
        ;; Mensaje de control derecha 
        mov DL, 09
		mov DH, 08
        add DH, 02  
		mov BH, 00
		mov AH, 02
		int 10
		;;
		push DX
		mov DX, offset mensaje_derecha
		mov AH, 09
		int 21
		pop DX

        ;; Flecha derecha

        mov DL, 10
        add DL, 04 
		mov DH, 08
        add DH, 02  
		mov BH, 00
		mov AH, 02
		int 10
		;;

        cmp control_derecha, 4d
        je mapear_derecha
		;;
		mov DX, offset derecha_control
        mov AH, 40h
        mov BX, 01
        mov CX, 0001
		int 21


actual_control_izquierda:
        ;; Mensaje de control izquierda 
        mov DL, 09
		mov DH, 08
        add DH, 04  
		mov BH, 00
		mov AH, 02
		int 10

		push DX
		mov DX, offset mensaje_izquierda
		mov AH, 09
		int 21
		pop DX

        ;; Flecha izquierda
        mov DL, 10
        add DL, 04  
		mov DH, 08
        add DH, 04 
		mov BH, 00
		mov AH, 02
		int 10


        cmp control_izquierda, 4b
        je mapear_izquierda
		;;
		mov DX, offset izquierda_control
        mov AH, 40h
        mov BX, 01
        mov CX, 0001
		int 21

seleccionar_opcion_configuracion:

        mov DL, 0c
		mov DH, 08
        ;add DH, 06 
		mov BH, 00
		mov AH, 02
		int 10
		; ;; <<-- posicionar el cursor
        add DH, 08
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset mensaje_cambiar
		mov AH, 09
		int 21
		pop DX

        ;; regresar
        add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset regresar
		mov AH, 09
		int 21
		pop DX
		;;
		call pintar_flecha_configuracion
		;;;;
		;; LEER TECLA
entrada_menu_configuracion:
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_configuracion
		cmp AH, 50
		je sumar_opcion_menu_configuracion
		cmp AH, 3b  ;; le doy F1
		je fin_menu_configuracion
		jmp entrada_menu_configuracion

restar_opcion_menu_configuracion:
		mov AL, [opcion1]
		dec AL
		cmp AL, 0ff
		je volver_a_cero_configuracion
		mov [opcion1], AL
		jmp mover_flecha_menu_configuracion
sumar_opcion_menu_configuracion:
		mov AL, [opcion1]
		mov AH, [maximo1]
		inc AL
		cmp AL, AH
		je volver_a_maximo_configuracion
		mov [opcion1], AL
		jmp mover_flecha_menu_configuracion
volver_a_cero_configuracion:
		mov AL, 0
		mov [opcion1], AL
		jmp mover_flecha_menu_configuracion
volver_a_maximo_configuracion:
		mov AL, [maximo1]
		dec AL
		mov [opcion1], AL
		jmp mover_flecha_menu_configuracion
mover_flecha_menu_configuracion:
		mov AX, [xFlecha1]
		mov BX, [yFlecha1]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 80
		mov CL, [opcion1]
ciclo_ubicar_flecha_menu_configuracion:
		cmp CL, 0
		je pintar_flecha_menu_configuracion
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_configuracion
pintar_flecha_menu_configuracion:
		mov [xFlecha1], AX
		mov [yFlecha1], BX
		call pintar_flecha_configuracion
		jmp entrada_menu_configuracion
		;;
fin_menu_configuracion:
		ret


;; adaptar_coordenada - 40x25->320x200
;; ENTRADA:
;;    AH -> x 40x25
;;    AL -> y 40x25
;; SALIDA:
;;    AX -> x 320x200
;;    BX -> y 320x200
adaptar_coordenada:

		mov DL, 08
		mov CX, AX
		mul DL
		mov BX, AX
		;;
		mov AL, CH
		mul DL
		ret
		
;; colocar_en_mapa - coloca un elemento en el mapa
;; ENTRADA:
;;    - DL -> código numérico del elemento
;;    - AH -> x
;;    - AL -> y
;; ...
colocar_en_mapa:
		mov CX, AX     ;;;   AH -> x -> CH
		mov BL, 28
		mul BL   ;; AL * BL  = AX
		mov CL, CH
		mov CH, 00     ;;; CX el valor de X completo
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov [DI], DL
		ret


;; obtener_de_mapa - obtiene un elemento en el mapa
;; ENTRADA:
;;    - AH -> x
;;    - AL -> y
;; SALIDA:
;;    - DL -> código numérico del elemento
obtener_de_mapa:
		mov CX, AX
		mov BL, 28
		mul BL
		mov CL, CH
		mov CH, 00
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov DL, [DI]
		ret


;; pintar_mapa - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_mapa:
		mov AL, 1   ;; fila
		;;
ciclo_v:
		cmp AL, 18
		je fin_pintar_mapa
		mov AH, 00   ;; columna
		;;
ciclo_h:
		cmp AH, 28
		je continuar_v
		push AX
		call obtener_de_mapa
		pop AX
		;;
        cmp DL, NADA
		je pintar_vacio_mapa
		;;
        cmp DL, JUGADOR
		je pintar_jugador_mapa
		;;
        cmp DL, PARED
		je pintar_pared_mapa
		;;
        cmp DL, CAJA
		je pintar_caja_mapa
		;;
        cmp DL, OBJETIVO
		je pintar_objetivo_mapa
		;;
        cmp DL, SUELO
		je pintar_suelo_mapa
		;;
		jmp continuar_h
pintar_vacio_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_suelo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_suelo
		mov DI, offset data_sprite_suelo
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_jugador_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_jug
		mov DI, offset data_sprite_jug
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_pared_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_pared
		mov DI, offset data_sprite_pared
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_caja_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_caja
		mov DI, offset data_sprite_caja
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_objetivo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_obj
		mov DI, offset data_sprite_obj
		call pintar_sprite
		pop AX
		jmp continuar_h
continuar_h:
		inc AH
		jmp ciclo_h
continuar_v:
		inc AL
		jmp ciclo_v
fin_pintar_mapa:
		ret


;; mapa_quemado - mapa de prueba
mapa_quemado:
		mov DL, SUELO
		mov AH, 2
		mov AL, 2
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 3
		mov AL, 2
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 4
		mov AL, 2
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 2
		mov AL, 3
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 3
		mov AL, 3
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 4
		mov AL, 3
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 2
		mov AL, 4
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 3
		mov AL, 4
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 4
		mov AL, 4
		call colocar_en_mapa
		;;
		mov DL, JUGADOR
		mov AH, [xJugador]
		mov AL, [yJugador]
		call colocar_en_mapa
		;;
		mov DL, CAJA
		mov AH, 2
		mov AL, 3
		call colocar_en_mapa
		;;
		mov DL, OBJETIVO
		mov AH, 4
		mov AL, 2
		call colocar_en_mapa
		;;
		mov DL, PARED
		mov AH, 1
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 2
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 3
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 4
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 2
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 2
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 3
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 3
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 4
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 4
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 5
		call colocar_en_mapa

		mov DL, PARED
		mov AH, 2
		mov AL, 5
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 3
		mov AL, 5
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 4
		mov AL, 5
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 5
		call colocar_en_mapa
		ret

menu_pausa:
		call pintar_menu_pausa
		mov AL, [opcion]
		cmp AL, 0
		;; Continuar
		cmp AL, 1
		;; Abandonar
		je inicio

pintar_menu_pausa:
		call clear_pantalla
		mov AL, 0
		mov [opcion_Pausa], AL
		mov AL, 2
		mov [maximo_Pausa], AL
		mov AX, 50
		mov BX, 40
		mov [xFlecha_Pausa], AX
		mov [yFlecha_Pausa], BX
		; Posicionamos para imprimir mensaje de pausado
		mov DL, 09
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		; Imprimimos mensaje
		push DX
		mov DX, offset mensaje_pausa
		mov AH, 09
		int 21
		pop DX
		; Posicionamos para imprimir mensaje de continuar
		mov DL, 0c
		mov DH, 08
		mov BH, 00
		mov AH, 02
		int 10
		; Imprimimos mensaje
		push DX
		mov DX, offset mensaje_continuar
		mov AH, 09
		int 21
		pop DX
		; Posicionamos para imprimir mensaje de abandonar
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		; Imprimimos mensaje
		push DX
		mov DX, offset mensaje_abandonar
		mov AH, 09
		int 21
		pop DX
		; Imprimimos flecha
		call pintar_flecha_pausa

entrada_menu_pausa:
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_pausa
		cmp AH, 50
		je sumar_opcion_menu_pausa
		cmp AH, 3b  ;; le doy F1
		je fin_pausa
		jmp entrada_menu_pausa

restar_opcion_menu_pausa:
		mov AL, [opcion_Pausa]
		dec AL
		cmp AL, 0ff
		je volver_a_cero_pausa
		mov [opcion_Pausa], AL
		jmp mover_flecha_menu_pausa
sumar_opcion_menu_pausa:
		mov AL, [opcion_Pausa]
		mov AH, [maximo_Pausa]
		inc AL
		cmp AL, AH
		je volver_a_maximo_pausa
		mov [opcion_Pausa], AL
		jmp mover_flecha_menu_pausa
volver_a_cero_pausa:
		mov AL, 0
		mov [opcion_Pausa], AL
		jmp mover_flecha_menu_pausa
volver_a_maximo_pausa:
		mov AL, [maximo_Pausa]
		dec AL
		mov [opcion_Pausa], AL
		jmp mover_flecha_menu_pausa
mover_flecha_menu_pausa:
		mov AX, [xFlecha_Pausa]
		mov BX, [yFlecha_Pausa]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 40
		mov CL, [opcion_Pausa]
ciclo_ubicar_flecha_menu_pausa:
		cmp CL, 0
		je pintar_flecha_menu_pausa
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_pausa
pintar_flecha_menu_pausa:
		mov [xFlecha_Pausa], AX
		mov [yFlecha_Pausa], BX
		call pintar_flecha_pausa
		jmp entrada_menu_pausa
		;;
fin_pausa:
		ret
; Imprime datos del desarrollador
pintar_nombre_prueba:
		mov DL, 00
		mov DH, 18
		mov BH, 00
		mov AH, 02
		int 10
		;;
		push DX
		mov DX, offset iniciales
		mov AH, 09
		int 21
		pop DX

;; Contador de referencia
pintar_contador:
		mov DL, 19
		mov DH, 18
		mov BH, 00
		mov AH, 02
		int 10
		;;
		push DX
		mov DX, offset contador_cronometro
		mov AH, 09
		int 21
		pop DX

;; Punteo de referencia
pintar_punteo:
		mov DL, 19
		mov DH, 00
		mov BH, 00
		mov AH, 02
		int 10
		;;
		push DX
		mov DX, offset puntaje_label
		mov AH, 09
		int 21
		pop DX

;; entrada_juego - manejo de las entradas del juego
entrada_juego:
		mov AH, 01
		int 16
		jz fin_entrada_juego  ;; nada en el buffer de entrada
		mov AH, 00
		int 16
		;; AH <- scan code
		cmp AH, [control_arriba]
		je mover_jugador_arr
		cmp AH, [control_abajo]
		je mover_jugador_aba
		cmp AH, [control_izquierda]
		je mover_jugador_izq
		cmp AH, [control_derecha]
		je mover_jugador_der
		cmp AH, 3c
		je menu_pausa
		ret
mover_jugador_arr:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp bandera,1
		je colocar_equis_arr
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je mover_objeto_arr
		cmp DL, OBJETIVO
		je mover_equis_arr
		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, SUELO
		inc AL
		call colocar_en_mapa
		ret
mover_equis_arr:
		mov bandera, 1
		mov DL, JUGADOR
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX
		mov DL, SUELO
		inc AL 
		call colocar_en_mapa
		ret
colocar_equis_arr:
		cmp DL, CAJA
		je colocar_cajax_arr
		cmp DL, PARED
		je hay_pared_general
		mov DL, JUGADOR
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX
		mov DL, OBJETIVO
		inc AL
		call colocar_en_mapa
		mov bandera_caja, 0
		mov bandera, 0
		ret
colocar_cajax_arr:
		dec AL
    	push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa arriba de la caja
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je hay_pared_general
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		inc AL
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, OBJETIVO
		inc AL
		call colocar_en_mapa
		mov bandera,0
		ret
hay_pared_general:
		ret
mover_objeto_arr:
		dec AL
    	push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa arriba de la caja
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je hay_pared_general
		cmp DL, OBJETIVO
		je activar_bandera_caja_arr
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		inc AL
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		inc AL
		call colocar_en_mapa
		cmp bandera_caja, 1
		je activar_bandera
		ret
activar_bandera:
		mov bandera, 1
		mov bandera_caja, 0
		ret
activar_bandera_caja_arr:
		mov bandera_caja, 1
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		inc AL
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		inc AL
		call colocar_en_mapa
		ret
		
mover_jugador_aba:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp bandera,1
		je colocar_equis_aba
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je mover_objeto_aba
		cmp DL, OBJETIVO
		je mover_equis_aba
		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, SUELO
		dec AL
		call colocar_en_mapa
		ret
mover_equis_aba:
		mov bandera, 1

		mov DL, JUGADOR
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		dec AL 
		call colocar_en_mapa

		ret
colocar_equis_aba:
		cmp DL, CAJA
		je colocar_cajax_aba
		cmp DL, PARED
		je hay_pared_general
		mov DL, JUGADOR
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX
		mov DL, OBJETIVO
		dec AL
		call colocar_en_mapa
		mov bandera_caja, 0
		mov bandera, 0
		ret
colocar_cajax_aba:
		inc AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je hay_pared_general
		;;
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, JUGADOR
		dec AL
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, OBJETIVO
		dec AL
		call colocar_en_mapa
		mov bandera, 0
		ret
mover_objeto_aba:
		inc AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je hay_pared_general
		cmp DL, OBJETIVO
		je activar_bandera_caja_aba
		;;
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, JUGADOR
		dec AL
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, SUELO
		dec AL
		call colocar_en_mapa
		cmp bandera_caja, 1
		je activar_bandera
		ret
activar_bandera_caja_aba:
		mov bandera_caja, 1
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, JUGADOR
		dec AL
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, SUELO
		dec AL
		call colocar_en_mapa
		ret
mover_jugador_izq:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp bandera,1
		je colocar_equis_izq
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je mover_objeto_izq
		cmp DL, OBJETIVO
		je mover_equis_izq
		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, SUELO
		inc AH
		call colocar_en_mapa
		ret
mover_equis_izq:
		mov bandera, 1

		mov DL, JUGADOR
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		inc AH
		call colocar_en_mapa

		ret
colocar_equis_izq:
		cmp DL, CAJA
		je colocar_cajax_izq
		cmp DL, PARED
		je hay_pared_general
		mov DL, JUGADOR
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX
		mov DL, OBJETIVO
		inc AH
		call colocar_en_mapa
		mov bandera_caja, 0
		mov bandera, 0
		ret
colocar_cajax_izq:
		dec AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en el mapa a la izquierda de la caja
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je hay_pared_general
		;; Empujar la caja
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		inc AH
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX
		
		mov DL, OBJETIVO
		inc AH
		call colocar_en_mapa
		mov bandera, 0
		ret
mover_objeto_izq:
		dec AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en el mapa a la izquierda de la caja
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je hay_pared_general
		cmp DL, OBJETIVO
		je activar_bandera_caja_izq
		;; Empujar la caja
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		inc AH
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX
		
		mov DL, SUELO
		inc AH
		call colocar_en_mapa
		cmp bandera_caja, 1
		je activar_bandera
		ret
activar_bandera_caja_izq:
		mov bandera_caja, 1
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		inc AH
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX
		
		mov DL, SUELO
		inc AH
		call colocar_en_mapa
		ret
mover_jugador_der:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp bandera,1
		je colocar_equis_der
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je mover_objeto_der
		cmp DL, OBJETIVO
		je mover_equis_der
		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, SUELO
		dec AH
		call colocar_en_mapa
		ret
mover_equis_der:
		mov bandera, 1

		mov DL, JUGADOR
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		dec AH
		call colocar_en_mapa

		ret
colocar_equis_der:
		cmp DL, CAJA
		je colocar_cajax_der
		cmp DL, PARED
		je hay_pared_general
		mov DL, JUGADOR
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX
		mov DL, OBJETIVO
		dec AH
		call colocar_en_mapa
		mov bandera_caja, 0
		mov bandera, 0
		ret
colocar_cajax_der:
		inc AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en el mapa a la izquierda de la caja
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je hay_pared_general
		;; Empujar la caja
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		dec AH
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX
		
		mov DL, OBJETIVO
		dec AH
		call colocar_en_mapa
		mov bandera, 0
		ret

mover_objeto_der:
		inc AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en el mapa a la derecha de la caja
		cmp DL, PARED
		je hay_pared_general
		cmp DL, CAJA
		je hay_pared_general
		cmp DL, OBJETIVO
		je activar_bandera_caja_der
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		dec AH
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		dec AH
		call colocar_en_mapa
		cmp bandera_caja, 1
		je activar_bandera
		ret
activar_bandera_caja_der:
		mov bandera_caja, 1
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		dec AH
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		dec AH
		call colocar_en_mapa
		ret
fin_entrada_juego:
		ret


;; siguiente_linea - extrae la siguiente línea del archivo referenciado por el handle en BX
;; ENTRADA:
;;    - BX: handle
;; SALIDA:
;;    - [linea]: contenido de la línea que se extrajo, finalizada en 00 (nul0)
;;    - DL: si el archivo llegó a su fin
;;    - DH: la cantidad de caracteres en la línea
siguiente_linea:
		mov SI, 0000
		mov DI, offset linea
		;;
ciclo_sig_linea:
		mov AH, 3f
		mov CX, 0001
		mov DX, DI
		int 21
		cmp AX, 0000
		je fin_siguiente_linea
		mov AL, [DI]
		cmp AL, 0a
		je quitar_nl_y_fin
		inc SI
		inc DI
		jmp ciclo_sig_linea
quitar_nl_y_fin:
		mov AL, 00
		mov [DI], AL
		mov DX, SI
		mov DH, DL
		mov DL, 00    ;; no ha finalizado el archivo
		ret
fin_siguiente_linea:
		mov DL, 0ff   ;; ya finalizó el archivo
		ret


;; cadena_igual - verifica que dos cadenas sean iguales
;; ENTRADA:
;;    - SI: cadena 1, con su tamaño en el primer byte
;;    - DI: cadena 2
;; SALIDA:
;;    - DL: 0ff si son iguales, 00 si no lo son
cadena_igual:
		mov CH, 00
		mov CL, [SI]
		inc SI
ciclo_cadena_igual:
		mov AL, [SI]
		cmp AL, [DI]
		jne fin_cadena_igual
		inc SI
		inc DI
		loop ciclo_cadena_igual
cadenas_son_iguales:
		mov DL, 0ff
		ret
fin_cadena_igual:
		mov DL, 00
		ret


;; ignorar_espacios - ignora una sucesión de espacios
;; ENTRADA:
;;    - DI: offset de una cadena cuyo primer byte se supone es un espacio
;; ...
ignorar_espacios:
ciclo_ignorar:
		mov AL, [DI]
		cmp AL, 20
		jne fin_ignorar
		inc DI
		jmp ciclo_ignorar
fin_ignorar:
		ret


;; memset - memset
;; ENTRADA:
;;    - DI: offset del inicio de la cadena de bytes
;;    - CX: cantidad de bytes
;;    - AL: valor que se pondrá en cada byte
memset:
		push DI
ciclo_memset:
		mov [DI], AL
		inc DI
		loop ciclo_memset
		pop DI
		ret


;; leer_cadena_numerica - lee una cadena que debería estar compuesta solo de números
;; ENTRADA:
;;    - DI: offset del inicio de la cadena numérica
;; SALIDA:
;;    - [numero]: el contenido de la cadena numérica
leer_cadena_numerica:
		mov SI, DI
		;;
		mov DI, offset numero
		mov CX, 0005
		mov AL, 30
		call memset
		;;
		mov DI, SI
		mov CX, 0000
ciclo_ubicar_ultimo:
		mov AL, [DI]
		cmp AL, 30
		jb copiar_cadena_numerica
		cmp AL, 39
		ja copiar_cadena_numerica
		inc DI
		inc CX
		jmp ciclo_ubicar_ultimo
copiar_cadena_numerica:
		push DI   ;;   <----
		dec DI
		;;
		mov SI, offset numero
		add SI, 0004
ciclo_copiar_num:
		mov AL, [DI]
		mov [SI], AL
		dec DI
		dec SI
		loop ciclo_copiar_num
		pop DI
		ret

pedir_nivel_juego:

        call clear_pantalla
        mov AL, 0
        mov DL, 08
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		;;
		mov DX, offset mensaje_cargar
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
        mov DX, offset nueva_lin
		mov AH, 09
		int 21

        mov DL, 08
		mov DH, 08
		mov BH, 00
		mov AH, 02
		int 10

        mov DX, offset mensaje_indicar
		mov AH, 09
		int 21
		;;; PEDIR NOMBRE
pedir_de_nuevo_nombre:
        mov DL, 08
        mov DH, 08
        add DH, 03
        mov BH, 00
        mov AH, 02
        int 10
        ;;
		mov DX, offset prompt_nombre
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_nombre
		cmp AL, 20
		jb  aceptar_tam_nom
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_nombre
aceptar_tam_nom:
		mov SI, offset cod_name
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer

copiar_nombre:	mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_nombre  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;
buscar_archivo:

        mov CX, 26
		mov DX, offset cod_name
		mov AH, 40
		int 21
        ;;cmp pedir_nivel_juego


cargar_un_nivel_x:
		mov AL, 00
		mov DX, offset cod_name
		mov AH, 3d
		int 21
		jc inicio
		mov [handle_nivel], AX
		;call memset
        jmp ciclo_lineas
    
salirr:
    ;jmp pedir_nivel_juego
    ret

;; cadenaAnum
;; ENTRADA:
;;    DI -> dirección a una cadena numérica
;; SALIDA:
;;    AX -> número convertido
;;;;
cadenaAnum:
		mov AX, 0000    ; inicializar la salida
		mov CX, 0005    ; inicializar contador
		;;
seguir_convirtiendo:
		mov BL, [DI]
		cmp BL, 00
		je retorno_cadenaAnum
		sub BL, 30      ; BL es el valor numérico del caracter
		mov DX, 000a
		mul DX          ; AX * DX -> DX:AX
		mov BH, 00
		add AX, BX 
		inc DI          ; puntero en la cadena
		loop seguir_convirtiendo
retorno_cadenaAnum:
		ret

mapear_abajo:
		mov DL, 10
		add DL, 04  
		mov DH, 06
		mov BH, 00
		mov AH, 02
		int 10

		mov DX, offset label_flecha_abajo
		mov AH, 09
		int 21
		jmp actual_control_arriba

mapear_arriba:
		mov DL, 10
		add DL, 04 
		mov DH, 08
		mov BH, 00
		mov AH, 02
		int 10
		;; Si es la flecha hacia arriba
		mov DX, offset label_flecha_arriba
		mov AH, 09
		int 21
		jmp actual_control_derecha

mapear_derecha:
        mov DL, 10
        add DL, 04  
		mov DH, 08
        add DH, 02   
		mov BH, 00
		mov AH, 02
		int 10

        mov DX, offset label_flecha_derecha
		mov AH, 09
		int 21
   		jmp actual_control_izquierda

mapear_izquierda:

        mov DX, offset label_flecha_izquierda
		mov AH, 09
		int 21
    	jmp seleccionar_opcion_configuracion


fin:
.EXIT
END
