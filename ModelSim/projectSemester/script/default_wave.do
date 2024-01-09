# File Name: default_wave.do
# Description: This script adds objects to the waveform and applies input values

add wave -divider Input_ports
add wave sim:/TestBench_TL/tb_clk_i
add wave sim:/TestBench_TL/tb_rst_i
add wave sim:/TestBench_TL/tb_en_i
add wave sim:/TestBench_TL/tb_ser_i
add wave -radix unsigned sim:/TestBench_TL/tb_sw_i

add wave -divider Output_Ports
add wave sim:/TestBench_TL/tb_ser_o
add wave -radix unsigned sim:/TestBench_TL/tb_led_o
