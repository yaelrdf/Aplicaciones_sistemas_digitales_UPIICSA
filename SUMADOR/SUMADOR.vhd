library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SUMADOR is
    Port ( A0, A1, A2, A3 : in STD_LOGIC;
           B0, B1, B2, B3 : in STD_LOGIC;
           S0, S1, S2, S3 : out STD_LOGIC;
           CS : out STD_LOGIC);
end SUMADOR;

architecture Behavioral of SUMADOR is
    signal C1, C2, C3 : STD_LOGIC;
begin
    -- First bit addition
    S0 <= A0 xor B0;
    C1 <= A0 and B0;

    -- Second bit addition
    S1 <= A1 xor B1 xor C1;
    C2 <= (A1 and B1) or (C1 and (A1 xor B1));

    -- Third bit addition
    S2 <= A2 xor B2 xor C2;
    C3 <= (A2 and B2) or (C2 and (A2 xor B2));

    -- Fourth bit addition
    S3 <= A3 xor B3 xor C3;
    CS <= (A3 and B3) or (C3 and (A3 xor B3));
end Behavioral;