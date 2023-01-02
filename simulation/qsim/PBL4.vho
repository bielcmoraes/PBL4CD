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

-- DATE "12/13/2022 14:40:45"

-- 
-- Device: Altera EPM240T100C5 Package TQFP100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

ENTITY 	ControlaFluxo IS
    PORT (
	CLK : IN std_logic;
	SE : IN std_logic;
	SI : IN std_logic;
	Full : IN std_logic;
	Contador : IN std_logic;
	Senha : IN std_logic;
	reset : IN std_logic;
	Liberado : OUT std_logic;
	Pare : OUT std_logic;
	Bloqueado : OUT std_logic;
	state : OUT std_logic_vector(3 DOWNTO 0)
	);
END ControlaFluxo;

-- Design Ports Information


ARCHITECTURE structure OF ControlaFluxo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_SE : std_logic;
SIGNAL ww_SI : std_logic;
SIGNAL ww_Full : std_logic;
SIGNAL ww_Contador : std_logic;
SIGNAL ww_Senha : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_Liberado : std_logic;
SIGNAL ww_Pare : std_logic;
SIGNAL ww_Bloqueado : std_logic;
SIGNAL ww_state : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \Senha~combout\ : std_logic;
SIGNAL \SI~combout\ : std_logic;
SIGNAL \SE~combout\ : std_logic;
SIGNAL \Full~combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \state[2]~reg0_regout\ : std_logic;
SIGNAL \state[0]~0_combout\ : std_logic;
SIGNAL \Contador~combout\ : std_logic;
SIGNAL \state[0]~1_combout\ : std_logic;
SIGNAL \state[0]~2_combout\ : std_logic;
SIGNAL \state[0]~3_combout\ : std_logic;
SIGNAL \state[0]~reg0_regout\ : std_logic;
SIGNAL \state[1]~5_combout\ : std_logic;
SIGNAL \state[1]~reg0_regout\ : std_logic;
SIGNAL \Liberado~reg0_regout\ : std_logic;
SIGNAL \Pare~reg0_regout\ : std_logic;
SIGNAL \Bloqueado~reg0_regout\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_SE <= SE;
ww_SI <= SI;
ww_Full <= Full;
ww_Contador <= Contador;
ww_Senha <= Senha;
ww_reset <= reset;
Liberado <= ww_Liberado;
Pare <= ww_Pare;
Bloqueado <= ww_Bloqueado;
state <= ww_state;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: PIN_1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Senha~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Senha,
	combout => \Senha~combout\);

-- Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SI~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_SI,
	combout => \SI~combout\);

-- Location: PIN_6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SE~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_SE,
	combout => \SE~combout\);

-- Location: PIN_100,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Full~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Full,
	combout => \Full~combout\);

-- Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: LC_X2_Y4_N1
\state[2]~reg0\ : maxii_lcell
-- Equation(s):
-- \state[2]~reg0_regout\ = DFFEAS((\state[1]~reg0_regout\ & (((\state[2]~reg0_regout\)))) # (!\state[1]~reg0_regout\ & ((\Full~combout\) # ((\state[0]~reg0_regout\ & \state[2]~reg0_regout\)))), GLOBAL(\CLK~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fe22",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \Full~combout\,
	datab => \state[1]~reg0_regout\,
	datac => \state[0]~reg0_regout\,
	datad => \state[2]~reg0_regout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state[2]~reg0_regout\);

-- Location: LC_X2_Y4_N4
\state[0]~0\ : maxii_lcell
-- Equation(s):
-- \state[0]~0_combout\ = (!\Full~combout\ & (((!\state[1]~reg0_regout\ & !\state[2]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0005",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Full~combout\,
	datac => \state[1]~reg0_regout\,
	datad => \state[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \state[0]~0_combout\);

-- Location: PIN_98,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Contador~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Contador,
	combout => \Contador~combout\);

-- Location: LC_X2_Y4_N0
\state[0]~1\ : maxii_lcell
-- Equation(s):
-- \state[0]~1_combout\ = (\state[0]~reg0_regout\ & ((\Senha~combout\) # ((\Contador~combout\)))) # (!\state[0]~reg0_regout\ & (((\SE~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "facc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Senha~combout\,
	datab => \SE~combout\,
	datac => \Contador~combout\,
	datad => \state[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \state[0]~1_combout\);

-- Location: LC_X2_Y4_N5
\state[0]~2\ : maxii_lcell
-- Equation(s):
-- \state[0]~2_combout\ = ((\state[1]~reg0_regout\ & (\SI~combout\ $ (!\state[0]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c030",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \SI~combout\,
	datac => \state[1]~reg0_regout\,
	datad => \state[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \state[0]~2_combout\);

-- Location: LC_X2_Y4_N6
\state[0]~3\ : maxii_lcell
-- Equation(s):
-- \state[0]~3_combout\ = (\state[2]~reg0_regout\) # ((\state[0]~2_combout\) # ((!\state[0]~1_combout\ & \state[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffba",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \state[2]~reg0_regout\,
	datab => \state[0]~1_combout\,
	datac => \state[0]~0_combout\,
	datad => \state[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \state[0]~3_combout\);

-- Location: LC_X2_Y4_N3
\state[0]~reg0\ : maxii_lcell
-- Equation(s):
-- \state[0]~reg0_regout\ = DFFEAS((\state[0]~reg0_regout\ & (((\state[0]~3_combout\)))) # (!\state[0]~reg0_regout\ & (\SE~combout\ & (\state[0]~0_combout\))), GLOBAL(\CLK~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ea40",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \state[0]~reg0_regout\,
	datab => \SE~combout\,
	datac => \state[0]~0_combout\,
	datad => \state[0]~3_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state[0]~reg0_regout\);

-- Location: LC_X2_Y4_N2
\state[1]~5\ : maxii_lcell
-- Equation(s):
-- \state[1]~5_combout\ = (\state[0]~reg0_regout\ & (\Senha~combout\)) # (!\state[0]~reg0_regout\ & (((\SI~combout\ & \SE~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aac0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Senha~combout\,
	datab => \SI~combout\,
	datac => \SE~combout\,
	datad => \state[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \state[1]~5_combout\);

-- Location: LC_X2_Y4_N7
\state[1]~reg0\ : maxii_lcell
-- Equation(s):
-- \state[1]~reg0_regout\ = DFFEAS((\state[1]~reg0_regout\ & ((\state[0]~3_combout\) # ((\state[1]~5_combout\ & \state[0]~0_combout\)))) # (!\state[1]~reg0_regout\ & (\state[1]~5_combout\ & (\state[0]~0_combout\))), GLOBAL(\CLK~combout\), 
-- !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eac0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \state[1]~reg0_regout\,
	datab => \state[1]~5_combout\,
	datac => \state[0]~0_combout\,
	datad => \state[0]~3_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state[1]~reg0_regout\);

-- Location: LC_X2_Y4_N8
\Liberado~reg0\ : maxii_lcell
-- Equation(s):
-- \Liberado~reg0_regout\ = DFFEAS(((!\state[2]~reg0_regout\ & (\state[1]~reg0_regout\ $ (\state[0]~reg0_regout\)))), GLOBAL(\CLK~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "003c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datab => \state[1]~reg0_regout\,
	datac => \state[0]~reg0_regout\,
	datad => \state[2]~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Liberado~reg0_regout\);

-- Location: LC_X2_Y3_N2
\Pare~reg0\ : maxii_lcell
-- Equation(s):
-- \Pare~reg0_regout\ = DFFEAS(((\state[0]~reg0_regout\ & (\state[1]~reg0_regout\ & !\state[2]~reg0_regout\))), GLOBAL(\CLK~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datab => \state[0]~reg0_regout\,
	datac => \state[1]~reg0_regout\,
	datad => \state[2]~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Pare~reg0_regout\);

-- Location: LC_X2_Y4_N9
\Bloqueado~reg0\ : maxii_lcell
-- Equation(s):
-- \Bloqueado~reg0_regout\ = DFFEAS(((!\state[1]~reg0_regout\ & (!\state[0]~reg0_regout\ & \state[2]~reg0_regout\))), GLOBAL(\CLK~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0300",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datab => \state[1]~reg0_regout\,
	datac => \state[0]~reg0_regout\,
	datad => \state[2]~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Bloqueado~reg0_regout\);

-- Location: PIN_99,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Liberado~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Liberado~reg0_regout\,
	oe => VCC,
	padio => ww_Liberado);

-- Location: PIN_4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Pare~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Pare~reg0_regout\,
	oe => VCC,
	padio => ww_Pare);

-- Location: PIN_3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Bloqueado~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Bloqueado~reg0_regout\,
	oe => VCC,
	padio => ww_Bloqueado);

-- Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\state[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \state[0]~reg0_regout\,
	oe => VCC,
	padio => ww_state(0));

-- Location: PIN_2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\state[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \state[1]~reg0_regout\,
	oe => VCC,
	padio => ww_state(1));

-- Location: PIN_7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\state[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \state[2]~reg0_regout\,
	oe => VCC,
	padio => ww_state(2));

-- Location: PIN_66,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\state[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_state(3));
END structure;


