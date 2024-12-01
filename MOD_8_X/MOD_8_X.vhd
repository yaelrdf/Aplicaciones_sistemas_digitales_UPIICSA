library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MOD_8_X is
    Port ( 
        clk,X : in std_logic;
        clk_1hz : inout std_logic;
        display : out std_logic_vector(16 downto 0);
        --TODO Remove before put into production
        estado : inout std_logic_vector(2 downto 0)
    );
end MOD_8_X;

architecture Behavioral of MOD_8_X is
--Componente del relog
    component clk_redux
        Port ( 
            clk_in : in STD_LOGIC;
            clk_out : inout std_logic
        );
    end component;
---------------------SIGNALS-------------------------
--signal estado : std_logic_vector(2 downto 0);
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
--Manejo de estados Tabla de transicion
process(clk_1hz)
begin

if rising_edge(clk_1hz)then
    if X='0'then
        case estado is
            when "100" => estado <= "111";
            when "111" => estado <= "010";
            when "010" => estado <= "110";
            when "110" => estado <= "000";
            when "000" => estado <= "110";
            when "110" => estado <= "101";
            when "101" => estado <= "001";
            when "001" => estado <= "100";
        end case;
    elsif X='1' then
        estado <= estado;
    end if;
end if;

end process;

--Decodificacion (16 segmentos anodo comun)
process(estado)
begin
    case estado is
        --Unicamente muestra hasta el numero 7
        when "000" => display <= "00000000110110111";
        when "001" => display <= "11001111110111111";
        when "010" => display <= "00010001111001111";
        when "011" => display <= "00000011111101111";
        when "100" => display <= "11001110111001111";
        when "101" => display <= "00100010111001111";
        when "110" => display <= "00100000111001111";
        when "111" => display <= "00001111111111111";
        --Enendido del punto en caso de error
        when others => display <="00000000000000001";
    end case;
end process;

end behavioral;
