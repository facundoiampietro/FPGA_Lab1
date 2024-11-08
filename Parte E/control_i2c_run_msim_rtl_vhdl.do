transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte E/control_esclavo.vhd}
vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte E/control_i2c.vhd}
vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte E/almacenar_data.vhd}
vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte E/almacenar_dirección.vhd}

vcom -93 -work work {C:/Users/Facu/Documents/FPGA_Lab1/Parte E/tb_control_esclavo.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  tb_control_esclavo

add wave *
view structure
view signals
run -all
