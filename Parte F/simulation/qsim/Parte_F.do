onerror {quit -f}
vlib work
vlog -work work Parte_F.vo
vlog -work work Parte_F.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.divisor_vlg_vec_tst
vcd file -direction Parte_F.msim.vcd
vcd add -internal divisor_vlg_vec_tst/*
vcd add -internal divisor_vlg_vec_tst/i1/*
add wave /*
run -all
