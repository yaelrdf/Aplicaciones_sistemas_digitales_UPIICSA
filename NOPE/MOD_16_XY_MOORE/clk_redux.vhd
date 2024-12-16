library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_redux is
    Port ( 
        clk_in : in STD_LOGIC;
        clk_out : inout std_logic
    );
end clk_redux;

architecture Behavioral of clk_redux is
signal contador_1hz : integer range 0 to 25_000_000 := 0;
begin
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if contador_1hz = 25_000_000 then --25 millones en binario
                contador_1hz <= 0;
                clk_out <= not clk_out;
            else
                contador_1hz <= contador_1hz + 1;
            end if;
        end if;
    end process;
end Behavioral;