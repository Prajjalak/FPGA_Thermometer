# Copyright (C) 2018  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details.

# Quartus Prime: Generate Tcl File for Project
# File: temperature_RS232.tcl
# Generated on: Tue May 09 18:07:29 2023

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "temperature_RS232"]} {
		puts "Project temperature_RS232 is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists temperature_RS232]} {
		project_open -revision temperature_RS232 temperature_RS232
	} else {
		project_new -revision temperature_RS232 temperature_RS232
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 18.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "10:55:56  APRIL 17, 2023"
	set_global_assignment -name LAST_QUARTUS_VERSION "18.1.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name FLOW_ENABLE_POWER_ANALYZER ON
	set_global_assignment -name VHDL_FILE temperature_RS232.vhd
	set_global_assignment -name VHDL_FILE mod_m_counter.vhd
	set_global_assignment -name VHDL_FILE uart.vhd
	set_global_assignment -name VHDL_FILE uart_rx.vhd
	set_global_assignment -name VHDL_FILE fifo.vhd
	set_global_assignment -name VHDL_FILE uart_tx.vhd
	set_global_assignment -name VHDL_FILE Tflipflopasynchronous.vhd
	set_global_assignment -name VERILOG_FILE ds18b20_drive.v
	set_global_assignment -name VERILOG_FILE seg_dynamic_drive.v
	set_global_assignment -name VERILOG_FILE "module ds18b20_seg7.v"
	set_global_assignment -name SIGNALTAP_FILE stp1.stp
	set_global_assignment -name SIGNALTAP_FILE output_files/stp1.stp
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name OPTIMIZATION_MODE BALANCED
	set_global_assignment -name FAMILY "MAX 10"
	set_global_assignment -name PROJECT_IP_REGENERATION_POLICY ALWAYS_REGENERATE_IP
	set_global_assignment -name DEVICE 10M02SCE144C8G
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
	set_global_assignment -name ENABLE_SIGNALTAP OFF
	set_global_assignment -name USE_SIGNALTAP_FILE output_files/stp1.stp
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name POWER_DEFAULT_INPUT_IO_TOGGLE_RATE "12.5 %"
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_location_assignment PIN_28 -to CLOCK_50
	set_location_assignment PIN_19 -to DS18B20
	set_location_assignment PIN_26 -to TX
	set_location_assignment PIN_27 -to RX
	set_location_assignment PIN_54 -to RX_empty
	set_location_assignment PIN_55 -to TX_full
	set_location_assignment PIN_52 -to SEG7_SEG[7]
	set_location_assignment PIN_59 -to SEG7_SEG[6]
	set_location_assignment PIN_61 -to SEG7_SEG[5]
	set_location_assignment PIN_63 -to SEG7_SEG[4]
	set_location_assignment PIN_67 -to SEG7_SEG[3]
	set_location_assignment PIN_69 -to SEG7_SEG[2]
	set_location_assignment PIN_76 -to SEG7_SEG[1]
	set_location_assignment PIN_78 -to SEG7_SEG[0]
	set_location_assignment PIN_68 -to SEG7_SEL[3]
	set_location_assignment PIN_75 -to SEG7_SEL[2]
	set_location_assignment PIN_77 -to SEG7_SEL[1]
	set_location_assignment PIN_79 -to SEG7_SEL[0]
	set_location_assignment PIN_14 -to r_data[0]
	set_location_assignment PIN_9 -to r_data[1]
	set_location_assignment PIN_7 -to r_data[2]
	set_location_assignment PIN_5 -to r_data[3]
	set_location_assignment PIN_3 -to r_data[4]
	set_location_assignment PIN_140 -to r_data[5]
	set_location_assignment PIN_138 -to r_data[6]
	set_location_assignment PIN_134 -to r_data[7]
	set_location_assignment PIN_70 -to disp_rst
	set_location_assignment PIN_74 -to uart_rst
	set_location_assignment PIN_103 -to FF_rst
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DS18B20
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TX
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RX
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RX_empty
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TX_full
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to r_data[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to r_data[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to r_data[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to r_data[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to r_data[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to r_data[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to r_data[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to r_data[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to r_data
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEG[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEG[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEG[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEG[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEG[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEG[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEG[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEG[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEG
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEL[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEL[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEL[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEL[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SEG7_SEL
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to disp_rst
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to uart_rst
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FF_rst
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Including default assignments
	set_global_assignment -name TIMING_ANALYZER_MULTICORNER_ANALYSIS ON -family "MAX 10"
	set_global_assignment -name TIMING_ANALYZER_REPORT_WORST_CASE_TIMING_PATHS OFF -family "MAX 10"
	set_global_assignment -name TIMING_ANALYZER_CCPP_TRADEOFF_TOLERANCE 0 -family "MAX 10"
	set_global_assignment -name TDC_CCPP_TRADEOFF_TOLERANCE 0 -family "MAX 10"
	set_global_assignment -name TIMING_ANALYZER_DO_CCPP_REMOVAL ON -family "MAX 10"
	set_global_assignment -name DISABLE_LEGACY_TIMING_ANALYZER OFF -family "MAX 10"
	set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS ON -family "MAX 10"
	set_global_assignment -name SYNCHRONIZATION_REGISTER_CHAIN_LENGTH 2 -family "MAX 10"
	set_global_assignment -name SYNTH_RESOURCE_AWARE_INFERENCE_FOR_BLOCK_RAM ON -family "MAX 10"
	set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS" -family "MAX 10"
	set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON -family "MAX 10"
	set_global_assignment -name AUTO_DELAY_CHAINS ON -family "MAX 10"
	set_global_assignment -name CRC_ERROR_OPEN_DRAIN OFF -family "MAX 10"
	set_global_assignment -name USE_CONFIGURATION_DEVICE ON -family "MAX 10"
	set_global_assignment -name ENABLE_OCT_DONE ON -family "MAX 10"

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
