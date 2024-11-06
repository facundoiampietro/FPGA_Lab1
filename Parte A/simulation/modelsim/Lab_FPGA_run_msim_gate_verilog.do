transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Lab_FPGA.vo}

vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte A/Lab_FPGA_testbench.vhdl}

vsim -t 1ps -L altera_ver -L cycloneiii_ver -L gate_work -L work -voptargs="+acc"  Lab_FPGA_testbench

add wave *
view structure
view signals
run -all
