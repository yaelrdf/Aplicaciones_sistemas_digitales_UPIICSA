-- Copyright (C) 2024  Intel Corporation. All rights reserved.
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
-- VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

-- DATE "10/14/2024 16:51:21"

-- 
-- Device: Altera EPM240T100C5 Package TQFP100
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

ENTITY 	COMPUERTAS IS
    PORT (
	A : IN std_logic;
	B : IN std_logic;
	AN : BUFFER std_logic;
	O : BUFFER std_logic;
	NO : BUFFER std_logic;
	NAN : BUFFER std_logic;
	ORN : BUFFER std_logic;
	ORX : BUFFER std_logic;
	NORX : BUFFER std_logic
	);
END COMPUERTAS;

-- Design Ports Information


ARCHITECTURE structure OF COMPUERTAS IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic;
SIGNAL ww_B : std_logic;
SIGNAL ww_AN : std_logic;
SIGNAL ww_O : std_logic;
SIGNAL ww_NO : std_logic;
SIGNAL ww_NAN : std_logic;
SIGNAL ww_ORN : std_logic;
SIGNAL ww_ORX : std_logic;
SIGNAL ww_NORX : std_logic;
SIGNAL \A~combout\ : std_logic;
SIGNAL \B~combout\ : std_logic;
SIGNAL \AN~0_combout\ : std_logic;
SIGNAL \O~0_combout\ : std_logic;
SIGNAL \ORX~0_combout\ : std_logic;
SIGNAL \ALT_INV_ORX~0_combout\ : std_logic;
SIGNAL \ALT_INV_O~0_combout\ : std_logic;
SIGNAL \ALT_INV_AN~0_combout\ : std_logic;
SIGNAL \ALT_INV_A~combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
AN <= ww_AN;
O <= ww_O;
NO <= ww_NO;
NAN <= ww_NAN;
ORN <= ww_ORN;
ORX <= ww_ORX;
NORX <= ww_NORX;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_ORX~0_combout\ <= NOT \ORX~0_combout\;
\ALT_INV_O~0_combout\ <= NOT \O~0_combout\;
\ALT_INV_AN~0_combout\ <= NOT \AN~0_combout\;
\ALT_INV_A~combout\ <= NOT \A~combout\;

-- Location: PIN_2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_A,
	combout => \A~combout\);

-- Location: PIN_4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_B,
	combout => \B~combout\);

-- Location: LC_X4_Y3_N5
\AN~0\ : maxii_lcell
-- Equation(s):
-- \AN~0_combout\ = (((\A~combout\ & \B~combout\)))

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
	datac => \A~combout\,
	datad => \B~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \AN~0_combout\);

-- Location: LC_X4_Y3_N4
\O~0\ : maxii_lcell
-- Equation(s):
-- \O~0_combout\ = (((\A~combout\) # (\B~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \A~combout\,
	datad => \B~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \O~0_combout\);

-- Location: LC_X4_Y3_N2
\ORX~0\ : maxii_lcell
-- Equation(s):
-- \ORX~0_combout\ = ((\A~combout\ $ (\B~combout\)))

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
	datac => \A~combout\,
	datad => \B~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ORX~0_combout\);

-- Location: PIN_1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\AN~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \AN~0_combout\,
	oe => VCC,
	padio => ww_AN);

-- Location: PIN_3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\O~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \O~0_combout\,
	oe => VCC,
	padio => ww_O);

-- Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\NO~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_A~combout\,
	oe => VCC,
	padio => ww_NO);

-- Location: PIN_7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\NAN~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_AN~0_combout\,
	oe => VCC,
	padio => ww_NAN);

-- Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ORN~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_O~0_combout\,
	oe => VCC,
	padio => ww_ORN);

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ORX~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ORX~0_combout\,
	oe => VCC,
	padio => ww_ORX);

-- Location: PIN_19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\NORX~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_ORX~0_combout\,
	oe => VCC,
	padio => ww_NORX);
END structure;


