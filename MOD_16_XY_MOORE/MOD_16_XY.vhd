library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MOD_16_XY is
    Port ( 
        clk,X,Y,A,B,C,D : in std_logic;
        clk_1hz : inout std_logic;
        display : out std_logic_vector(16 downto 0)
    );
end MOD_16_XY;

architecture Behavioral of MOD_16_XY is
--Componente del relog
    component clk_redux
        Port ( 
            clk_in : in STD_LOGIC;
            clk_out : inout std_logic
        );
    end component;
---------------------SIGNALS-------------------------

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
            
        end if;
    end process;


