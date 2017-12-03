----------------------------------------------------------------------------------
-- Pulse Width Modulator Project
-- Frequency Selector (Freq_Sel) Module
-- California Polytechnic State University, San Luis Obispo
-- Gabriela Remulla, Marie-Christelle Medino
-- Create Date: 11/19/2017 07:22:44 PM
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PWM is
    Port ( PW : in STD_LOGIC_VECTOR (1 downto 0);
           Reset : in STD_LOGIC;
           Frequency : in STD_LOGIC_VECTOR (12 downto 0);
           CLK : in STD_LOGIC;
           Wave : out STD_LOGIC; -- resulting square wave is passed to external component
           Disp : out STD_LOGIC_VECTOR (10 downto 0)); -- for 7-seg display, vectors 10-7 are for the anode, and 6-0 for the cathode
    end PWM;

architecture Behavioral of PWM is

    component Wav_Gen is
        Port (PW_Ctrl : in STD_LOGIC_VECTOR (1 downto 0);
           Reset_PW : in STD_LOGIC;
           Freq_Ctrl : in STD_LOGIC_VECTOR (12 downto 0);
           Clock : in STD_LOGIC;
           Square_Wave : out STD_LOGIC;
           DC_value : out integer;
           Note_val : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal CLK_240 : STD_LOGIC := '0';
    signal DC_pass : integer;
    signal note_pass : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal temp_Disp : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";

begin

    Get_Values : Wav_Gen port map (
        PW_Ctrl => PW,
        Reset_PW => Reset,
        Freq_Ctrl => Frequency,
        Clock => CLK,
        Square_Wave => Wave,
        DC_value => DC_pass,
        Note_val => note_pass);
     
     
     --Sets Clock for 7-segment display to 240 MHZ
     --This gives the illusion that all four digits are being displayed at once   
     Disp_CLK: process (CLK)
        variable counter : integer range 0 to 208333 := 0;
        begin
            if (rising_edge(CLK)) then
                if (counter = 208333) then
                    CLK_240 <= not CLK_240;
                    counter := 0;
                else
                    counter := counter + 1;
                end if;
            end if;
     end process;
     
     To_Display: process (CLK_240, DC_pass, note_pass)
             variable count : unsigned (1 downto 0) := "00";
             begin
                 if (rising_edge(CLK_240)) then
                     if (count = "00") then -- Rightmost digit displays notes' first letter
                         temp_Disp(10 downto 7) <= "0111";
                         case note_pass is
                             when "0001" => -- low C
                                 temp_Disp(6 downto 0) <= "0110001";
                             when "0010" => -- Db
                                 temp_Disp(6 downto 0) <= "0000001";
                             when "0011" => -- D
                                 temp_Disp(6 downto 0) <= "0000001";
                             when "0100" => -- Eb
                                 temp_Disp(6 downto 0) <= "0110000";
                             when "0101" => -- E
                                 temp_Disp(6 downto 0) <= "0110000";
                             when "0110" => -- F
                                 temp_Disp(6 downto 0) <= "0111000";
                             when "0111" => -- Gb
                                 temp_Disp(6 downto 0) <= "0100000";
                             when "1000" => -- G
                                 temp_Disp(6 downto 0) <= "0100000";
                             when "1001" => -- Ab
                                 temp_Disp(6 downto 0) <= "0001000";
                             when "1010" => -- A
                                 temp_Disp(6 downto 0) <= "0001000";
                             when "1011" => -- Bb
                                 temp_Disp(6 downto 0) <= "0000000";
                             when "1100" => -- B
                                 temp_Disp(6 downto 0) <= "0000000";
                             when "1101" => -- high C
                                 temp_Disp(6 downto 0) <= "0110001";    
                             when others =>
                                 temp_Disp(10 downto 7) <= "1011";
                                 temp_Disp(6 downto 0) <= "1111110";
                         end case;
                        count := count + 1;
                     elsif (count = "01") then -- Second digit displays "b" when note is a flat
                         case note_pass is
                             when "0010" => -- Db
                                 temp_Disp(10 downto 7) <= "1011";
                                 temp_Disp(6 downto 0) <= "1100000";
                             when "0100" => -- Eb
                                 temp_Disp(10 downto 7) <= "1011";
                                 temp_Disp(6 downto 0) <= "1100000";
                             when "0111" => -- Gb
                                 temp_Disp(10 downto 7) <= "1011";
                                 temp_Disp(6 downto 0) <= "1100000";
                             when "1001" => -- Ab
                                 temp_Disp(10 downto 7) <= "1011";
                                 temp_Disp(6 downto 0) <= "1100000";
                             when "1011" => -- Bb
                                 temp_Disp(10 downto 7) <= "1011";
                                 temp_Disp(6 downto 0) <= "1100000";
                             when others =>
                                 temp_Disp(10 downto 7) <= "1111";
                         end case;
                         count := count + 1;
                     elsif (count = "10") then -- Third digit displays duty cycle's first digit
                          temp_Disp(10 downto 7) <= "1101";
                          case DC_pass is
                             when 10 =>
                                 temp_Disp(6 downto 0) <= "1001111";
                             when 20 =>
                                 temp_Disp(6 downto 0) <= "0010010";
                             when 30 =>
                                 temp_Disp(6 downto 0) <= "0000110";
                             when 40 =>
                                 temp_Disp(6 downto 0) <= "1001100";
                             when 50 =>
                                 temp_Disp(6 downto 0) <= "0100100";
                             when 60 =>
                                 temp_Disp(6 downto 0) <= "0100000";
                             when 70 =>
                                 temp_Disp(6 downto 0) <= "0001111";
                             when 80 =>
                                 temp_Disp(6 downto 0) <= "0000000";
                             when 90 =>
                                 temp_Disp(6 downto 0) <= "0001100";
                             when others =>
                                 temp_Disp(6 downto 0) <= "0000001";
                         end case;
                         count := count + 1;
                     else -- count = 11, Last digit displays 0 
                           temp_Disp(10 downto 7) <= "1110";
                           temp_Disp(6 downto 0) <= "0000001";
                           count := "00";
                     end if;
                 end if;
          end process; 
          
          Disp <= temp_Disp;
          
end Behavioral;
