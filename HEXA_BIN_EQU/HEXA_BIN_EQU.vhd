library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity HEXA_BIN_EQU is
    port( A,B,C,D : in std_logic;
        Ad,Bd,Cd,Dd,Ed,Fd,Gd : out std_logic);
end HEXA_BIN_EQU;

architecture behavioral of HEXA_BIN_EQU is
begin
    Ad <= (A and C and not(B and D)) or (A and B and D and (not C)) or (B and not(A and C and D)) or (D and not(A and B and C));
    Bd <= (A and C and D) or (B and C and(not D)) or (A and B and (not D)) or (B and D and not(A and C));
    Cd <= (A and B and C) or (A and B and (not D)) or (not(A and B and D) and C);
    Dd <= (B and C and D) or (A and C and not(D and B)) or (not(A and B and C) and D) or (B and not(A and C and D));
    Ed <= (D and not A) or (not(B and C) and D) or (not(A and C) and B);
    Fd <= (C and D and not(A)) or (not(A and B) and D) or (not(A and B) and C) or (A and B and D and not(C));
    Gd<= (not(A and B and C)) or (A and B and(not (C and D))) or (not(C and D and B) and A);

end behavioral;