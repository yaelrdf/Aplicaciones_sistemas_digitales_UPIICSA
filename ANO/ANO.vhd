library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ANO is
    Port ( 
        clk : in std_logic;
        clk_1hz : inout std_logic;
        display : out std_logic_vector(16 downto 0)
    );
end ANO;

architecture behavioral of ANO is
    -- Signals for internal state and counter
    signal estado : integer range 0 to 14;
    signal contador_1hz : integer range 0 to 25000000;
begin
    -- Process for 1 Hz clock generation
    process(clk)
    begin
        if rising_edge(clk) then
            if contador_1hz = 25000000 then -- 25 milliones
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
            if estado < 14 then
                estado <= estado + 1;
            else
                estado <= 0;
            end if;
        end if;
    end process;

    -- Process for 7-segment display decoding
    process(estado)
    begin
        case estado is
            when 0 => display <= "11000011000100000";
            when 1 => display <= "11001111000100000";
            when 2 => display <= "00001111000000000";
            when 3 => display <= "11001100010000100";
            when 4 => display <= "11001100001001000";
            when 5 => display <= "00000000000110000";
            when 6 => display <= "11110011000110000";
            when 7 => display <= "11110011100000010";
            when 8 => display <= "11111111000000000";
            when 9 => display <= "00000000000110000";
            when 10 => display <= "00110011100000010";
            when 11 => display <= "00111111000000000";
            when 12 => display <= "11001111000100000";
            when 13 => display <= "00000011001001000";
            when 14 => display <= "11111111000000000";
             -- Default case
        end case;
    end process;
end behavioral;