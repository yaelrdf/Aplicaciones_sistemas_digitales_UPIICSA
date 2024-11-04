library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity HEXADECIMAL_BIN is
    port(display: out std_logic_vector(6 downto 0);
        --Utilizando el ultimo bit para manejar como el punto en caso de error
        entradas: in std_logic_vector (3 downto 0));
end HEXADECIMAL_BIN;

architecture Behavioral of HEXADECIMAL_BIN is
begin
process(entradas)
begin
    case(entradas) is
        when "0000" => display <= "0000001";
        when "0001" => display <= "1001111";
        when "0010" => display <= "0010010";
        when "0011" => display <= "0000110";
        when "0100" => display <= "1001100";
        when "0101" => display <= "0100100";
        when "0110" => display <= "0100000";
        when "0111" => display <= "0001111";
        when "1000" => display <= "0000000";
        when "1001" => display <= "0000100";
        when "1010" => display <= "0001000";
        when "1011" => display <= "1100000";
        when "1100" => display <= "0110001";
        when "1101" => display <= "1000010";
        when "1110" => display <= "0110000";
        when "1111" => display <= "0111000";
    end case;
end process;
end behavioral;