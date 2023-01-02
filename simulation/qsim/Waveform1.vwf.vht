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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/04/2022 11:36:35"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ControlaFluxo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ControlaFluxo_vhd_vec_tst IS
END ControlaFluxo_vhd_vec_tst;
ARCHITECTURE ControlaFluxo_arch OF ControlaFluxo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Bloqueado : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL Full : STD_LOGIC;
SIGNAL Liberado : STD_LOGIC;
SIGNAL Pare : STD_LOGIC;
SIGNAL SE : STD_LOGIC;
SIGNAL SI : STD_LOGIC;
SIGNAL Senha : STD_LOGIC;
SIGNAL Time : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT ControlaFluxo
	PORT (
	Bloqueado : OUT STD_LOGIC;
	CLK : IN STD_LOGIC;
	Full : IN STD_LOGIC;
	Liberado : OUT STD_LOGIC;
	Pare : OUT STD_LOGIC;
	SE : IN STD_LOGIC;
	SI : IN STD_LOGIC;
	Senha : IN STD_LOGIC;
	\Time\ : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ControlaFluxo
	PORT MAP (
-- list connections between master ports and signals
	Bloqueado => Bloqueado,
	CLK => CLK,
	Full => Full,
	Liberado => Liberado,
	Pare => Pare,
	SE => SE,
	SI => SI,
	Senha => Senha,
	\Time\ => Time,
	reset => reset
	);

-- Full
t_prcs_Full: PROCESS
BEGIN
	Full <= '0';
WAIT;
END PROCESS t_prcs_Full;

-- CLK
t_prcs_CLK: PROCESS
BEGIN
	CLK <= '0';
WAIT;
END PROCESS t_prcs_CLK;

-- SE
t_prcs_SE: PROCESS
BEGIN
	SE <= '0';
WAIT;
END PROCESS t_prcs_SE;

-- SI
t_prcs_SI: PROCESS
BEGIN
	SI <= '0';
WAIT;
END PROCESS t_prcs_SI;

-- Senha
t_prcs_Senha: PROCESS
BEGIN
	Senha <= '0';
WAIT;
END PROCESS t_prcs_Senha;

-- Time
t_prcs_Time: PROCESS
BEGIN
	Time <= '0';
WAIT;
END PROCESS t_prcs_Time;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;
END ControlaFluxo_arch;
