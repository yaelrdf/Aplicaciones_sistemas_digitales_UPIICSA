library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity NOMBRE is
    port(display: out std_logic_vector(16 downto 0);
        --Utilizando el ultimo bit para manejar como el punto en caso de error
        ent: in std_logic_vector (3 downto 0));
end NOMBRE;

architecture Behavioral of NOMBRE is
begin
process(ent)
begin
    case(ent) is
        when "0000" => display <= "00110011100000010";
        when "0001" => display <= "11110011000110000";
        when "0010" => display <= "11111100010000100";
        when "0011" => display <= "11001100010000100";
        when "0100" => display <= "11110011000110000";
        when "0101" => display <= "00000000000110000";
        when "0110" => display <= "11011101000110000";
        when "0111" => display <= "11111111000000000";
        when "1000" => display <= "11000011000100000";
        when "1001" => display <= "11001100010000100";
        when "1010" => display <= "11110011000110000";
        when "1011" => display <= "00000000000000000";
        when others => display <="00000000000000001";
    end case;
end process;
end behavioral;

    
