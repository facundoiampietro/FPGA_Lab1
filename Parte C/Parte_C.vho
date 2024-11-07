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

-- DATE "11/07/2024 12:31:50"

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

ENTITY 	restador_4_bits IS
    PORT (
	Borrow_in : IN std_logic;
	A0 : IN std_logic;
	B0 : IN std_logic;
	A1 : IN std_logic;
	B1 : IN std_logic;
	A2 : IN std_logic;
	B2 : IN std_logic;
	A3 : IN std_logic;
	B3 : IN std_logic;
	CLK : IN std_logic;
	D0 : OUT std_logic;
	D1 : OUT std_logic;
	D2 : OUT std_logic;
	D3 : OUT std_logic;
	Borrow_out : OUT std_logic;
	Zero : OUT std_logic
	);
END restador_4_bits;

-- Design Ports Information
-- D0	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Borrow_out	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zero	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Borrow_in	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A0	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B0	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B1	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A1	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A2	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B2	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A3	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B3	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF restador_4_bits IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Borrow_in : std_logic;
SIGNAL ww_A0 : std_logic;
SIGNAL ww_B0 : std_logic;
SIGNAL ww_A1 : std_logic;
SIGNAL ww_B1 : std_logic;
SIGNAL ww_A2 : std_logic;
SIGNAL ww_B2 : std_logic;
SIGNAL ww_A3 : std_logic;
SIGNAL ww_B3 : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_D0 : std_logic;
SIGNAL ww_D1 : std_logic;
SIGNAL ww_D2 : std_logic;
SIGNAL ww_D3 : std_logic;
SIGNAL ww_Borrow_out : std_logic;
SIGNAL ww_Zero : std_logic;
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \b2v_inst3|Q~q\ : std_logic;
SIGNAL \b2v_inst12|Q~q\ : std_logic;
SIGNAL \Borrow_in~input_o\ : std_logic;
SIGNAL \A1~input_o\ : std_logic;
SIGNAL \B3~input_o\ : std_logic;
SIGNAL \D0~output_o\ : std_logic;
SIGNAL \D1~output_o\ : std_logic;
SIGNAL \D2~output_o\ : std_logic;
SIGNAL \D3~output_o\ : std_logic;
SIGNAL \Borrow_out~output_o\ : std_logic;
SIGNAL \Zero~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \B0~input_o\ : std_logic;
SIGNAL \b2v_inst2|Q~feeder_combout\ : std_logic;
SIGNAL \b2v_inst2|Q~q\ : std_logic;
SIGNAL \A0~input_o\ : std_logic;
SIGNAL \b2v_inst1|Q~q\ : std_logic;
SIGNAL \b2v_inst|D~0_combout\ : std_logic;
SIGNAL \b2v_inst4|Q~q\ : std_logic;
SIGNAL \B1~input_o\ : std_logic;
SIGNAL \b2v_inst7|Q~feeder_combout\ : std_logic;
SIGNAL \b2v_inst7|Q~q\ : std_logic;
SIGNAL \b2v_inst|Borrow_out~0_combout\ : std_logic;
SIGNAL \b2v_inst5|D~combout\ : std_logic;
SIGNAL \b2v_inst13|Q~q\ : std_logic;
SIGNAL \B2~input_o\ : std_logic;
SIGNAL \b2v_inst9|Q~feeder_combout\ : std_logic;
SIGNAL \b2v_inst9|Q~q\ : std_logic;
SIGNAL \b2v_inst6|D~0_combout\ : std_logic;
SIGNAL \b2v_inst6|D~combout\ : std_logic;
SIGNAL \b2v_inst14|Q~q\ : std_logic;
SIGNAL \b2v_inst6|Borrow_out~0_combout\ : std_logic;
SIGNAL \A3~input_o\ : std_logic;
SIGNAL \b2v_inst11|Q~q\ : std_logic;
SIGNAL \A2~input_o\ : std_logic;
SIGNAL \b2v_inst8|Q~feeder_combout\ : std_logic;
SIGNAL \b2v_inst8|Q~q\ : std_logic;
SIGNAL \b2v_inst6|Borrow_out~1_combout\ : std_logic;
SIGNAL \b2v_inst6|Borrow_out~2_combout\ : std_logic;
SIGNAL \b2v_inst10|D~combout\ : std_logic;
SIGNAL \b2v_inst15|Q~q\ : std_logic;
SIGNAL \b2v_inst10|Borrow_out~0_combout\ : std_logic;
SIGNAL \b2v_inst16|Q~q\ : std_logic;
SIGNAL \Zero~0_combout\ : std_logic;
SIGNAL \ALT_INV_Zero~0_combout\ : std_logic;

BEGIN

ww_Borrow_in <= Borrow_in;
ww_A0 <= A0;
ww_B0 <= B0;
ww_A1 <= A1;
ww_B1 <= B1;
ww_A2 <= A2;
ww_B2 <= B2;
ww_A3 <= A3;
ww_B3 <= B3;
ww_CLK <= CLK;
D0 <= ww_D0;
D1 <= ww_D1;
D2 <= ww_D2;
D3 <= ww_D3;
Borrow_out <= ww_Borrow_out;
Zero <= ww_Zero;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
\ALT_INV_Zero~0_combout\ <= NOT \Zero~0_combout\;

-- Location: FF_X16_Y72_N7
\b2v_inst3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	asdata => \A1~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst3|Q~q\);

-- Location: FF_X16_Y72_N23
\b2v_inst12|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	asdata => \B3~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst12|Q~q\);

-- Location: IOIBUF_X16_Y73_N1
\Borrow_in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Borrow_in,
	o => \Borrow_in~input_o\);

-- Location: IOIBUF_X13_Y73_N22
\A1~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A1,
	o => \A1~input_o\);

-- Location: IOIBUF_X18_Y73_N15
\B3~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B3,
	o => \B3~input_o\);

-- Location: IOOBUF_X11_Y73_N9
\D0~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b2v_inst4|Q~q\,
	devoe => ww_devoe,
	o => \D0~output_o\);

-- Location: IOOBUF_X16_Y73_N16
\D1~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b2v_inst13|Q~q\,
	devoe => ww_devoe,
	o => \D1~output_o\);

-- Location: IOOBUF_X11_Y73_N23
\D2~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b2v_inst14|Q~q\,
	devoe => ww_devoe,
	o => \D2~output_o\);

-- Location: IOOBUF_X13_Y73_N9
\D3~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b2v_inst15|Q~q\,
	devoe => ww_devoe,
	o => \D3~output_o\);

-- Location: IOOBUF_X13_Y73_N2
\Borrow_out~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b2v_inst16|Q~q\,
	devoe => ww_devoe,
	o => \Borrow_out~output_o\);

-- Location: IOOBUF_X16_Y73_N23
\Zero~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Zero~0_combout\,
	devoe => ww_devoe,
	o => \Zero~output_o\);

-- Location: IOIBUF_X0_Y36_N1
\CLK~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G4
\CLK~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X18_Y73_N22
\B0~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B0,
	o => \B0~input_o\);

-- Location: LCCOMB_X16_Y72_N14
\b2v_inst2|Q~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst2|Q~feeder_combout\ = \B0~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \B0~input_o\,
	combout => \b2v_inst2|Q~feeder_combout\);

-- Location: FF_X16_Y72_N15
\b2v_inst2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \b2v_inst2|Q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst2|Q~q\);

-- Location: IOIBUF_X16_Y73_N8
\A0~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A0,
	o => \A0~input_o\);

-- Location: FF_X16_Y72_N29
\b2v_inst1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	asdata => \A0~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst1|Q~q\);

-- Location: LCCOMB_X16_Y72_N20
\b2v_inst|D~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst|D~0_combout\ = \Borrow_in~input_o\ $ (\b2v_inst2|Q~q\ $ (\b2v_inst1|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Borrow_in~input_o\,
	datac => \b2v_inst2|Q~q\,
	datad => \b2v_inst1|Q~q\,
	combout => \b2v_inst|D~0_combout\);

-- Location: FF_X16_Y72_N21
\b2v_inst4|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \b2v_inst|D~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst4|Q~q\);

-- Location: IOIBUF_X13_Y73_N15
\B1~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B1,
	o => \B1~input_o\);

-- Location: LCCOMB_X16_Y72_N8
\b2v_inst7|Q~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst7|Q~feeder_combout\ = \B1~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \B1~input_o\,
	combout => \b2v_inst7|Q~feeder_combout\);

-- Location: FF_X16_Y72_N9
\b2v_inst7|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \b2v_inst7|Q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst7|Q~q\);

-- Location: LCCOMB_X16_Y72_N24
\b2v_inst|Borrow_out~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst|Borrow_out~0_combout\ = (\Borrow_in~input_o\ & ((\b2v_inst2|Q~q\) # (!\b2v_inst1|Q~q\))) # (!\Borrow_in~input_o\ & (\b2v_inst2|Q~q\ & !\b2v_inst1|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Borrow_in~input_o\,
	datab => \b2v_inst2|Q~q\,
	datad => \b2v_inst1|Q~q\,
	combout => \b2v_inst|Borrow_out~0_combout\);

-- Location: LCCOMB_X16_Y72_N26
\b2v_inst5|D\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst5|D~combout\ = \b2v_inst3|Q~q\ $ (\b2v_inst7|Q~q\ $ (\b2v_inst|Borrow_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b2v_inst3|Q~q\,
	datab => \b2v_inst7|Q~q\,
	datad => \b2v_inst|Borrow_out~0_combout\,
	combout => \b2v_inst5|D~combout\);

-- Location: FF_X16_Y72_N27
\b2v_inst13|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \b2v_inst5|D~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst13|Q~q\);

-- Location: IOIBUF_X20_Y73_N1
\B2~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B2,
	o => \B2~input_o\);

-- Location: LCCOMB_X16_Y72_N4
\b2v_inst9|Q~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst9|Q~feeder_combout\ = \B2~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \B2~input_o\,
	combout => \b2v_inst9|Q~feeder_combout\);

-- Location: FF_X16_Y72_N5
\b2v_inst9|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \b2v_inst9|Q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst9|Q~q\);

-- Location: LCCOMB_X16_Y72_N6
\b2v_inst6|D~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst6|D~0_combout\ = \b2v_inst8|Q~q\ $ (\b2v_inst9|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b2v_inst8|Q~q\,
	datad => \b2v_inst9|Q~q\,
	combout => \b2v_inst6|D~0_combout\);

-- Location: LCCOMB_X16_Y72_N12
\b2v_inst6|D\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst6|D~combout\ = \b2v_inst6|D~0_combout\ $ (((\b2v_inst3|Q~q\ & (\b2v_inst7|Q~q\ & \b2v_inst|Borrow_out~0_combout\)) # (!\b2v_inst3|Q~q\ & ((\b2v_inst7|Q~q\) # (\b2v_inst|Borrow_out~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110110110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b2v_inst3|Q~q\,
	datab => \b2v_inst7|Q~q\,
	datac => \b2v_inst6|D~0_combout\,
	datad => \b2v_inst|Borrow_out~0_combout\,
	combout => \b2v_inst6|D~combout\);

-- Location: FF_X16_Y72_N13
\b2v_inst14|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \b2v_inst6|D~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst14|Q~q\);

-- Location: LCCOMB_X16_Y72_N0
\b2v_inst6|Borrow_out~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst6|Borrow_out~0_combout\ = (!\b2v_inst8|Q~q\ & \b2v_inst9|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b2v_inst8|Q~q\,
	datad => \b2v_inst9|Q~q\,
	combout => \b2v_inst6|Borrow_out~0_combout\);

-- Location: IOIBUF_X20_Y73_N8
\A3~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A3,
	o => \A3~input_o\);

-- Location: FF_X16_Y72_N25
\b2v_inst11|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	asdata => \A3~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst11|Q~q\);

-- Location: IOIBUF_X20_Y73_N22
\A2~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A2,
	o => \A2~input_o\);

-- Location: LCCOMB_X16_Y72_N10
\b2v_inst8|Q~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst8|Q~feeder_combout\ = \A2~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \A2~input_o\,
	combout => \b2v_inst8|Q~feeder_combout\);

-- Location: FF_X16_Y72_N11
\b2v_inst8|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \b2v_inst8|Q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst8|Q~q\);

-- Location: LCCOMB_X16_Y72_N22
\b2v_inst6|Borrow_out~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst6|Borrow_out~1_combout\ = (\b2v_inst9|Q~q\) # (!\b2v_inst8|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b2v_inst9|Q~q\,
	datad => \b2v_inst8|Q~q\,
	combout => \b2v_inst6|Borrow_out~1_combout\);

-- Location: LCCOMB_X16_Y72_N2
\b2v_inst6|Borrow_out~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst6|Borrow_out~2_combout\ = (\b2v_inst6|Borrow_out~1_combout\ & ((\b2v_inst3|Q~q\ & (\b2v_inst7|Q~q\ & \b2v_inst|Borrow_out~0_combout\)) # (!\b2v_inst3|Q~q\ & ((\b2v_inst7|Q~q\) # (\b2v_inst|Borrow_out~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b2v_inst3|Q~q\,
	datab => \b2v_inst7|Q~q\,
	datac => \b2v_inst6|Borrow_out~1_combout\,
	datad => \b2v_inst|Borrow_out~0_combout\,
	combout => \b2v_inst6|Borrow_out~2_combout\);

-- Location: LCCOMB_X16_Y72_N30
\b2v_inst10|D\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst10|D~combout\ = \b2v_inst12|Q~q\ $ (\b2v_inst11|Q~q\ $ (((\b2v_inst6|Borrow_out~0_combout\) # (\b2v_inst6|Borrow_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b2v_inst12|Q~q\,
	datab => \b2v_inst6|Borrow_out~0_combout\,
	datac => \b2v_inst11|Q~q\,
	datad => \b2v_inst6|Borrow_out~2_combout\,
	combout => \b2v_inst10|D~combout\);

-- Location: FF_X16_Y72_N31
\b2v_inst15|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \b2v_inst10|D~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst15|Q~q\);

-- Location: LCCOMB_X16_Y72_N16
\b2v_inst10|Borrow_out~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \b2v_inst10|Borrow_out~0_combout\ = (\b2v_inst12|Q~q\ & ((\b2v_inst6|Borrow_out~0_combout\) # ((\b2v_inst6|Borrow_out~2_combout\) # (!\b2v_inst11|Q~q\)))) # (!\b2v_inst12|Q~q\ & (!\b2v_inst11|Q~q\ & ((\b2v_inst6|Borrow_out~0_combout\) # 
-- (\b2v_inst6|Borrow_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b2v_inst12|Q~q\,
	datab => \b2v_inst6|Borrow_out~0_combout\,
	datac => \b2v_inst11|Q~q\,
	datad => \b2v_inst6|Borrow_out~2_combout\,
	combout => \b2v_inst10|Borrow_out~0_combout\);

-- Location: FF_X16_Y72_N17
\b2v_inst16|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \b2v_inst10|Borrow_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b2v_inst16|Q~q\);

-- Location: LCCOMB_X16_Y72_N18
\Zero~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Zero~0_combout\ = (\b2v_inst15|Q~q\) # ((\b2v_inst13|Q~q\) # ((\b2v_inst4|Q~q\) # (\b2v_inst14|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b2v_inst15|Q~q\,
	datab => \b2v_inst13|Q~q\,
	datac => \b2v_inst4|Q~q\,
	datad => \b2v_inst14|Q~q\,
	combout => \Zero~0_combout\);

ww_D0 <= \D0~output_o\;

ww_D1 <= \D1~output_o\;

ww_D2 <= \D2~output_o\;

ww_D3 <= \D3~output_o\;

ww_Borrow_out <= \Borrow_out~output_o\;

ww_Zero <= \Zero~output_o\;
END structure;


