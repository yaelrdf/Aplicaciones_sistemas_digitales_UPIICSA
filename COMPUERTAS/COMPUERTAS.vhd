library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPUERTAS is
    Port (
        A, B : in STD_LOGIC;
        AN, O, NO, NAN, ORN, ORX, NORX : out STD_LOGIC
    );
end COMPUERTAS;

architecture Behavioral of COMPUERTAS is
begin
    AN <= A and B;  -- compuerta AND
    O <= A or B;    -- compuerta OR
    NO <= not A;    -- compuerta NOT
    NAN <= A nand B;-- compuerta NAND    
    ORN <= A nor B; -- compuerta NOR
    ORX <= A xor B; -- compuerta XOR
    NORX <= A xnor B;-- compuerta XNOR
    
end Behavioral;