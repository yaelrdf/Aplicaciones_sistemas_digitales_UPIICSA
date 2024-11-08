library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MULTIPLEXOR is
    port(A,B: in std_logic_vector(1 downto 0);
        seleccion: in std_logic_vector(2 downto 0);
        S_aritmetica: out std_logic_vector(2 downto 0);
        S_logica: out std_logic_vector(1 downto 0));
end MULTIPLEXOR;

architecture Behavioral of MULTIPLEXOR is
    --Operaciones aritmeticas
    signal suma : std_logic_vector(2 downto 0);
    signal resta : std_logic_vector(2 downto 0);
    signal MAYOR,MENOR,IGUAL : std_logic;
    ---Operaciones logicas
    signal Sand, Sor, Snot, Sxor: std_logic_vector(1 downto 0);

begin
    --Proceso resta
    process(A,B)
    begin
        resta <= ('0' & A) - ('0' & B);
    end process;

    --Proceso suma
    process(A,B)
    begin
        suma <= ('0' & A) + ('0' & B);
    end process;

    --Comparador
    process(A, B)
    begin
        ---Mayor que
        if (A > B) then
            MAYOR <= '1';
            MENOR <= '0';
            IGUAL <= '0';
        --Menor que
        elsif (A < B) then
            MAYOR <= '0';
            MENOR <= '1';
            IGUAL <= '0';
        -- Igual
        else
            MAYOR <= '0';
            MENOR <= '0';
            IGUAL <= '1';
        end if;
    end process;

    --Proceso puertas logicas
    process(A,B)
    begin
        Sand <= A and B;
        Sor <= A or B;
        Snot <= not A;
        Sxor <= A xor B;
    end process;

    --Seleccion
    process(seleccion, suma, resta, MAYOR, MENOR, IGUAL, Sand, Sor, Snot, Sxor)
    begin
        case seleccion is
            when "000" =>
                S_aritmetica <= suma;
                S_logica <= "00";
            
            when "001" =>
                S_aritmetica <= resta;
                S_logica <= "00";
            
            when "010" =>
                S_aritmetica(0) <= MAYOR;
                S_aritmetica(1) <= IGUAL;
                S_aritmetica(2) <= MENOR;
                S_logica <= "00";
            
            when "011" =>
                S_logica <= "00";
                S_aritmetica <= "000";
            
            --Operaciones logicas
            when "100" =>
                S_aritmetica <= "000";
                S_logica <= Sand;
            
            when "101" =>
                S_aritmetica <= "000";
                S_logica <= Sor;
            
            when "110" =>
                S_aritmetica <= "000";
                S_logica <= Sxor;
            
            when "111" =>
                S_aritmetica <= "000";
                S_logica <= Snot;
            
            when others =>
                S_aritmetica <= "000";
                S_logica <= "00";
        end case;
    end process;
end Behavioral;


