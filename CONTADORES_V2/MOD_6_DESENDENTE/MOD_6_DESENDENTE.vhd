--Contador MOD 6 desendente
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MOD_6_DESENDENTE is
    port(
        clk : in std_logic;
        clk_1hz : inout std_logic;
        estado : inout std_logic_vector(2 downto 0)
    );
end MOD_6_DESENDENTE;

architecture behavioral of MOD_6_DESENDENTE is

signal contador_1hz : integer range 0 to 25_000_000;
begin
--Formula de relog
process(clk)
begin
    if rising_edge(clk) then
        if contador_1hz = 25_000_000 then
            contador_1hz <= 0;
            clk_1hz <= not clk_1hz;
        else
            contador_1hz <= contador_1hz + 1;
        end if;
    end if;
end process;

--Contador
process(clk_1hz)
begin
    if rising_edge(clk_1hz) then
        if estado = "000" then
            estado <= "101";
        else
            estado <= estado - "1";
        end if;
    end if;
end process;

end behavioral;