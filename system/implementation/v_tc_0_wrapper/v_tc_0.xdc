set_max_delay -from [all_registers -clock [get_clocks -of [get_ports clk]]] -to [all_registers -clock [get_clocks -of [get_ports s_axi_aclk]]] -datapath_only 2
set_max_delay -from [all_registers -clock [get_clocks -of [get_ports s_axi_aclk]]] -to [all_registers -clock [get_clocks -of [get_ports clk]]] -datapath_only 2
