library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MOD_11_ASENDENTE is
    port(
        clk : in std_logic;
        clk_1hz : inout std_logic;
        display : out std_logic_vector(16 downto 0);
        estado : inout integer range 0 to 11
    );
end MOD_11_ASENDENTE;

architecture behavioral of MOD_11_ASENDENTE is
--Signals
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

--Manejo de estados
process(clk_1hz)
begin
    if rising_edge(clk_1hz) then
        if estado < 11 then
            estado <= estado + 1;
        else
            estado <= 0;
        end if;
    end if;
end process;

--Manejo de display
process(estado)
begin
    case estado is
        when 0 => display <= "11111111001001000";
        when 1 => display <= "00110000001000000";
        when 2 => display <= "11101110000110000";
        when 3 => display <= "11111100000010000";
        when 4 => display <= "00110001000110000";
        when 5 => display <= "11011101000110000";
        when 6 => display <= "11011111000110000";
        when 7 => display <= "11110000000000000";
        when 8 => display <= "11111111000110000";
        when 9 => display <= "11111101000110000";
        when 10 => display <= "01111011010000100";
        when 11 => display <= "00110011000000000";
    end case;
end process;
end behavioral;