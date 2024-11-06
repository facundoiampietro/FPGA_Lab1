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

-- DATE "11/06/2024 11:27:23"

-- 
-- Device: Altera EP3C120F780C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Block2 IS
    PORT (
	LED : OUT std_logic;
	SW2 : IN std_logic;
	SW3 : IN std_logic;
	SW1 : IN std_logic
	);
END Block2;

-- Design Ports Information
-- LED	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW3	=>  Location: PIN_AC19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW2	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW1	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Block2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LED : std_logic;
SIGNAL ww_SW2 : std_logic;
SIGNAL ww_SW3 : std_logic;
SIGNAL ww_SW1 : std_logic;
SIGNAL \LED~output_o\ : std_logic;
SIGNAL \SW1~input_o\ : std_logic;
SIGNAL \SW2~input_o\ : std_logic;
SIGNAL \SW3~input_o\ : std_logic;
SIGNAL \inst3~combout\ : std_logic;

BEGIN

LED <= ww_LED;
ww_SW2 <= SW2;
ww_SW3 <= SW3;
ww_SW1 <= SW1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X72_Y0_N9
\LED~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3~combout\,
	devoe => ww_devoe,
	o => \LED~output_o\);

-- Location: IOIBUF_X56_Y0_N22
\SW1~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW1,
	o => \SW1~input_o\);

-- Location: IOIBUF_X85_Y0_N8
\SW2~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW2,
	o => \SW2~input_o\);

-- Location: IOIBUF_X94_Y0_N8
\SW3~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW3,
	o => \SW3~input_o\);

-- Location: LCCOMB_X84_Y1_N24
inst3 : cycloneiii_lcell_comb
-- Equation(s):
-- \inst3~combout\ = (\SW1~input_o\ & (!\SW2~input_o\)) # (!\SW1~input_o\ & ((\SW2~input_o\) # (\SW3~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW1~input_o\,
	datac => \SW2~input_o\,
	datad => \SW3~input_o\,
	combout => \inst3~combout\);

ww_LED <= \LED~output_o\;
END structure;


