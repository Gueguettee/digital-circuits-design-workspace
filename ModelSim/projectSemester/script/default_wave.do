# File Name: default_wave.do
# Description: This script adds objects to the waveform and applies input values

add wave -divider Input_ports
add wave sim:/TestBench_TL/tb_clk_i
add wave sim:/TestBench_TL/dut/clk_s
add wave sim:/TestBench_TL/dut/comp2/rst_i
add wave sim:/TestBench_TL/dut/comp2/en_i
add wave sim:/TestBench_TL/dut/comp2/shift_and_en_sn
add wave -radix unsigned sim:/TestBench_TL/tb_sw_i

add wave -divider Output_Ports
add wave sim:/TestBench_TL/tb_ser_o
add wave -radix unsigned sim:/TestBench_TL/tb_led_o
