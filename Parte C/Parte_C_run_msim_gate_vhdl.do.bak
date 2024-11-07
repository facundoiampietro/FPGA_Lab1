transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {Parte_C.vho}

vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte C/restador_4_bits_testbench.vhd}

vsim -t 1ps -L altera -L cycloneiii -L gate_work -L work -voptargs="+acc"  restador_4_bits_testbench

add wave *
view structure
view signals
run -all
