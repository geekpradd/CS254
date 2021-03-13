-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "03/13/2021 16:47:25"

-- 
-- Device: Altera 5M40ZE64C4 Package EQFP64
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	AdderPreprocess IS
    PORT (
	a : IN std_logic_vector(7 DOWNTO 0);
	b : IN std_logic_vector(7 DOWNTO 0);
	c : OUT std_logic_vector(7 DOWNTO 0);
	d : OUT std_logic_vector(7 DOWNTO 0)
	);
END AdderPreprocess;

-- Design Ports Information


ARCHITECTURE structure OF AdderPreprocess IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_c : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_d : std_logic_vector(7 DOWNTO 0);
SIGNAL \chip0|chip1|chip2|chip2|Chip2|R~combout\ : std_logic;
SIGNAL \chip1|chip1|chip2|chip2|Chip2|R~combout\ : std_logic;
SIGNAL \chip2|chip1|chip2|chip2|Chip2|R~combout\ : std_logic;
SIGNAL \chip3|chip1|chip2|chip2|Chip2|R~combout\ : std_logic;
SIGNAL \chip4|chip1|chip2|chip2|Chip2|R~combout\ : std_logic;
SIGNAL \chip5|chip1|chip2|chip2|Chip2|R~combout\ : std_logic;
SIGNAL \chip6|chip1|chip2|chip2|Chip2|R~combout\ : std_logic;
SIGNAL \chip7|chip1|chip2|chip2|Chip2|R~combout\ : std_logic;
SIGNAL \chip0|chip2|chip2|chip2|Chip1|O~0_combout\ : std_logic;
SIGNAL \chip1|chip2|chip2|chip2|Chip1|O~0_combout\ : std_logic;
SIGNAL \chip2|chip2|chip2|chip2|Chip1|O~0_combout\ : std_logic;
SIGNAL \chip3|chip2|chip2|chip2|Chip1|O~0_combout\ : std_logic;
SIGNAL \chip4|chip2|chip2|chip2|Chip1|O~0_combout\ : std_logic;
SIGNAL \chip5|chip2|chip2|chip2|Chip1|O~0_combout\ : std_logic;
SIGNAL \chip6|chip2|chip2|chip2|Chip1|O~0_combout\ : std_logic;
SIGNAL \chip7|chip2|chip2|chip2|Chip1|O~0_combout\ : std_logic;
SIGNAL \a~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \b~combout\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_a <= a;
ww_b <= b;
c <= ww_c;
d <= ww_d;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(0),
	combout => \b~combout\(0));

-- Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(0),
	combout => \a~combout\(0));

-- Location: LC_X5_Y1_N8
\chip0|chip1|chip2|chip2|Chip2|R\ : maxv_lcell
-- Equation(s):
-- \chip0|chip1|chip2|chip2|Chip2|R~combout\ = ((\b~combout\(0) & ((\a~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \b~combout\(0),
	datad => \a~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip0|chip1|chip2|chip2|Chip2|R~combout\);

-- Location: PIN_1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(1),
	combout => \a~combout\(1));

-- Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(1),
	combout => \b~combout\(1));

-- Location: LC_X5_Y1_N5
\chip1|chip1|chip2|chip2|Chip2|R\ : maxv_lcell
-- Equation(s):
-- \chip1|chip1|chip2|chip2|Chip2|R~combout\ = ((\a~combout\(1) & ((\b~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\(1),
	datad => \b~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip1|chip1|chip2|chip2|Chip2|R~combout\);

-- Location: PIN_13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(2),
	combout => \b~combout\(2));

-- Location: PIN_46,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(2),
	combout => \a~combout\(2));

-- Location: LC_X5_Y1_N1
\chip2|chip1|chip2|chip2|Chip2|R\ : maxv_lcell
-- Equation(s):
-- \chip2|chip1|chip2|chip2|Chip2|R~combout\ = (((\b~combout\(2) & \a~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \b~combout\(2),
	datad => \a~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip2|chip1|chip2|chip2|Chip2|R~combout\);

-- Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(3),
	combout => \a~combout\(3));

-- Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(3),
	combout => \b~combout\(3));

-- Location: LC_X5_Y1_N3
\chip3|chip1|chip2|chip2|Chip2|R\ : maxv_lcell
-- Equation(s):
-- \chip3|chip1|chip2|chip2|Chip2|R~combout\ = (\a~combout\(3) & (((\b~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(3),
	datac => \b~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip3|chip1|chip2|chip2|Chip2|R~combout\);

-- Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(4),
	combout => \a~combout\(4));

-- Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(4),
	combout => \b~combout\(4));

-- Location: LC_X5_Y1_N7
\chip4|chip1|chip2|chip2|Chip2|R\ : maxv_lcell
-- Equation(s):
-- \chip4|chip1|chip2|chip2|Chip2|R~combout\ = (((\a~combout\(4) & \b~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \a~combout\(4),
	datad => \b~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip4|chip1|chip2|chip2|Chip2|R~combout\);

-- Location: PIN_7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(5),
	combout => \a~combout\(5));

-- Location: PIN_49,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(5),
	combout => \b~combout\(5));

-- Location: LC_X3_Y3_N6
\chip5|chip1|chip2|chip2|Chip2|R\ : maxv_lcell
-- Equation(s):
-- \chip5|chip1|chip2|chip2|Chip2|R~combout\ = ((\a~combout\(5) & ((\b~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\(5),
	datad => \b~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip5|chip1|chip2|chip2|Chip2|R~combout\);

-- Location: PIN_61,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(6),
	combout => \a~combout\(6));

-- Location: PIN_22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(6),
	combout => \b~combout\(6));

-- Location: LC_X3_Y3_N4
\chip6|chip1|chip2|chip2|Chip2|R\ : maxv_lcell
-- Equation(s):
-- \chip6|chip1|chip2|chip2|Chip2|R~combout\ = (((\a~combout\(6) & \b~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \a~combout\(6),
	datad => \b~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip6|chip1|chip2|chip2|Chip2|R~combout\);

-- Location: PIN_11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(7),
	combout => \b~combout\(7));

-- Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(7),
	combout => \a~combout\(7));

-- Location: LC_X3_Y3_N1
\chip7|chip1|chip2|chip2|Chip2|R\ : maxv_lcell
-- Equation(s):
-- \chip7|chip1|chip2|chip2|Chip2|R~combout\ = (((\b~combout\(7) & \a~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \b~combout\(7),
	datad => \a~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip7|chip1|chip2|chip2|Chip2|R~combout\);

-- Location: LC_X5_Y1_N6
\chip0|chip2|chip2|chip2|Chip1|O~0\ : maxv_lcell
-- Equation(s):
-- \chip0|chip2|chip2|chip2|Chip1|O~0_combout\ = (\b~combout\(0) $ (((\a~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \b~combout\(0),
	datad => \a~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip0|chip2|chip2|chip2|Chip1|O~0_combout\);

-- Location: LC_X5_Y1_N2
\chip1|chip2|chip2|chip2|Chip1|O~0\ : maxv_lcell
-- Equation(s):
-- \chip1|chip2|chip2|chip2|Chip1|O~0_combout\ = (\a~combout\(1) $ (((\b~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\(1),
	datad => \b~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip1|chip2|chip2|chip2|Chip1|O~0_combout\);

-- Location: LC_X5_Y1_N0
\chip2|chip2|chip2|chip2|Chip1|O~0\ : maxv_lcell
-- Equation(s):
-- \chip2|chip2|chip2|chip2|Chip1|O~0_combout\ = ((\b~combout\(2) $ (\a~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \b~combout\(2),
	datad => \a~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip2|chip2|chip2|chip2|Chip1|O~0_combout\);

-- Location: LC_X5_Y1_N9
\chip3|chip2|chip2|chip2|Chip1|O~0\ : maxv_lcell
-- Equation(s):
-- \chip3|chip2|chip2|chip2|Chip1|O~0_combout\ = \a~combout\(3) $ ((((\b~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5a5a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(3),
	datac => \b~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip3|chip2|chip2|chip2|Chip1|O~0_combout\);

-- Location: LC_X5_Y1_N4
\chip4|chip2|chip2|chip2|Chip1|O~0\ : maxv_lcell
-- Equation(s):
-- \chip4|chip2|chip2|chip2|Chip1|O~0_combout\ = ((\a~combout\(4) $ (\b~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \a~combout\(4),
	datad => \b~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip4|chip2|chip2|chip2|Chip1|O~0_combout\);

-- Location: LC_X3_Y3_N8
\chip5|chip2|chip2|chip2|Chip1|O~0\ : maxv_lcell
-- Equation(s):
-- \chip5|chip2|chip2|chip2|Chip1|O~0_combout\ = (\a~combout\(5) $ (((\b~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\(5),
	datad => \b~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip5|chip2|chip2|chip2|Chip1|O~0_combout\);

-- Location: LC_X3_Y3_N2
\chip6|chip2|chip2|chip2|Chip1|O~0\ : maxv_lcell
-- Equation(s):
-- \chip6|chip2|chip2|chip2|Chip1|O~0_combout\ = ((\a~combout\(6) $ (\b~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \a~combout\(6),
	datad => \b~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip6|chip2|chip2|chip2|Chip1|O~0_combout\);

-- Location: LC_X3_Y3_N5
\chip7|chip2|chip2|chip2|Chip1|O~0\ : maxv_lcell
-- Equation(s):
-- \chip7|chip2|chip2|chip2|Chip1|O~0_combout\ = ((\b~combout\(7) $ (\a~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \b~combout\(7),
	datad => \a~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \chip7|chip2|chip2|chip2|Chip1|O~0_combout\);

-- Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\c[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip0|chip1|chip2|chip2|Chip2|R~combout\,
	oe => VCC,
	padio => ww_c(0));

-- Location: PIN_10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\c[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip1|chip1|chip2|chip2|Chip2|R~combout\,
	oe => VCC,
	padio => ww_c(1));

-- Location: PIN_45,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\c[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip2|chip1|chip2|chip2|Chip2|R~combout\,
	oe => VCC,
	padio => ww_c(2));

-- Location: PIN_3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\c[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip3|chip1|chip2|chip2|Chip2|R~combout\,
	oe => VCC,
	padio => ww_c(3));

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\c[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip4|chip1|chip2|chip2|Chip2|R~combout\,
	oe => VCC,
	padio => ww_c(4));

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\c[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip5|chip1|chip2|chip2|Chip2|R~combout\,
	oe => VCC,
	padio => ww_c(5));

-- Location: PIN_64,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\c[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip6|chip1|chip2|chip2|Chip2|R~combout\,
	oe => VCC,
	padio => ww_c(6));

-- Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\c[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip7|chip1|chip2|chip2|Chip2|R~combout\,
	oe => VCC,
	padio => ww_c(7));

-- Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\d[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip0|chip2|chip2|chip2|Chip1|O~0_combout\,
	oe => VCC,
	padio => ww_d(0));

-- Location: PIN_4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\d[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip1|chip2|chip2|chip2|Chip1|O~0_combout\,
	oe => VCC,
	padio => ww_d(1));

-- Location: PIN_38,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\d[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip2|chip2|chip2|chip2|Chip1|O~0_combout\,
	oe => VCC,
	padio => ww_d(2));

-- Location: PIN_35,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\d[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip3|chip2|chip2|chip2|Chip1|O~0_combout\,
	oe => VCC,
	padio => ww_d(3));

-- Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\d[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip4|chip2|chip2|chip2|Chip1|O~0_combout\,
	oe => VCC,
	padio => ww_d(4));

-- Location: PIN_56,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\d[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip5|chip2|chip2|chip2|Chip1|O~0_combout\,
	oe => VCC,
	padio => ww_d(5));

-- Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\d[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip6|chip2|chip2|chip2|Chip1|O~0_combout\,
	oe => VCC,
	padio => ww_d(6));

-- Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\d[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \chip7|chip2|chip2|chip2|Chip1|O~0_combout\,
	oe => VCC,
	padio => ww_d(7));
END structure;


