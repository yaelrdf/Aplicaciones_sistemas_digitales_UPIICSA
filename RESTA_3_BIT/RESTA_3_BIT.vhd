library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RESTA_COMPARACION is
            --Entradas como vector de bits
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           B : in  STD_LOGIC_VECTOR (2 downto 0);
           ---Salidas
           PS : out STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0)
           --display
           (display: out std_logic_vector(16 downto 0));
end RESTA_COMPARACION;

architecture Behavioral of RESTA_COMPARACION is
    --Diferencia como signal
    signal diff : STD_LOGIC_VECTOR(3 downto 0);
begin
    --Proceso para la resta utilizando diff como ayuda
    process(A, B)
    begin
        diff <= ('0' & A) - ('0' & B);
    end process;
    ---Salidas bit de prestamo y resultado
    --PS <= diff(3);  -- Bit de prestamo
    D <= diff(3 downto 0);  -- Diferencia o substraccion

    process(PS,D)
    begin
        case(D) is
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

end Behavioral;