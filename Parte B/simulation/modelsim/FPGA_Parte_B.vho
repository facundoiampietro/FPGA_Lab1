-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "11/07/2024 00:07:35"

-- 
-- Device: Altera EP3C120F780C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	restador_completo IS
    PORT (
	ext_A : IN std_logic;
	ext_B : IN std_logic;
	ext_Borrow_in : IN std_logic;
	clk : IN std_logic;
	ext_D : OUT std_logic;
	ext_Borrow_out : OUT std_logic
	);
END restador_completo;

-- Design Ports Information
-- ext_D	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ext_Borrow_out	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ext_A	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ext_B	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ext_Borrow_in	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF restador_completo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_ext_A : std_logic;
SIGNAL ww_ext_B : std_logic;
SIGNAL ww_ext_Borrow_in : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_ext_D : std_logic;
SIGNAL ww_ext_Borrow_out : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ext_D~output_o\ : std_logic;
SIGNAL \ext_Borrow_out~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \ext_A~input_o\ : std_logic;
SIGNAL \FF_A|Q~feeder_combout\ : std_logic;
SIGNAL \FF_A|Q~q\ : std_logic;
SIGNAL \ext_B~input_o\ : std_logic;
SIGNAL \FF_B|Q~feeder_combout\ : std_logic;
SIGNAL \FF_B|Q~q\ : std_logic;
SIGNAL \ext_Borrow_in~input_o\ : std_logic;
SIGNAL \FF_Borrow_in|Q~feeder_combout\ : std_logic;
SIGNAL \FF_Borrow_in|Q~q\ : std_logic;
SIGNAL \d~0_combout\ : std_logic;
SIGNAL \FF_Diff|Q~q\ : std_logic;
SIGNAL \bout~0_combout\ : std_logic;
SIGNAL \FF_Borrow_out|Q~q\ : std_logic;

BEGIN

ww_ext_A <= ext_A;
ww_ext_B <= ext_B;
ww_ext_Borrow_in <= ext_Borrow_in;
ww_clk <= clk;
ext_D <= ww_ext_D;
ext_Borrow_out <= ww_ext_Borrow_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X0_Y63_N23
\ext_D~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FF_Diff|Q~q\,
	devoe => ww_devoe,
	o => \ext_D~output_o\);

-- Location: IOOBUF_X0_Y62_N23
\ext_Borrow_out~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FF_Borrow_out|Q~q\,
	devoe => ww_devoe,
	o => \ext_Borrow_out~output_o\);

-- Location: IOIBUF_X0_Y36_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X81_Y0_N22
\ext_A~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ext_A,
	o => \ext_A~input_o\);

-- Location: LCCOMB_X1_Y62_N4
\FF_A|Q~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \FF_A|Q~feeder_combout\ = \ext_A~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ext_A~input_o\,
	combout => \FF_A|Q~feeder_combout\);

-- Location: FF_X1_Y62_N5
\FF_A|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \FF_A|Q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FF_A|Q~q\);

-- Location: IOIBUF_X0_Y62_N15
\ext_B~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ext_B,
	o => \ext_B~input_o\);

-- Location: LCCOMB_X1_Y62_N26
\FF_B|Q~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \FF_B|Q~feeder_combout\ = \ext_B~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ext_B~input_o\,
	combout => \FF_B|Q~feeder_combout\);

-- Location: FF_X1_Y62_N27
\FF_B|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \FF_B|Q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FF_B|Q~q\);

-- Location: IOIBUF_X0_Y61_N22
\ext_Borrow_in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ext_Borrow_in,
	o => \ext_Borrow_in~input_o\);

-- Location: LCCOMB_X1_Y62_N16
\FF_Borrow_in|Q~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \FF_Borrow_in|Q~feeder_combout\ = \ext_Borrow_in~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ext_Borrow_in~input_o\,
	combout => \FF_Borrow_in|Q~feeder_combout\);

-- Location: FF_X1_Y62_N17
\FF_Borrow_in|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \FF_Borrow_in|Q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FF_Borrow_in|Q~q\);

-- Location: LCCOMB_X1_Y62_N24
\d~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d~0_combout\ = \FF_A|Q~q\ $ (\FF_B|Q~q\ $ (\FF_Borrow_in|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FF_A|Q~q\,
	datac => \FF_B|Q~q\,
	datad => \FF_Borrow_in|Q~q\,
	combout => \d~0_combout\);

-- Location: FF_X1_Y62_N25
\FF_Diff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \d~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FF_Diff|Q~q\);

-- Location: LCCOMB_X1_Y62_N18
\bout~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \bout~0_combout\ = (\FF_Borrow_in|Q~q\ & ((\FF_B|Q~q\) # (!\FF_A|Q~q\))) # (!\FF_Borrow_in|Q~q\ & (\FF_B|Q~q\ & !\FF_A|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FF_Borrow_in|Q~q\,
	datac => \FF_B|Q~q\,
	datad => \FF_A|Q~q\,
	combout => \bout~0_combout\);

-- Location: FF_X1_Y62_N19
\FF_Borrow_out|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FF_Borrow_out|Q~q\);

ww_ext_D <= \ext_D~output_o\;

ww_ext_Borrow_out <= \ext_Borrow_out~output_o\;
END structure;


