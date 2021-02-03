transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/quartus-projects/lab1/Lab1.vhd}
vcom -93 -work work {D:/quartus-projects/lab1/OrGate.vhd}
vcom -93 -work work {D:/quartus-projects/lab1/AndGate.vhd}
vcom -93 -work work {D:/quartus-projects/lab1/NotGate.vhd}

vcom -93 -work work {D:/quartus-projects/lab1/TestBench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  TestBench

add wave *
view structure
view signals
run -all
