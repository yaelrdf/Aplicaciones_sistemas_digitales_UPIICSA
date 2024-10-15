library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Entidad-entradas
entity NUMEROSPAR is
    port(A,B,C,D: in STD_LOGIC; S:out STD_LOGIC);
end NUMEROSPAR;

--Arquitectura pa la logica
architecture rtl of NUMEROSPAR is
    begin
    S <= ((not A) and D) or (((not B) and (not C)) and D);
    --S <= not(A and D) or not(B and C) and D
    --S=not(AD) + not(BD)D
    end rtl;