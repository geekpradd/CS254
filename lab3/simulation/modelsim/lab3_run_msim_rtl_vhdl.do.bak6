transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Courses/Sem4/cs226_digital_logic/CS254/lab3/Testbench_2mux.vhd}
vcom -93 -work work {D:/Courses/Sem4/cs226_digital_logic/CS254/lab3/AndGate.vhd}
vcom -93 -work work {D:/Courses/Sem4/cs226_digital_logic/CS254/lab3/NotGate.vhd}
vcom -93 -work work {D:/Courses/Sem4/cs226_digital_logic/CS254/lab3/TwoByOneMux.vhd}
vcom -93 -work work {D:/Courses/Sem4/cs226_digital_logic/CS254/lab3/FourByTwoEncode.vhd}
vcom -93 -work work {D:/Courses/Sem4/cs226_digital_logic/CS254/lab3/ORMux.vhd}
vcom -93 -work work {D:/Courses/Sem4/cs226_digital_logic/CS254/lab3/ANDMux.vhd}
vcom -93 -work work {D:/Courses/Sem4/cs226_digital_logic/CS254/lab3/TwoByFourDecode.vhd}
vcom -93 -work work {D:/Courses/Sem4/cs226_digital_logic/CS254/lab3/OrGate.vhd}

vcom -93 -work work {D:/Courses/Sem4/cs226_digital_logic/CS254/lab3/Testbench_2mux.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
