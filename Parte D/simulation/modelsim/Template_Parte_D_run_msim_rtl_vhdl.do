transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte D/Template/Template_Parte_D.vhd}

