library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CLK_MISC is
    port(
        clk : in std_logic;
        clk_1hz, clk_05hz, clk_2hz : inout std_logic
    );
end CLK_MISC;

architecture Behavioral of CLK_MISC is
    signal contador_1hz, contador_05hz, contador_2hz: std_logic_vector(27 downto 0);
begin
    --Proceso 1hz
    process(clk)
    begin
        if clk'event and clk='1' then
            if contador_1hz = "0001011111010111100001000000" then --25 millones en binario
                contador_1hz <= (others => '0');
                clk_1hz <= not clk_1hz;
            else
                contador_1hz <= contador_1hz + "1";
            end if;
        end if;
    end process;

    --Proceso 05hz
    process(clk)
    begin
        if clk'event and clk='1' then
            if contador_05hz = "0010111110101111000010000000" then --50 millones en binario
                contador_05hz <= (others => '0');
                clk_05hz <= not clk_05hz;
            else
                contador_05hz <= contador_05hz + "1";
            end if;
        end if;
    end process;

    --Proceso 2hz
    process(clk)
    begin
        if clk'event and clk='1' then
            if contador_2hz = "101111101011110000100000" then --12.5 millones en binario
                contador_2hz <= (others => '0');
                clk_2hz <= not clk_2hz;
            else
                contador_2hz <= contador_2hz + "1";
            end if;
        end if;
    end process;
end Behavioral;