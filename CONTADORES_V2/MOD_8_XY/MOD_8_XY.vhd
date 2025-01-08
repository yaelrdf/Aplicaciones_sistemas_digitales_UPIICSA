--MOD 8 Con variables externas
--X=1 Impares desendente
--X=0 Pares asendentes
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MOD_8_XY is
    port(
        clk,X : in std_logic;
        clk_1hz : inout std_logic;
        display : out std_logic_vector(16 downto 0);
        estado : inout integer range 0 to 7
    );
end MOD_8_XY;

architecture behavioral of MOD_8_XY is
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
        case estado is
            when 0 =>
                --Pares asendentes
                if X = '0' then estado <= 2;
                --Impares desedentes
                else estado <= 7;
                end if;

            when 1 =>
                --Pares asendentes
                if X = '0' then estado <= 2;
                --Impares desedentes
                else estado <= 0;
                end if;
            
            when 2 =>
                --Pares asendentes
                if X = '0' then estado <= 4;
                --Impares desedentes
                else estado <= 0;
                end if;

            when 3 =>
                --Pares asendentes
                if X = '0' then estado <= 4;
                --Impares desedentes
                else estado <= 0;
                end if;

            when 4 =>
                --Pares asendentes
                if X = '0' then estado <= 6;
                --Impares desedentes
                else estado <= 3;
                end if;

            when 5 =>
                --Pares asendentes
                if X = '0' then estado <= 6;
                --Impares desedentes
                else estado <= 3;
                end if;
            
            when 6 =>
                --Pares asendentes
                if X = '0' then estado <= 0;
                --Impares desedentes
                else estado <= 5;
                end if;

            when 7 =>
                --Pares asendentes
                if X = '0' then estado <= 0;
                --Impares desedentes
                else estado <= 5;
                end if;
        end case;
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
    end case;
end process;
end behavioral;