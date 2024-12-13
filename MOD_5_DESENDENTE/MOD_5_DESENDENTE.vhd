library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MOD_5_DESENDENTE is
    Port ( 
        clk : in std_logic;
        clk_1hz : inout std_logic;
        decodificador : out std_logic_vector(6 downto 0)
    );

end MOD_5_DESENDENTE;

architecture behavioral of MOD_5_DESENDENTE is
--Manejo del estado una vez realizadas las operaciones
signal A,B,C : std_logic;
signal estado : std_logic_vector(2 downto 0);
signal contador_1hz : std_logic_vector(27 downto 0);

begin
--Proceso relog 1hz
process(clk)
begin
    if rising_edge(clk) then
       if contador_1hz = "0001011111010111100001000000" then --25 millones en binario
            contador_1hz <= (others => '0');
            clk_1hz <= not clk_1hz;
        else
            contador_1hz <= contador_1hz + "1";
        end if;
    end if;
end process;

--Proceso para el manejo de estados
process(clk_1hz)
begin
    if rising_edge(clk_1hz) then
        A <= not(A) and not(B) and not(C);
        B <= (A) or (A and B);
        C <= (B and not(C)) or (A);
    end if;
    estado <= A&B&C;
end process;

--proceso decodificacion
process(estado)
begin
    case estado is
        when "000" => decodificador <= "0000001";
        when "001" => decodificador <= "1001111";
        when "010" => decodificador <= "0010010";
        when "011" => decodificador <= "0000110";
        when "100" => decodificador <= "1001100";
        when others => decodificador <= "0000000";
    end case;
end process;

end behavioral;