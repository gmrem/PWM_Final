----------------------------------------------------------------------------------
-- Pulse Width Modulator Project
-- Frequency Selector (Freq_Sel) Module
-- California Polytechnic State University, San Luis Obispo
-- Gabriela Remulla, Marie-Christelle Medino
-- Create Date: 11/19/2017 07:22:44 PM
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity W_Mod is
    Port ( PW_up : in STD_LOGIC;
           PW_down : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DC_val : out integer);
end W_Mod;

architecture Behavioral of W_Mod is

signal DC_pass : STD_LOGIC_VECTOR (3 downto 0);
signal CLK_SLOW : STD_LOGIC := '0';

begin
    
    --Slows clock to real time button input, otherwise clock is at 100 MHZ
    Slowed_CLK: process (CLK)
        variable count : integer range 0 to 50000000 := 0;
        begin
            if (rising_edge(CLK)) then
                if (count = 25000000) then
                    CLK_SLOW <= not CLK_SLOW;
                    count := 0;
                else
                    count := count + 1;  
                end if;  
            end if;
    end process;

    Find_DT: process (CLK_SLOW)
        variable val : STD_LOGIC_VECTOR (3 downto 0) := "0101";
        begin
            if (rising_edge(CLK_SLOW)) then
                if (RST = '0') then 
                    if (PW_up = '1') then
                        if (val = "1001") then 
                            val := "0001";
                        else
                            val := val + 1;
                        end if;
                    elsif (PW_down = '1') then
                        if (val = "0001") then
                            val := "1001";
                        else
                            val := val - 1;
                        end if;
                    else
                        val := val;
                    end if;
                else --if RST = 1, 50% DC
                    val := "0101";
                end if;
            end if;
            DC_pass <= val;
    end process;

    --assigns duty cycle integer value from 4-bit binary input
    DT_disp_integer: process (CLK, DC_pass)
        begin
            if (rising_edge(CLK)) then 
                    case DC_pass is
                        when "0001" =>
                            DC_val <= 10;
                        when "0010" =>
                            DC_val <= 20;
                        when "0011" =>
                              DC_val <= 30;
                        when "0100" =>
                            DC_val <= 40;
                        when "0101" =>
                            DC_val <= 50;
                        when "0110" =>
                            DC_val <= 60;
                        when "0111" =>
                            DC_val <= 70;
                        when "1000" =>
                            DC_val <= 80;
                        when "1001" =>
                            DC_val <= 90;
                        when others =>
                            DC_val <= 0;
                    end case;
            end if;
    end process;

end Behavioral;
