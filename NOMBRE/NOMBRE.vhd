library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity NOMBRE is
    port(display: out std_logic_vector(16 downto 0);
        --Utilizando el ultimo bit para manejar como el punto en caso de error
        ent: in std_logic_vector (1 downto 0));
end NOMBRE;

architecture Behavioral of NOMBRE is
begin
process(ent)
begin
    case(ent) is
        when "00" => display <="00000000101000100";
        when "01" => display <="11110011000110000";
        when "10" => display <="11001111000110000";
        when "11" => display <="00001111000000000";
        when others => display <="00000000000000001";
    end case;
end process;
end behavioral;

    
