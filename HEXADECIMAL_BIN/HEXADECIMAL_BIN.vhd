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
        when "0000" => display <= "00000000110110111";
        when "0001" => display <= "11001111110111111";
        when "0010" => display <= "00010001111001111";
        when "0011" => display <= "00000011111101111";
        when "0100" => display <= "11001110111001111";
        when "0101" => display <= "00100010111001111";
        when "0110" => display <= "00100000111001111";
        when "0111" => display <= "00001111111111111";
        when "1000" => display <= "00000000111001111";
        when "1001" => display <= "00000010111001111";
        when "1010" => display <= "00001100111001111";
        when "1011" => display <= "00000011101101011";
        when "1100" => display <= "00110000111111111";
        when "1101" => display <= "00000011101111011";
        when "1110" => display <= "00110000111011111";
        when "1111" => display <= "00111100111011111";
        when others => display <= "11111111111111110";
    end case;
end process;
end behavioral;