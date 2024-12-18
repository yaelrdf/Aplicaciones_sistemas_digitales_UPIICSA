library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MOD_6_DESENDENTE is
    Port ( 
        clk : in std_logic;
        clk_1hz : inout std_logic;
        decodificador : out std_logic_vector(6 downto 0)
    );
end MOD_6_DESENDENTE;

architecture behavioral of MOD_6_DESENDENTE is
    -- Signals for internal state and counter
    signal estado : integer range 0 to 5;
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
            if estado > 0 then
                estado <= estado - 1;
            else
                estado <= 5;
            end if;
        end if;
    end process;

    -- Process for 7-segment display decoding
    process(estado)
    begin
        case estado is
            when 0 => decodificador <= "0000001"; -- 0
            when 1 => decodificador <= "1001111"; -- 1
            when 2 => decodificador <= "0010010"; -- 2
            when 3 => decodificador <= "0000110"; -- 3
            when 4 => decodificador <= "1001100"; -- 4
            when 5 => decodificador <= "0100100"; -- 5
            when others => decodificador <= "0000000"; -- Default case
        end case;
    end process;
end behavioral;