# Aplicaciones de sistemas digitales UPIICSA
 Repositorio de trabajo, copia de seguridad y contribucion de trabajo.

## Agredecimientos
Gracias a todos los que permitieron que este respositorio creciera y se volviera fuente de consulta importante para muchos. Agradezco la confianza y que me brindaron y sobre todo la oportunidad de compartir un poco de mi conocimiento. Especiamlente a los miembros de "Manzanita sol" y asociados.

El dia 18 de Abril del 2025 este respositorio es archivado marcado el fin de una era muy divertida y memorable. Este repositorio permanecera publico para todo el que quiera aprender y utilizar su contenido bajo los lineamientos permitidos en la licencia y el codigo de etica.

#### Gracias a todas y cada una de las personas que hicieron esto posible. 
#### Att. Yael RDF

---

> [!NOTE]
> Este repositorio esta bajo licencia GPL-V3 por lo que la contribucion al autor "Yael-RDF" es nesesaria al utilizar cualquier contenido en este repositorio

## Indice
- [Comuertas logicas](COMPUERTAS/COMPUERTAS.vhd)
- [Sumador 4 bits](SUMADOR/SUMADOR.vhd)
- [Restador con comparador de 3 bits](RESTA_COMPARACION/RESTA_COMPARACION.vhd)
- [Numeros par](NUMEROSPAR/NUMEROSPAR.vhd)
- [Restador 3 bits DYSPLAY](RESTA_3_BIT/RESTA_3_BIT.vhd)
- [Hexadecimal a binario DYSPLAY](HEXA_BIN_EQU/HEXA_BIN_EQU.vhd)
- [Multiplexor](MULTIPLEXOR/MULTIPLEXOR.vhd)
----
- [Señales de relog](CKL_MISC/CLK_MISC.vhd)
- [Contador MOD13 LED](MOD16\MOD16.vhd)
- [Contador MOD8 DISPLAY](MOD_8_X/MOD_8_X.vhd)
- [Contador MOD16 variables XY DISPLAY](MOD_16_XY/MOD_16_XY.vhd)
----
### Contadores con variables externas
> [!Warning]
> Los codigos encontrados en esta seccion tienen condiciones especificas documentados en las tablas posteriores al codigo.
>Todos fueron realizados bajo el metodo **Diagrama de estados**
- [Contador MOD 16 con variables XY DISPLAY](MOD_16_XY_C1/MOD_16_XY_C1.vhd)

|X     | Y   | Comportamiento |
| :---:| :--:| :------------: |
|0     |0    | Multiplos del 4 Desendente|
|0     |1    | STOP|
|1     |0    | SET|
|1     |1    | Multiplos del 3 asendente|

- [Contador MOD 16 con variables XY DISPLAY](MOD_16_XY_C2/MOD_16_XY_C2.vhd)

|X     | Y   | Comportamiento |
| :---:| :--:| :------------: |
|0     |0    | 3 Primeros multiplos del 5 Asendente|
|0     |1    | STOP|
|1     |0    | RESET|
|1     |1    | 6 Primeros multiplos del 3 desendente|

- [Contador MOD 16 con variables XY DISPLAY](MOD_16_XY_C3/MOD_16_XY_C3.vhd)

|X     | Y   | Comportamiento |
| :---:| :--:| :------------: |
|0     |0    | Mulriplos del 5 desendente|
|0     |1    | STOP|
|1     |0    | RESET|
|1     |1    | Numeros primos asendente|
----
### Extras
- [Contador MOD-5 Desendente (DISPLAY 7 Anodo)](MOD_5_DESENDENTE/MOD_5_DESENDENTE.vhd)
- [Contador MOD-11 Desendente (DISPLAY 16 Catodo)](MOD11_DESENDENTE/MOD_11_DESENDENTE.vhd)
- [COLIMA en display (16 Anodo)](PAIS_CLK/PAIS_CLK.vhd)
- [Feliz ANO nuevo en DISPLAY (16 Catodo) especialmente para misa ;)](ANO/ANO.vhd)
- [Contador MOD-16 XY (Todos los estados de la seccion anterior)](MOD_16_XY_MOORE/MOD_16_XY_MOORE.vhd)


> [!CAUTION]
> Ultimo codigo citado "Contador MOD-16 XY" **NO ES FUNCIONAL** Este incluye todos los estados de la seccion "Contadores con variables externas" programados por **ecuaciones**.
> **Solo se debe tomar como ejemplificacion del metodo ecuciones para esos esenarios.**



## Codigo de etica
Este repositorio tiene un proposito meramente de **ayuda a la comunidad**, por lo que se solicita a cualquier usuario seguir los siguientes lineamientos al utilizar cualquier elmento contenido en este repositorio:

- No realizar copias literales de ninguno de los elementos de este repositorio sin atribucion **explicita** a su autor
- Esta permitido tomar como base para la creacion de algun material similar a lo que contenga este repositorio. En este caso la atribucion no sera obligatoria.
- En caso de tomar fragmentos de codigo sin modificar se requiere **Atribucion explicita** al autor del repositorio, asi como la fuente

Confio en que los usuarios que consulten este repositorio hagan buen uso del contenido de este.

Un mundo mejor solo es posible si trabajamos en el cada dia y es por eso que pongo a disposicion de todo e mundo mi trabajo como codigo abierto.