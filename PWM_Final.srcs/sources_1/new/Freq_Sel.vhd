----------------------------------------------------------------------------------
-- Pulse Width Modulator Project
-- Frequency Selector (Freq_Sel) Module
-- California Polytechnic State University, San Luis Obispo
-- Marie-Christelle Medino, Gabriela Remulla
-- Create Date: 11/19/2017 07:22:44 PM
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Freq_Sel is
    Port ( CLK : in STD_LOGIC; 
           SW_IN: in STD_LOGIC_VECTOR (12 downto 0); -- from Wav_Gen 
           DUTY_CYCLE : in integer; -- from W_Mod
           CLK_OUT : out STD_LOGIC; -- square wave output
           Note : out STD_LOGIC_VECTOR (3 downto 0)); -- index of musical note for display
end Freq_Sel;

architecture Behavioral of Freq_Sel is

signal temp : STD_LOGIC; -- temp value inside process for CLK_OUT
signal note_pass : STD_LOGIC_VECTOR (3 downto 0);
signal CTR_H, CTR_L : integer :=0; -- high/low values within period for given duty cycle and frequency
signal counter : integer := 0; -- clock counter

begin

    --Assigns when output is high and low according to input frequency and duty cycle
    Frequency_Selector: process (SW_IN, DUTY_CYCLE, CTR_H,CTR_L)
        begin
            case SW_IN is
                when "0000000000001" =>
                    note_pass <= "0001"; --1 C
                    case DUTY_CYCLE is
                        when 0 | 100 =>
                            CTR_H <= 0;
                            CTR_L <= 0;
                        when 10 | 90 =>
                            CTR_H <= 343997;
                            CTR_L <= 38221;
                        when 20 | 80 =>
                            CTR_H <= 305775;
                            CTR_L <= 76443;                           
                        when 30 | 70 =>
                            CTR_H <= 267553;
                            CTR_L <= 114665;
                        when 40 | 60 =>
                            CTR_H <= 229331;
                            CTR_L <= 152887;
                        when 50 =>
                            CTR_H <= 191109;
                            CTR_L <= 191109;
                        when others =>
                            CTR_H <= 0;
                            CTR_L <= 0;                       
                      end case;
                when "0000000000010" =>
                    note_pass <= "0010"; --2 Db
                    case DUTY_CYCLE is
                        when 0 | 100 =>
                            CTR_H <= 0;
                            CTR_L <= 0;
                        when 10 | 90 =>
                            CTR_H <= 324698;
                            CTR_L <= 36077;
                        when 20 | 80 =>
                            CTR_H <= 288621;
                            CTR_L <= 72155;                           
                        when 30 | 70 =>
                            CTR_H <= 252543;
                            CTR_L <= 108232;
                        when 40 | 60 =>
                            CTR_H <= 216465;
                            CTR_L <= 144310;
                        when 50 =>
                            CTR_H <= 180388;
                            CTR_L <= 180388;
                        when others =>
                             CTR_H <= 0;
                             CTR_L <= 0;                              
                      end case;           
                when "0000000000100" =>
                    note_pass <= "0011"; --3 D
                    case DUTY_CYCLE is
                        when 0 | 100 =>
                            CTR_H <= 0;
                            CTR_L <= 0;
                        when 10 | 90 =>
                            CTR_H <= 306476;
                            CTR_L <= 34052;
                        when 20 | 80 =>
                            CTR_H <= 272423;
                            CTR_L <= 68105;                           
                        when 30 | 70 =>
                            CTR_H <= 238370;
                            CTR_L <= 102159 ;
                        when 40 | 60 =>
                            CTR_H <= 204317;
                            CTR_L <= 136211;
                        when 50 =>
                            CTR_H <= 170264;
                            CTR_L <= 170264;
                        when others =>
                             CTR_H <= 0;
                             CTR_L <= 0;                               
                      end case;
                when "0000000001000" =>
                    note_pass <= "0100"; --4 Eb
                    case DUTY_CYCLE is
                        when 0 | 100 =>
                            CTR_H <= 0;
                            CTR_L <= 0;
                        when 10 | 90 =>
                            CTR_H <= 289268;
                            CTR_L <= 32140;
                        when 20 | 80 =>
                            CTR_H <= 257127;
                            CTR_L <= 64281;                           
                        when 30 | 70 =>
                            CTR_H <= 224986;
                            CTR_L <= 96422 ;
                        when 40 | 60 =>
                            CTR_H <= 192845;
                            CTR_L <= 128563;
                        when 50 =>
                            CTR_H <= 160704;
                            CTR_L <= 160704;
                        when others =>
                            CTR_H <= 0;
                            CTR_L <= 0;                               
                    end case;
                when "0000000010000" =>
                    note_pass <= "0101"; --5 E
                    case DUTY_CYCLE is
                        when 0 | 100 =>
                            CTR_H <= 0;
                            CTR_L <= 0;
                        when 10 | 90 => 
                            CTR_H <= 273033;
                            CTR_L <= 30337;
                        when 20 | 80 =>
                            CTR_H <= 242696;
                            CTR_L <= 60674;                           
                        when 30 | 70 =>
                            CTR_H <= 212359;
                            CTR_L <= 91011 ;
                        when 40 | 60 =>
                            CTR_H <= 182022;
                            CTR_L <= 121348;
                        when 50 =>
                            CTR_H <= 151685;
                            CTR_L <= 151685;
                        when others =>
                             CTR_H <= 0;
                             CTR_L <= 0;                               
                        end case;
                when "0000000100000" =>
                    note_pass <= "0110"; --6 F
                    case DUTY_CYCLE is
                        when 0 | 100 =>
                            CTR_H <= 0;
                            CTR_L <= 0;
                        when 10 | 90 => 
                            CTR_H <= 257709;
                            CTR_L <= 28634;
                        when 20 | 80 =>
                            CTR_H <= 229075;
                            CTR_L <= 57268;                           
                        when 30 | 70 =>
                            CTR_H <= 200441;
                            CTR_L <= 85903 ;
                        when 40 | 60 =>
                            CTR_H <= 171806;
                            CTR_L <= 114537;
                        when 50 =>
                            CTR_H <= 143172;
                            CTR_L <= 143172;
                        when others =>
                             CTR_H <= 0;
                             CTR_L <= 0;                               
                    end case;
                when "0000001000000" =>
                    note_pass <= "0111"; --7 Gb
                    case DUTY_CYCLE is
                        when 0 | 100 =>
                            CTR_H <= 0;
                            CTR_L <= 0;
                        when 10 | 90 => 
                            CTR_H <= 243249;
                            CTR_L <= 27027;
                        when 20 | 80 =>
                            CTR_H <= 216222;
                            CTR_L <= 54055;                           
                        when 30 | 70 =>
                            CTR_H <= 189194;
                            CTR_L <= 81083 ;
                        when 40 | 60 =>
                            CTR_H <= 162166;
                            CTR_L <= 108111;
                        when 50 =>
                            CTR_H <= 135138;
                            CTR_L <= 135138;
                        when others =>
                            CTR_H <= 0;
                            CTR_L <= 0;                               
                    end case;
                when "0000010000000" =>
                    note_pass <= "1000"; --8 G
                    case DUTY_CYCLE is
                        when 0 | 100 =>
                            CTR_H <= 0;
                            CTR_L <= 0;
                        when 10 | 90 => 
                            CTR_H <= 229591;
                            CTR_L <= 25510;
                        when 20 | 80 =>
                            CTR_H <= 204081;
                            CTR_L <= 51020;                           
                        when 30 | 70 =>
                            CTR_H <= 178571;
                            CTR_L <= 76530 ;
                        when 40 | 60 =>
                            CTR_H <= 153061;
                            CTR_L <= 102040;
                        when 50 =>
                            CTR_H <= 127551;
                            CTR_L <= 127551;
                        when others =>
                             CTR_H <= 0;
                             CTR_L <= 0;                               
                    end case;
                when "0000100000000" =>
                    note_pass <= "1001"; --9 Ab
                    case DUTY_CYCLE is
                        when 0 | 100 =>
                            CTR_H <= 0;
                            CTR_L <= 0;
                        when 10 | 90 => 
                            CTR_H <= 216710;
                            CTR_L <= 24078;
                        when 20 | 80 =>
                            CTR_H <= 192631;
                            CTR_L <= 48157;                           
                        when 30 | 70 =>
                            CTR_H <= 168552;
                            CTR_L <= 72236 ;
                        when 40 | 60 =>
                            CTR_H <= 144473;
                            CTR_L <= 96315;
                        when 50 =>
                            CTR_H <= 120394;
                            CTR_L <= 120394;
                        when others =>
                             CTR_H <= 0;
                             CTR_L <= 0;                               
                    end case;                
                when "0001000000000" =>
                    note_pass <= "1010"; --10 A
                    case DUTY_CYCLE is
                        when 0 | 100 =>
                            CTR_H <= 0;
                            CTR_L <= 0;
                        when 10 | 90 => 
                            CTR_H <= 204545;
                            CTR_L <= 22727;
                        when 20 | 80 =>
                            CTR_H <= 181818;
                            CTR_L <= 45454;                           
                        when 30 | 70 =>
                            CTR_H <= 159090;
                            CTR_L <= 68181 ;
                        when 40 | 60 =>
                            CTR_H <= 136363;
                            CTR_L <= 90909;
                        when 50 =>
                            CTR_H <= 113636;
                            CTR_L <= 113636;
                        when others =>
                             CTR_H <= 0;
                             CTR_L <= 0;                               
                    end case;                    
                when "0010000000000" =>
                    note_pass <= "1011"; --11 Bb
                    case DUTY_CYCLE is
                           when 0 | 100 =>
                               CTR_H <= 0;
                               CTR_L <= 0;
                           when 10 | 90 => 
                               CTR_H <= 193066;
                               CTR_L <= 21451;
                           when 20 | 80 =>
                               CTR_H <= 171614;
                               CTR_L <= 42903;                           
                           when 30 | 70 =>
                               CTR_H <= 150163;
                               CTR_L <= 64355 ;
                           when 40 | 60 =>
                               CTR_H <= 128711;
                               CTR_L <= 85807;
                           when 50 =>
                               CTR_H <= 107259;
                               CTR_L <= 107259;
                        when others =>
                                CTR_H <= 0;
                                CTR_L <= 0;                                  
                    end case;     
                when "0100000000000" =>
                    note_pass <= "1100"; --12 B
                    case DUTY_CYCLE is
                       when 0 | 100 =>
                           CTR_H <= 0;
                           CTR_L <= 0;
                       when 10 | 90 => 
                           CTR_H <= 182230;
                           CTR_L <= 20247;
                       when 20 | 80 =>
                           CTR_H <= 161982;
                           CTR_L <= 40495;                           
                       when 30 | 70 =>
                           CTR_H <= 141734;
                           CTR_L <= 60743;
                       when 40 | 60 =>
                           CTR_H <= 121487;
                           CTR_L <= 80991;
                       when 50 =>
                           CTR_H <= 101239;
                           CTR_L <= 101239;
                        when others =>
                            CTR_H <= 0;
                            CTR_L <= 0;                              
                    end case;                                  
                when "1000000000000" =>
                    note_pass <= "1101"; -- 13 High C 
                    case DUTY_CYCLE is
                       when 0 | 100 =>
                           CTR_H <= 0;
                           CTR_L <= 0;
                       when 10 | 90 => 
                           CTR_H <= 172001;
                           CTR_L <= 19111;
                       when 20 | 80 =>
                           CTR_H <= 152890;
                           CTR_L <= 38222;                           
                       when 30 | 70 =>
                           CTR_H <= 133779;
                           CTR_L <= 57333;
                       when 40 | 60 =>
                           CTR_H <= 114667;
                           CTR_L <= 76445;
                       when 50 =>
                           CTR_H <= 95556;
                           CTR_L <= 95556;
                        when others =>
                            CTR_H <= 0;
                            CTR_L <= 0;                              
                      end case;
                 when others =>
                    note_pass <= "0000"; -- OFF
                    CTR_H <= CTR_H;
                    CTR_L <= CTR_L;                              
            end case; 
    end process;

    -- Generates Square Wave 
    Frequency_Divider : process (CLK, CTR_H, CTR_L)
    begin
        if (rising_edge(CLK)) then
            if (counter = CTR_H + CTR_L) then
                counter <= 0;
            elsif (counter < CTR_H) then
                temp <= '1';
                counter <= counter + 1;
            else   
                temp <= '0';
                counter <= counter + 1;
            end if;
        end if;
    end process;

    CLK_OUT <= temp;  
    Note <= note_pass;   

end Behavioral;
