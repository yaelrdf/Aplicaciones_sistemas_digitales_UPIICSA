library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Contador MOD 11 desendente display 16 segmentos

entity MOD_11_DESENDENTE is
    Port ( 
        clk : in std_logic;
        clk_1hz : inout std_logic;
        decodificador : out std_logic_vector(16 downto 0));
end MOD_11_DESENDENTE;

architecture behavioral of MOD_11_DESENDENTE is
--Manejo del estado
signal estado : std_logic_vector(3 downto 0);
signal contador_1hz : std_logic_vector(27 downto 0);

begin
--Proceso relog 1hz
process(clk)
begin
    if rising_edge(clk) then
       if contador_1hz = "0001011111010111100001000000" then --25 millones en binario
            contador_1hz <= (others => '0');
            clk_1hz <= not clk_1hz;
        else
            contador_1hz <= contador_1hz + "1";
        end if;
    end if;
end process;

--Proceso contador de estado
process(clk_1hz)
begin
    if rising_edge(clk_1hz) then
        if estado = "000" then
            estado <= "1010";
        else
            estado <= estado - "1";
        end if;
    end if;
end process;

--Proceso decodificar

process(estado)
begin
    case estado is
        when "0000" => decodificador <= "11111111001001000";
        when "0001" => decodificador <= "00110000001000000";
        when "0010" => decodificador <= "11101110000110000";
        when "0011" => decodificador <= "11111100000010000";
        when "0100" => decodificador <= "00110001000110000";
        when "0101" => decodificador <= "11011101000110000";
        when "0110" => decodificador <= "11011111000110000";
        when "0111" => decodificador <= "11110000000000000";
        when "1000" => decodificador <= "11111111000110000";
        when "1001" => decodificador <= "11111101000110000";
        when "1010" => decodificador <= "01111011010000100";
    end case;
end process;

end behavioral;