library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HEXADECIMAL is
            --Entradas como vector de bits
    Port ( entrada : in  STD_LOGIC_VECTOR (3 downto 0);
           display: out std_logic_vector(16 downto 0));
end HEXADECIMAL;

architecture Behavioral of HEXADECIMAL is
begin -- Diferencia o substraccion
    process(entrada)
    begin
        case(entrada) is
            when "0000" => display <="11111111000000000";
            when "0001" => display <="00110000001000000";
            when "0010" => display <="11101010000110010";
            when "0011" => display <="11111100000000000";
            when "0100" => display <="00110001000110000";
            when "0101" => display <="11011000000110000";
            when "0110" => display <="10011101000110000";
            when "0111" => display <="11110000000000000";
            when "1000" => display <="11111111000110000";
            when "1001" => display <="11110001000110000";
            when "1010" => display <="11110011000110000";
            when "1011" => display <="11100001000110000";
            when "1100" => display <="11001111000000000";
            when "1101" => display <="11111111000000000";
            when "1110" => display <="11001111000110000";
            when "1111" => display <="11000011000100000";
            when others => display <="00000000000000001";
        end case;
    end process;
end Behavioral;