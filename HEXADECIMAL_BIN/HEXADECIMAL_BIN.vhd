library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity HEXADECIMAL_BIN is
    port(display: out std_logic_vector(16 downto 0);
        --Utilizando el ultimo bit para manejar como el punto en caso de error
        entradas: in std_logic_vector (3 downto 0));
end HEXADECIMAL_BIN;

architecture Behavioral of HEXADECIMAL_BIN is
begin
process(entradas)
begin
    case(entradas) is
        when "0000" => display <= "11111111001001000";
        when "0001" => display <= "00110000001000000";
        when "0010" => display <= "11101110000110000";
        when "0011" => display <= "11111100000010000";
        when "0100" => display <= "00110001000110000";
        when "0101" => display <= "11011101000110000";
        when "0110" => display <= "11011111000110000";
        when "0111" => display <= "11110000000000000";
        when "1000" => display <= "11111111000110000";
        when "1001" => display <= "11111101000110000";
        when "1010" => display <= "11110011000110000";
        when "1011" => display <= "11111100010010100";
        when "1100" => display <= "11001111000000000";
        when "1101" => display <= "11111100010000100";
        when "1110" => display <= "11001111000100000";
        when "1111" => display <= "11000011000100000";
        when others => display <= "00000000000000001";
    end case;
end process;
end behavioral;