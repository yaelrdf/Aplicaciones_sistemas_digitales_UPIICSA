library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Mostrar colima en un dislay de 16 segmentos

entity PAIS_CLK is
    Port ( 
        clk : in std_logic;
        clk_1hz : inout std_logic;
        decodificador : out std_logic_vector(16 downto 0));
end PAIS_CLK;

architecture behavioral of PAIS_CLK is
--Manejo del estado
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

--Contador para el manejo de display
--Incrementa con cada pulso de relog
process(clk_1hz)
begin
    if rising_edge(clk_1hz) then
        if estado = "101" then --Maximo numero de combinaciones
            estado <= (others => '0');
        else
            estado <= estado + "1";
        end if;
    end if;
end process;

--Decodificador
process(estado)
begin
    case estado is
        when "000" => decodificador <= "00110000111111111";
        when "001" => decodificador <= "00000000111111111";
        when "010" => decodificador <= "11110000111111111";
        when "011" => decodificador <= "00110011101111011";
        when "100" => decodificador <= "11001100010111111";
        when "101" => decodificador <= "00001100111001111";
        when others => decodificador <= (others => '1');
    end case;
end process;

end behavioral;