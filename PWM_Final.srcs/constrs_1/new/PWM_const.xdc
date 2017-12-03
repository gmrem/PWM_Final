# Constraints for CLK
set_property PACKAGE_PIN W5 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK]

# Constraints for PW0
set_property PACKAGE_PIN T18 [get_ports {PW[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PW[1]}]

# Constraints for PW1
set_property PACKAGE_PIN U17 [get_ports {PW[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PW[0]}]

# Constraints for Reset_PW
set_property PACKAGE_PIN U18 [get_ports Reset]
set_property IOSTANDARD LVCMOS33 [get_ports Reset]

# Constraints for Freq_Ctr0
set_property PACKAGE_PIN R2 [get_ports {Frequency[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[0]}]

# Constraints for Freq_Ctr1
set_property PACKAGE_PIN T1 [get_ports {Frequency[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[1]}]

# Constraints for Freq_Ctr2
set_property PACKAGE_PIN U1 [get_ports {Frequency[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[2]}]

# Constraints for Freq_Ctr3
set_property PACKAGE_PIN W2 [get_ports {Frequency[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[3]}]

# Constraints for Freq_Ctr4
set_property PACKAGE_PIN R3 [get_ports {Frequency[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[4]}]

# Constraints for Freq_Ctr5
set_property PACKAGE_PIN T2 [get_ports {Frequency[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[5]}]

# Constraints for Freq_Ctr6
set_property PACKAGE_PIN T3 [get_ports {Frequency[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[6]}]

# Constraints for Freq_Ctr7
set_property PACKAGE_PIN V2 [get_ports {Frequency[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[7]}]

# Constraints for Freq_Ctr8
set_property PACKAGE_PIN W13 [get_ports {Frequency[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[8]}]

# Constraints for Freq_Ctr9
set_property PACKAGE_PIN W14 [get_ports {Frequency[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[9]}]

# Constraints for Freq_Ctr10
set_property PACKAGE_PIN V15 [get_ports {Frequency[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[10]}]

# Constraints for Freq_Ctr11
set_property PACKAGE_PIN W15 [get_ports {Frequency[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[11]}]

# Constraints for Freq_Ctr12
set_property PACKAGE_PIN W17 [get_ports {Frequency[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Frequency[12]}]

#OUTPUTS

## Constraints for Wave
#set_property PACKAGE_PIN W18 [get_ports Wave]
#set_property IOSTANDARD LVCMOS33 [get_ports Wave]

# Constraints for Disp
set_property PACKAGE_PIN W4 [get_ports {Disp[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[10]}]

# Constraints for Disp
set_property PACKAGE_PIN V4 [get_ports {Disp[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[9]}]

# Constraints for Disp
set_property PACKAGE_PIN U4 [get_ports {Disp[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[8]}]

# Constraints for Disp
set_property PACKAGE_PIN U2 [get_ports {Disp[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[7]}]

# Constraints for Disp
set_property PACKAGE_PIN W7 [get_ports {Disp[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[6]}]

# Constraints for Disp
set_property PACKAGE_PIN W6 [get_ports {Disp[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[5]}]

# Constraints for Disp
set_property PACKAGE_PIN U8 [get_ports {Disp[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[4]}]

# Constraints for Disp
set_property PACKAGE_PIN V8 [get_ports {Disp[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[3]}]

# Constraints for Disp
set_property PACKAGE_PIN U5 [get_ports {Disp[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[2]}]

# Constraints for Disp
set_property PACKAGE_PIN V5 [get_ports {Disp[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[1]}]

# Constraints for Disp
set_property PACKAGE_PIN U7 [get_ports {Disp[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Disp[0]}]

##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {Wave}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Wave}]


