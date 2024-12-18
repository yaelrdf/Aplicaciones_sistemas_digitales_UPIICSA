library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MOD_16_XY_MOORE is
    Port ( 
        clk : in std_logic;
        clk_1hz : inout std_logic;
        display : out std_logic_vector(16 downto 0);
        XY : in std_logic_vector(1 downto 0);
        --Experimental
        estado : inout integer range 0 to 15
    );
end MOD_16_XY_MOORE;

architecture Behavioral of MOD_16_XY_MOORE is
--Componente del relog
    component clk_redux
        Port ( 
            clk_in : in STD_LOGIC;
            clk_out : inout std_logic
        );
    end component;
---------------------SIGNALS-------------------------
---------------------------------------------------
--Instancicion del componente
    begin
        clk_redux_inst : clk_redux
       port map(
           clk_in => clk,
            clk_out => clk_1hz
        );

----------------------------------------------------
--Programa
--Proceso manejo del relog y estados
process(clk_1hz, XY)
begin
    if rising_edge(clk_1hz) then
        case XY is
            -- Multiples of 4 (descending)
            when "00" => 
                if estado > 0 then estado <= ((estado - 1) / 4) * 4;
                else estado <= 12;
                end if;
            -- Stop
            when "01" => estado <= estado;
            -- Reset
            when "10" => estado <= 15;
            -- Multiples of 3 (ascending)
            when "11" => 
                if estado < 15 then estado <= ((estado + 3) / 3) * 3;
                else estado <= 0;
                end if;
        end case;
    end if;
end process;

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
        when 12 => display <= "01101011000010100";
        when 13 => display <= "01111011000010000";
        when 14 => display <= "00110011010010000";
        when 15 => display <= "01011011010010000";
    end case;
end process;

end behavioral;