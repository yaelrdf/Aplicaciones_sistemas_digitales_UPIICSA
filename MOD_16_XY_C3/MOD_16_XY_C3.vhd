library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity MOD_16_XY_C3 is
    port(
        clk : in std_logic;
        clk_1hz : inout std_logic;
        XY : in std_logic_vector(1 downto 0);
        display : out std_logic_vector(16 downto 0);
        estado : inout integer range 0 to 15
    );
end MOD_16_XY_C3;

architecture behavioral of MOD_16_XY_C3 is
--signals
signal contador_1hz : integer range 0 to 25_000_000;

begin
--Senal de relog
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
                --Multiplos del 5 desendente
                if XY = "00" then estado <= 15;
                --Stop
                elsif XY ="01" then estado <= estado;
                --Reset
                elsif XY = "10" then estado <= 0;
                --Numeros primos asendentes
                elsif XY = "11" then estado <= 2;
                end if;
            
            when 1 =>
                if XY = "00" then estado <= 0;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 2;
                end if;
            
            when 2 =>
                if XY = "00" then estado <= 0;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 3;
                end if;
            
            when 3 =>
                if XY = "00" then estado <= 5;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 5;
                end if;
            
            when 4 =>
                if XY = "00" then estado <= 0;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 7;
                end if;
            
            when 5 =>
                if XY = "00" then estado <= 0;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 7;
                end if;
            
            when 6 =>
                if XY = "00" then estado <= 5;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 7;
                end if;
            
            when 7 =>
                if XY = "00" then estado <= 5;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 11;
                end if;
            
            when 8 =>
                if XY = "00" then estado <= 5;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 11;
                end if;
            
            when 9 =>
                if XY = "00" then estado <= 5;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 11;
                end if;
            
            when 10 =>
                if XY = "00" then estado <= 5;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 11;
                end if;
            
            when 11 =>
                if XY = "00" then estado <= 10;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 13;
                end if;
            
            when 12 =>
                if XY = "00" then estado <= 10;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <= 12;
                end if;
            
            when 13 =>
                if XY = "00" then estado <= 10;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <=2;
                end if;
            
            when 14 =>
                if XY = "00" then estado <= 10;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <=2;
                end if;
            
            when 15 =>
                if XY = "00" then estado <= 10;
                elsif XY = "01" then estado <= estado;
                elsif XY = "10" then estado <= 0;
                elsif XY = "11" then estado <=2;
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