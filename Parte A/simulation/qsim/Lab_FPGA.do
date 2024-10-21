onerror {quit -f}
vlib work
vlog -work work Lab_FPGA.vo
vlog -work work Lab_FPGA.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Lab_FPGA_vlg_vec_tst
vcd file -direction Lab_FPGA.msim.vcd
vcd add -internal Lab_FPGA_vlg_vec_tst/*
vcd add -internal Lab_FPGA_vlg_vec_tst/i1/*
add wave /*
run -all
