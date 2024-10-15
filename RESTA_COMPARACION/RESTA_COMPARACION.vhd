library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RESTA_COMPARACION is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           PS : out STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0);
           C1 : out STD_LOGIC;  -- A > B
           C2 : out STD_LOGIC;  -- A < B
           C3 : out STD_LOGIC); -- A = B
end RESTA_COMPARACION;

architecture Behavioral of RESTA_COMPARACION is
    signal diff : STD_LOGIC_VECTOR(4 downto 0);
begin
    -- Subtraction process
    process(A, B)
    begin
        diff <= ('0' & A) - ('0' & B);
    end process;

    -- Assign output
    PS <= diff(4);  -- Sign bit (1 if negative)
    D <= diff(3 downto 0);  -- Difference

    -- Comparison process
    process(A, B)
    begin
        if (A > B) then
            C1 <= '1';
            C2 <= '0';
            C3 <= '0';
        elsif (A < B) then
            C1 <= '0';
            C2 <= '1';
            C3 <= '0';
        else
            C1 <= '0';
            C2 <= '0';
            C3 <= '1';
        end if;
    end process;

end Behavioral;