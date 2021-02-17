transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/quartus-projects/lab4/lab4.vhd}
vcom -93 -work work {D:/quartus-projects/lab4/Testbench.vhd}
vcom -93 -work work {D:/quartus-projects/lab4/TwoByOneMux.vhd}
vcom -93 -work work {D:/quartus-projects/lab4/OrGate.vhd}
vcom -93 -work work {D:/quartus-projects/lab4/OnebitHalfAdd.vhd}
vcom -93 -work work {D:/quartus-projects/lab4/OnebitFullAdd.vhd}
vcom -93 -work work {D:/quartus-projects/lab4/AndGate.vhd}
vcom -93 -work work {D:/quartus-projects/lab4/FourbitFullAdd.vhd}
vcom -93 -work work {D:/quartus-projects/lab4/NotGate.vhd}

vcom -93 -work work {D:/quartus-projects/lab4/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
