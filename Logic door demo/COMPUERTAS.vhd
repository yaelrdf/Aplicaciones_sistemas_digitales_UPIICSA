library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPUERTAS is
    Port (
        A, B : in STD_LOGIC;
        AN, O, INVERSOR, NAN, NOO, XO, XNO : out STD_LOGIC
    );
end COMPUERTAS;

architecture Behavioral of COMPUERTAS is
begin
    AN <= A and B;
    O <= A or B;
    INVERSOR <= not A;
    NAN <= A nand B;
    NOO <= A nor B;
    XO <= A xor B;
    XNO <= A xnor B;
end Behavioral;