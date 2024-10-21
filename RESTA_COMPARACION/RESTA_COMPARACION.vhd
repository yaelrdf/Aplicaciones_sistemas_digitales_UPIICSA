library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RESTA_COMPARACION is
            --Entradas como vector de bits
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           ---Salidas
           PS : out STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0);
           --Salidas comparador
           C1, C2, C3 : out STD_LOGIC);
end RESTA_COMPARACION;

architecture Behavioral of RESTA_COMPARACION is
    --Diferencia como signal
    signal diff : STD_LOGIC_VECTOR(4 downto 0);
begin
    --Proceso para la resta utilizando diff como ayuda
    process(A, B)
    begin
        diff <= ('0' & A) - ('0' & B);
    end process;

    ---Salidas bit de prestamo y resultado
    PS <= diff(4);  -- Bit de prestamo
    D <= diff(3 downto 0);  -- Diferencia o substraccion

    -- Proceso de comparacion
    process(A, B)
    begin
        ---Mayor que
        if (A > B) then
            C1 <= '1';
            C2 <= '0';
            C3 <= '0';
        --Menor que
        elsif (A < B) then
            C1 <= '0';
            C2 <= '1';
            C3 <= '0';
        -- Igual
        else
            C1 <= '0';
            C2 <= '0';
            C3 <= '1';
        end if;
    end process;

end Behavioral;