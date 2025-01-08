--Contador MOD 16 XY
--XY=0 multipplos del 5 asendente
--Paro
--Se
-- XY=1 Multiplos del 3 desendente

library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity MOD_16_XY is
    port(
        clk : in std_logic;
        clk_1hz : inout std_logic;
        XY : in std_logic_vector(1 downto 0);
        display1 : out std_logic_vector(6 downto 0);
        display2 :out std_logic_vector (6 downto 0);
        estado : inout integer range 0 to 25
    );
end MOD_16_XY;

architecture behavioral of MOD_16_XY is
--signals
signal contador_1hz : integer range 0 to 25_000_000;

begin
--Senal de relog
process(clk)
begin
    if rising_edge(clk) then
        if contador_1hz = 25_000_000 then
            contador_1hz <= 0;
            clk_1hz <= not clk_1hz;
        else
            contador_1hz <= contador_1hz + 1;
        end if;
    end if;
end process;

--Manejo de estados
process(clk_1hz,XY)
begin
if rising_edge(clk_1hz) then
    if XY= "00" then
        estado <= 0;
        if estado < 25 then
            estado <= estado + 5;
        else
            estado <= 0;
        end if;
    elsif XY = "01" then
        estado <= estado;

    elsif XY = "10" then
        estado <= 1;
    
    elsif XY = "11" then
        estado <= 15;
        if estado > 0 then
            estado <= estado - 3;
        else
            estado <= 15; 
        end if;
    end if;
end if;
end process;
--Manejo de display
process(estado)
begin
    case estado is
        when 0 =>
            display1 <= "0000001";
            display2 <= "0000001";
        when 1 =>
            display1 <= "0000001";
            display2 <= "1001111";
        when 3 =>
            display1 <= "0000001";
            display2 <= "0000110";
        when 5 =>
            display1 <= "0000001";
            display2 <= "0100100";
        when 6 =>
            display1 <= "0000001";
            display2 <= "0100000";
        when 9 =>
            display1 <= "0000001";
            display2 <= "0000100";
        when 10 =>
            display1 <= "1001111";
            display2 <= "0000001";
        ------Uso 2
        when 12 =>
            display1 <= "1001111";
            display2 <= "0010010";
        when 15 =>
            display1 <= "1001111";
            display2 <= "0100100";
        when 20 =>
            display1 <= "0010010";
            display2 <= "0000001";
        when 25 =>
            display1 <= "0010010";
            display2 <= "0100100";
        when others => null;
    end case;
end process;

end behavioral;