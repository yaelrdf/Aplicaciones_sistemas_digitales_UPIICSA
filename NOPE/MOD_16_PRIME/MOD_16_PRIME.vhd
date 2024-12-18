library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MOD_16_PRIME is
    Port ( 
        clk,X,Y : in std_logic;
        clk_1hz : inout std_logic;
        display : out std_logic_vector(16 downto 0);
        estado : inout std_logic_vector(3 downto 0)
    );
end MOD_16_PRIME;

architecture Behavioral of MOD_16_PRIME is
--Componente del relog
    component clk_redux
        Port ( 
            clk_in : in STD_LOGIC;
            clk_out : inout std_logic
        );
    end component;
---------------------SIGNALS-------------------------
signal C_estado : std_logic_vector(5 downto 0);
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
    C_estado <= X&Y&estado;
    if rising_edge(clk_1hz)then
        case C_estado is
            when "000000" => estado <= "1111";
            when "000001" => estado <= "0000";
            when "000010" => estado <= "0000";
            when "000011" => estado <= "0000";
            when "000100" => estado <= "0000";
            when "000101" => estado <= "0000";
            when "000110" => estado <= "0101";
            when "000111" => estado <= "0101";
            when "001000" => estado <= "0101";
            when "001001" => estado <= "0101";
            when "001010" => estado <= "0101";
            when "001011" => estado <= "1010";
            when "001100" => estado <= "1010";
            when "001101" => estado <= "1010";
            when "001110" => estado <= "1010";
            when "001111" => estado <= "1010";
            when "010000" => estado <= "0000";
            when "010001" => estado <= "0001";
            when "010010" => estado <= "0010";
            when "010011" => estado <= "0011";
            when "010100" => estado <= "0100";
            when "010101" => estado <= "0101";
            when "010110" => estado <= "0110";
            when "010111" => estado <= "0111";
            when "011000" => estado <= "1000";
            when "011001" => estado <= "1001";
            when "011010" => estado <= "1010";
            when "011011" => estado <= "1011";
            when "011100" => estado <= "1100";
            when "011101" => estado <= "1101";
            when "011110" => estado <= "1110";
            when "011111" => estado <= "1111";
            when "100000" => estado <= "0000";
            when "100001" => estado <= "0000";
            when "100010" => estado <= "0000";
            when "100011" => estado <= "0000";
            when "100100" => estado <= "0000";
            when "100101" => estado <= "0000";
            when "100110" => estado <= "0000";
            when "100111" => estado <= "0000";
            when "101000" => estado <= "0000";
            when "101001" => estado <= "0000";
            when "101010" => estado <= "0000";
            when "101011" => estado <= "0000";
            when "101100" => estado <= "0000";
            when "101101" => estado <= "0000";
            when "101110" => estado <= "0000";
            when "101111" => estado <= "0000";
            when "110000" => estado <= "0010";
            when "110001" => estado <= "0010";
            when "110010" => estado <= "0011";
            when "110011" => estado <= "0101";
            when "110100" => estado <= "0111";
            when "110101" => estado <= "0111";
            when "110110" => estado <= "0111";
            when "110111" => estado <= "1011";
            when "111000" => estado <= "1011";
            when "111001" => estado <= "1011";
            when "111010" => estado <= "1011";
            when "111011" => estado <= "1101";
            when "111100" => estado <= "1101";
            when "111101" => estado <= "0010";
            when "111110" => estado <= "0010";
            when "111111" => estado <= "0010";
        end case;
    end if;
end process;

--Decodificacion (16 segmentos catodo comun)
process(estado)
begin
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