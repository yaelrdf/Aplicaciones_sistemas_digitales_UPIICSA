library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RESTA_3_BIT is
            --Entradas como vector de bits
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           B : in  STD_LOGIC_VECTOR (2 downto 0);
           --display
           display : out std_logic_vector(16 downto 0));

end RESTA_3_BIT;

architecture Behavioral of RESTA_3_BIT is
    --Diferencia como signal
    signal diff : STD_LOGIC_VECTOR(3 downto 0);
    signal final: std_logic_vector(3 downto 0);
begin
    --Proceso para la resta utilizando diff como ayuda
    process(A, B)
    begin
        diff <= ('0' & A) - ('0' & B);
    end process;
    ---Salidas bit de prestamo y resultado
    --PS <= diff(3);  -- Bit de prestamo
    --D <= diff(3 downto 0);  -- Diferencia o substraccion

    process(diff)
    begin
        case(diff) is
            when "0000" => display <= "11111111000000000";
            when "0001" => display <= "00110000000000000";
            when "0010" => display <= "01101000000010100";
            when "0011" => display <= "01111000000010000";
            when "0100" => display <= "00110000010010000";
            when "0101" => display <= "01011000010010000";
            when "0110" => display <= "01011000010010100";
            when "0111" => display <= "01110000000000000";
            when "1000" => display <= "11111111000100000";
            when "1001" => display <= "01110000000100000";
            when "1010" => display <= "01011000010110100";
            when "1011" => display <= "01011000010110000";
            when "1100" => display <= "00110000010110000";
            when "1101" => display <= "01111000000110000";
            when "1110" => display <= "01101000000110100";
            when "1111" => display <= "00110000000100000";
            when others => display <="00000000000000001";
        end case;
    end process;
end Behavioral;