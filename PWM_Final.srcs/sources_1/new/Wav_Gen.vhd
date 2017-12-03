----------------------------------------------------------------------------------
-- Pulse Width Modulator Project
-- Frequency Selector (Freq_Sel) Module
-- California Polytechnic State University, San Luis Obispo
-- Gabriela Remulla, Marie-Christelle Medino
-- Create Date: 11/19/2017 07:22:44 PM
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Wav_Gen is
    Port (PW_Ctrl : in STD_LOGIC_VECTOR (1 downto 0);
          Reset_PW : in STD_LOGIC;
          Freq_Ctrl : in STD_LOGIC_VECTOR (12 downto 0);
          Clock : in STD_LOGIC;
          Square_Wave : out STD_LOGIC;
          DC_value : out integer;
          Note_val : out STD_LOGIC_VECTOR (3 downto 0));
    end Wav_Gen;

architecture Behavioral of Wav_Gen is

    component W_Mod is
        Port ( PW_up : in STD_LOGIC;
            PW_down : in STD_LOGIC;
            RST : in STD_LOGIC;
            CLK : in STD_LOGIC;
            DC_val : out integer);
    end component;
    
    component Freq_Sel is
        Port ( CLK : in STD_LOGIC;
            SW_IN: in STD_LOGIC_VECTOR (12 downto 0);
            DUTY_CYCLE : in integer range 0 to 100;
            CLK_OUT : out STD_LOGIC;
            Note : out STD_LOGIC_VECTOR (3 downto 0));       
    end component;

    signal DC_pass : integer;

begin

    Pulse_Width : W_Mod port map (
        PW_up => PW_Ctrl(1),
        PW_down => PW_Ctrl(0),
        RST => Reset_PW,
        CLK => Clock,
        DC_val => DC_pass); --here
        
    F_Select : Freq_Sel port map (
        CLK => Clock,
        SW_IN => Freq_Ctrl,
        DUTY_CYCLE => DC_pass, --here
        CLK_OUT => Square_Wave,
        Note => Note_val);
        
    DC_value <= DC_pass;

end Behavioral;
