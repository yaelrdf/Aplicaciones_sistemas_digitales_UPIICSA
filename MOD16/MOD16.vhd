library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MOD16 is
    Port ( 
        clk : in STD_LOGIC;
        A,B,C,D : inout std_logic;
        clk_1hz : inout std_logic
    );
end MOD16;

architecture Behavioral of MOD16 is
--Componente del relog
    component clk_redux
        Port ( 
            clk_in : in STD_LOGIC;
            clk_out : inout std_logic
        );
    end component;

--Instancicion del componente
    begin
        clk_redux_inst : clk_redux
        port map(
            clk_in => clk,
            clk_out => clk_1hz
        );

----------------------------------------------------
--Programa
    process(clk_1hz)
    begin
        if  rising_edge(clk_1hz) then
            A <= (not(A) and not(B) and not(C) and not(D)) or (A and B) or (A and C) or (A and D);
            B <= (not(C) and not(D) and not(B)) or (C and B) or (B and D);
            C <= (not(A) and C and D) or (not(C) and not(D) and B) or (A and not(B) and not(C) and not(D)) or (A and not(B) and C and D);
            D <= (C and not(D)) or (A and not(D)) or (B and not(D));
        end if;
    end process;
end Behavioral;
