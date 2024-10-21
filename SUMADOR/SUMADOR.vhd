library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SUMADOR is
        --Entradas
    Port ( A0, A1, A2, A3 : in STD_LOGIC;
           B0, B1, B2, B3 : in STD_LOGIC;
           --Salidas
           S0, S1, S2, S3 : out STD_LOGIC;
           CS : out STD_LOGIC);
end SUMADOR;

architecture Behavioral of SUMADOR is
    signal C0, C1, C2 : STD_LOGIC;
begin
    --Suma del primer bit
    S0 <= A0 xor B0;
    C0 <= A0 and B0;
    --Suma del segundo bit
    S1 <= A1 xor B1 xor C0;
    C1 <= (A1 and B1) or (C0 and (A1 xor B1));
    --Suma del tercer bit
    S2 <= A2 xor B2 xor C1;
    C2 <= (A2 and B2) or (C1 and (A2 xor B2));
    --Suma del cuarto bit
    S3 <= A3 xor B3 xor C2;
    CS <= (A3 and B3) or (C2 and (A3 xor B3));
end Behavioral;