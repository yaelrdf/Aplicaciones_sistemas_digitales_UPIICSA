--NO FUNCIONAL ECUACIONES MAL FORMULADAS SOLO UTILIZAR COMO EJEMPLO
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MOD_16_XY_MOORE is
    Port ( 
        clk,X,Y : in std_logic;
        clk_1hz,A,B,C,D : inout std_logic;
        display : out std_logic_vector(16 downto 0)
    );
end MOD_16_XY_MOORE;

architecture Behavioral of MOD_16_XY_MOORE is
--Componente del relog
    component clk_redux
        Port ( 
            clk_in : in STD_LOGIC;
            clk_out : inout std_logic
        );
    end component;
---------------------SIGNALS-------------------------
signal estado : std_logic_vector(3 downto 0);
---------------------------------------------------
--Instancicion del componente
    begin
        clk_redux_inst : clk_redux
       port map(
           clk_in => clk,
            clk_out => clk_1hz
        );

----------------------------------------------------
--Programa
--Manejo de transiciones
process(clk_1hz)
    begin
        if rising_edge(clk_1hz) then
            --C1 MOD 16 XY
            --Not Working and not even close
            --A <= (X or not(Y) or A) and (not(X) or not(Y) or not(A) or not(B) or not(C) or not(D)) and (not(X) or not(Y) or A) and (X or Y or A) and (X or Y or A or not(B)) and (X or Y or not(A) or B or C or D);
            --B <= (X or not(Y) or B) and (X or Y) and (B or not(C) or D) and (not(X) or not(Y) or A) and (not(X) or not(Y) or not(B) or not(C) or not(D)) and (not(X) or not(Y) or B or C or D);
            --C <= (X or Y) and (X or not(B) or C) and (X or B or C) and (not(X) or not(Y) or not(A) or B) and (A or not(B) or not(C)) and (not(B) or not(C) or not(D));
            --D <= (X or Y) and (X or D) and (X or D) and (A or not(B) or C) and (A or B or not(C) or not(D)) and (not(X) or not(Y) or not(A) or B or C or not(D)) and (not(X) or not(Y) or not(A) or B or not(C) or D) and (not(X) or not(Y) or not(A) or not(B) or not(C) or not(D));

            --C2 MOD 16 XY
            --Not working but somewhat close to expected behavior
            --A <= (not(X) and Y and A) or (X and Y and A and not(B)) or (not(X) and A and not(B) and not(C)) or (not(A) and B and C) or (not(X) and not(Y) and not(A) and B and C) or (X and Y and A);
            --B <= (not(X) and Y and B) or (not(X) and not(Y) and not(A) and not(B)) or (X and Y and A) or (not(X) and not(Y) and not(A)) or (X and Y and not(A) and B and not(C)) or (X and Y and not(B) and C and D);
            --C <= (X and Y and not(A)) or (not(X) and Y and B and C) or (not(X) and Y and B and C) or (not(X) and Y and not(B) and C) or (not(X) and not(Y) and A and not(B) and not(C)) or (X and Y and B and not(C) and not(D)) or (not(X) and not(Y) and not(A) and B and C) or (not(X) and not(Y) and not(A) and B and D);
            --D <= (not(X) and not(Y) and not(A) and not(B)) or (not(X) and Y and not(Y)) or (not(X) and Y and B and not(D)) or (not(X) and Y and B and D) or (not(X) and Y and not(A)) or (not(X) and not(Y) and not(A)) or (X and Y and not(A)) or (not(A) and not(B) and C and not(D)) or (X and Y and not(B) and not(C) and not(D)) or (X and Y and A and B and not(C) and not(D));

            --C3 MOD 16 XY PRIMO
            --Not working but close to working
            A <= (not(X) and Y and A) or (X and Y and not(A) and not (B)) or (not(A) and B and not(C) and not(D)) or (not(A) and B and C and D) or (not(A) and B and C and D) or (not(X) and not(Y) and not(A) and not(D));
            B <= (not(X) and Y and B) or (X and Y and not(B) and C and D) or (X and Y and B and not(C) and not(D)) or (X and Y and not(A) and B and not(C)) or (not(A) and B and C and not(D)) or (not(X) and not(Y) and not(A) and B and C) or (not(X) and not(Y) and not(B) and not(C) and not(D)) or (not(X) and not(Y) and A and not(B) and not(C)) or (not(X) and not(Y) and A and not(B) and C and not(D));
            C <= (X and Y) or (not(X) and Y and not(B) and C) or (not(X) and Y and not(B) and C) or (not(X) and A and B and C) or (X and Y and B and D) or (not(X) and not(Y) and A and B) or (X and Y and not(A)) or (X and Y and not(B) and C and not(D)) or (not(X) and Y and B and C) or (not(X) and A and not(B) and C and D) or (not(A) and not(B) and not(C) and not(D));
            D <= (X and Y and A) or (not(X) and Y and B and D) or (not(X) and Y and not(B) and D) or (not(A) and B and C) or (X and Y and A and not(B)) or (X and Y and B and not(C) and not(D)) or (not(X) and not(Y) and A) or (not(X) and not(Y) and not(B) and not(C) and not(D)) or (not(X) and not(Y) and A and not(B) and C and not(D));            
            end if;                                                                                   
    
    --Concatenacion del estado para el manejo de display
    estado <= A&B&C&D;
    --Manejo del display
    case estado is
        when "0000" => display <= "11111111001001000";
        when "0001" => display <= "00110000001000000";
        when "0010" => display <= "11101110000110000";
        when "0011" => display <= "11111100000010000";
        when "0100" => display <= "00110001000110000";
        when "0101" => display <= "11011101000110000";
        when "0110" => display <= "11011111000110000";
        when "0111" => display <= "11110000000000000";
        when "1000" => display <= "11111111000110000";
        when "1001" => display <= "11111101000110000";
        when "1010" => display <= "01111011010000100";
        when "1011" => display <= "00110011000000000";
        when "1100" => display <= "01101011000010100";
        when "1101" => display <= "01111011000010000";
        when "1110" => display <= "00110011010010000";
        when "1111" => display <= "01011011010010000";
        when others => display <="00000000000000001";
    end case;
    end process;
end behavioral;

