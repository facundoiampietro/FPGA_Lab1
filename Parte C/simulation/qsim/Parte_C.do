onerror {quit -f}
vlib work
vlog -work work Parte_C.vo
vlog -work work Parte_C.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.restador_4_bits_vlg_vec_tst
vcd file -direction Parte_C.msim.vcd
vcd add -internal restador_4_bits_vlg_vec_tst/*
vcd add -internal restador_4_bits_vlg_vec_tst/i1/*
add wave /*
run -all
