library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity HEXA_BIN_EQU is
    port( A,B,C,D : in std_logic;
        Ad,Bd,Cd,Dd,Ed,Fd,Gd : out std_logic);
end HEXA_BIN_EQU;

architecture behavioral of HEXA_BIN_EQU is
begin
    Ad <= (not(a) and b and not(C) and not(D)) or (A and B and not(C) and D) or (A and not(B) and C and D) or (not(A) and not(B) and not(c) and D);
    Bd <= (A and C and D) or (B and C and not(D)) or (not(A) and B and not(C) and D) or (A and B and not(D));
    Cd <= (A and B and C) or (not(A) and not(B) and C and not(D)) or (A and B and not(D));
    Dd <= (C and D and B) or (A and not(B) and C and not(D)) or (not(A) and B and not(C) and not(D)) or (not(A) and not(B) and not(C) and D);
    Ed <= (not(A) and D) or (not(A) and B and not(C) and not(D)) or (B and not(C) and D);
    Fd <= (C and not(A) and not(B)) or (not(A) and C and D) or (not(A) and not(B) and D) or (A and B and not(C) and D);
    Gd<= (not(A) and not(B) and not(C)) or (not(A) and B and C and D) or (A and B and not(C) and not(D));

end behavioral;