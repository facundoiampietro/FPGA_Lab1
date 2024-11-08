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

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Thu Nov 07 23:28:50 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY control_esclavo IS 
	PORT
	(
		SDA :  IN  STD_LOGIC;
		SCL :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC
	);
END control_esclavo;

ARCHITECTURE bdf_type OF control_esclavo IS 

COMPONENT control_i2c
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 SDA : IN STD_LOGIC;
		 soy : IN STD_LOGIC;
		 fin_dato : IN STD_LOGIC;
		 fin_dir : IN STD_LOGIC;
		 Hab_dir : OUT STD_LOGIC;
		 Hab_dat : OUT STD_LOGIC;
		 ACK : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT almacenar_data
	PORT(SDA : IN STD_LOGIC;
		 SCL : IN STD_LOGIC;
		 hab_dat : IN STD_LOGIC;
		 fin_dato : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT almacenar_dir
	PORT(SDA : IN STD_LOGIC;
		 SCL : IN STD_LOGIC;
		 Hab_dir : IN STD_LOGIC;
		 fin_dir : OUT STD_LOGIC;
		 soy : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 



b2v_inst : control_i2c
PORT MAP(reset => reset,
		 clock => SCL,
		 SDA => SDA,
		 soy => SYNTHESIZED_WIRE_0,
		 fin_dato => SYNTHESIZED_WIRE_1,
		 fin_dir => SYNTHESIZED_WIRE_2,
		 Hab_dir => SYNTHESIZED_WIRE_4,
		 Hab_dat => SYNTHESIZED_WIRE_3);


b2v_inst2 : almacenar_data
PORT MAP(SDA => SDA,
		 SCL => SCL,
		 hab_dat => SYNTHESIZED_WIRE_3,
		 fin_dato => SYNTHESIZED_WIRE_1);


b2v_inst4 : almacenar_dir
PORT MAP(SDA => SDA,
		 SCL => SCL,
		 Hab_dir => SYNTHESIZED_WIRE_4,
		 fin_dir => SYNTHESIZED_WIRE_2,
		 soy => SYNTHESIZED_WIRE_0);


END bdf_type;