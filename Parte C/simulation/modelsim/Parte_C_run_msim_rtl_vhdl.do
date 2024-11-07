transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte C/restador_completo.vhd}
vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte B/D_FF.vhd}

