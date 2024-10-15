library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RESTA_COMPARACION is
    Port ( A3, A2, A1, A0 : in  STD_LOGIC;
           B3, B2, B1, B0 : in  STD_LOGIC;
           PS : out STD_LOGIC;
           D3, D2, D1, D0 : out STD_LOGIC;
           C1, C2, C3 : out STD_LOGIC);
end RESTA_COMPARACION;

architecture Behavioral of RESTA_COMPARACION is
    signal BORROW1, BORROW2, BORROW3 : STD_LOGIC;
    signal EQ3, EQ2, EQ1, EQ0 : STD_LOGIC;
    signal GT3, GT2, GT1, GT0 : STD_LOGIC;
begin
    -- Subtraction process
    D0 <= A0 xor B0;
    BORROW1 <= (not A0) and B0;

    D1 <= (A1 xor B1) xor BORROW1;
    BORROW2 <= ((not A1) and B1) or ((not (A1 xor B1)) and BORROW1);

    D2 <= (A2 xor B2) xor BORROW2;
    BORROW3 <= ((not A2) and B2) or ((not (A2 xor B2)) and BORROW2);

    D3 <= (A3 xor B3) xor BORROW3;
    PS <= ((not A3) and B3) or ((not (A3 xor B3)) and BORROW3);

    -- Comparison process
    -- Equality comparisons
    EQ3 <= A3 xnor B3;
    EQ2 <= A2 xnor B2;
    EQ1 <= A1 xnor B1;
    EQ0 <= A0 xnor B0;

    -- Greater than comparisons
    GT3 <= A3 and (not B3);
    GT2 <= A2 and (not B2);
    GT1 <= A1 and (not B1);
    GT0 <= A0 and (not B0);

    -- Final comparison results
    C1 <= GT3 or (EQ3 and GT2) or (EQ3 and EQ2 and GT1) or (EQ3 and EQ2 and EQ1 and GT0); -- A > B
    C2 <= (not GT3 and not EQ3) or (EQ3 and not GT2 and not EQ2) or 
          (EQ3 and EQ2 and not GT1 and not EQ1) or 
          (EQ3 and EQ2 and EQ1 and not GT0 and not EQ0); -- A < B
    C3 <= EQ3 and EQ2 and EQ1 and EQ0; -- A = B

end Behavioral;