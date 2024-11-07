transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte D/Parte_D.vhd}

vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte D/tb_Parte_D.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  tb_Parte_D

add wave *
view structure
view signals
run -all
