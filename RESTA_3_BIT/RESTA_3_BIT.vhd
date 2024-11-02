library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RESTA_3_BIT is
            --Entradas como vector de bits
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           B : in  STD_LOGIC_VECTOR (2 downto 0);
           ---Salidas
           PS : out STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0)
           --display
           (display : out std_logic_vector(16 downto 0));

end RESTA_3_BIT;

architecture Behavioral of RESTA_3_BIT is
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
    --D <= diff(3 downto 0);  -- Diferencia o substraccion

end Behavioral;