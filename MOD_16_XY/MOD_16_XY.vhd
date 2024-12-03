library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MOD_16_XY is
    Port ( 
        clk : in std_logic;
        clk_1hz : inout std_logic;
        display : out std_logic_vector(16 downto 0);
        XY : in std_logic_vector(1 downto 0)
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
type status is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15);
signal estado_presente, estado_siguiente : status;
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
            estado_presente <= estado_siguiente;
        end if;
    end process;


--Proceso de diagrama de comportamiento
process(estado_presente, XY)
    begin
        case estado_presente is
            when S0 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S1;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                -- Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S15;
                end if;
            
            when S1 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S2;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S0;
                end if;
            
            when S2 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S3;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S0;
                end if;
            
            when S3 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S4;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S0;
                end if;
            
            when S4 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S5;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S3;
                end if;
            
            when S5 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S6;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S3;
                end if;
            
            when S6 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S7;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S3;
                end if;
            
            when S7 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S8;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S6;
                end if;
            
            when S8 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S9;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S6;
                end if;

            when S9 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S10;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S6;
                end if;
            
            when S10 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S11;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S9;
                end if;
            
            when S11 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S12;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S9;
                end if;

            when S12 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S13;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S9;
                end if;

            when S13 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S14;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S12;
                end if;

            when S14 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S15;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S12;
                end if;

            when S15 =>
                --Asendente
                if XY = "00" then estado_siguiente <= S0;
                --Paro
                elsif XY = "01" then estado_siguiente <= estado_presente;
                --Reinicio
                elsif XY = "10" then estado_siguiente <= S0;
                --Multiplos de 3
                elsif XY = "11" then estado_siguiente <= S12;
                end if;
        end case;
    end process;

---Proceso de decodoficacion
process(estado_siguiente)
begin
    case estado_siguiente is
        when S0 => display <= "11111111001001000";
        when S1 => display <= "00110000001000000";
        when S2 => display <= "11101110000110000";
        when S3 => display <= "11111100000010000";
        when S4 => display <= "00110001000110000";
        when S5 => display <= "11011101000110000";
        when S6 => display <= "11011111000110000";
        when S7 => display <= "11110000000000000";
        when S8 => display <= "11111111000110000";
        when S9 => display <= "11111101000110000";
        when S10 => display <= "01111011010000100";
        when S11 => display <= "00110011000000000";
        when S12 => display <= "01101011000010100";
        when S13 => display <= "01111011000010000";
        when S14 => display <= "00110011010010000";
        when S15 => display <= "01011011010010000";
    end case;
end process;
end behavioral;