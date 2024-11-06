library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MULTIPLEXOR is
    port(A,B: in std_logic_vector(1 downto 0);
        seleccion: in std_logic_vector(2 downto 0);
        S_aritmetica: out std_logic_vector(2 downto 0);
        S_logica: out std_logic_vector(1 downto 0));
end MULTIPLEXOR;

architecture Behavioral of MULTIPLEXOR is
    --Operaciones aritmeticas
    signal suma : std_logic_vector(2 downto 0);
    signal resta : std_logic_vector(2 downto 0);
    signal MAYOR,MENOR,IGUAL : std_logic;
    ---Operaciones logicas
    signal Sand, Sor, Snot, Sxor: std_logic;

    --Proceso resta
    process(A,B)
    begin
        resta <= ('0' & A) - ('0' & B);
    end process;

    --Proceso suma

    


