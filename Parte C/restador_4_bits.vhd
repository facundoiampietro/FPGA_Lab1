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
-- CREATED		"Thu Nov 07 04:46:21 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY restador_4_bits IS 
	PORT
	(
		Borrow_in :  IN  STD_LOGIC;
		A0 :  IN  STD_LOGIC;
		B0 :  IN  STD_LOGIC;
		A1 :  IN  STD_LOGIC;
		B1 :  IN  STD_LOGIC;
		A2 :  IN  STD_LOGIC;
		B2 :  IN  STD_LOGIC;
		A3 :  IN  STD_LOGIC;
		B3 :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		D0 :  OUT  STD_LOGIC;
		D1 :  OUT  STD_LOGIC;
		D2 :  OUT  STD_LOGIC;
		D3 :  OUT  STD_LOGIC;
		Borrow_out :  OUT  STD_LOGIC;
		Zero :  OUT  STD_LOGIC
	);
END restador_4_bits;

ARCHITECTURE bdf_type OF restador_4_bits IS 

COMPONENT restador_completo
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Borrow_in : IN STD_LOGIC;
		 D : OUT STD_LOGIC;
		 Borrow_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT d_ff
	PORT(D : IN STD_LOGIC;
		 CLOCK : IN STD_LOGIC;
		 Q : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;


BEGIN 
D0 <= SYNTHESIZED_WIRE_9;
D1 <= SYNTHESIZED_WIRE_11;
D2 <= SYNTHESIZED_WIRE_10;
D3 <= SYNTHESIZED_WIRE_12;



b2v_inst : restador_completo
PORT MAP(A => SYNTHESIZED_WIRE_0,
		 B => SYNTHESIZED_WIRE_1,
		 Borrow_in => Borrow_in,
		 D => SYNTHESIZED_WIRE_13,
		 Borrow_out => SYNTHESIZED_WIRE_16);


b2v_inst1 : d_ff
PORT MAP(D => A0,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_0);


b2v_inst10 : restador_completo
PORT MAP(A => SYNTHESIZED_WIRE_2,
		 B => SYNTHESIZED_WIRE_3,
		 Borrow_in => SYNTHESIZED_WIRE_4,
		 D => SYNTHESIZED_WIRE_7,
		 Borrow_out => SYNTHESIZED_WIRE_8);


b2v_inst11 : d_ff
PORT MAP(D => A3,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_2);


b2v_inst12 : d_ff
PORT MAP(D => B3,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_3);


b2v_inst13 : d_ff
PORT MAP(D => SYNTHESIZED_WIRE_5,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_11);


b2v_inst14 : d_ff
PORT MAP(D => SYNTHESIZED_WIRE_6,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_10);


b2v_inst15 : d_ff
PORT MAP(D => SYNTHESIZED_WIRE_7,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_12);


b2v_inst16 : d_ff
PORT MAP(D => SYNTHESIZED_WIRE_8,
		 CLOCK => CLK,
		 Q => Borrow_out);


Zero <= NOT(SYNTHESIZED_WIRE_9 OR SYNTHESIZED_WIRE_10 OR SYNTHESIZED_WIRE_11 OR SYNTHESIZED_WIRE_12);


b2v_inst2 : d_ff
PORT MAP(D => B0,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_1);


b2v_inst3 : d_ff
PORT MAP(D => A1,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_14);


b2v_inst4 : d_ff
PORT MAP(D => SYNTHESIZED_WIRE_13,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_9);


b2v_inst5 : restador_completo
PORT MAP(A => SYNTHESIZED_WIRE_14,
		 B => SYNTHESIZED_WIRE_15,
		 Borrow_in => SYNTHESIZED_WIRE_16,
		 D => SYNTHESIZED_WIRE_5,
		 Borrow_out => SYNTHESIZED_WIRE_19);


b2v_inst6 : restador_completo
PORT MAP(A => SYNTHESIZED_WIRE_17,
		 B => SYNTHESIZED_WIRE_18,
		 Borrow_in => SYNTHESIZED_WIRE_19,
		 D => SYNTHESIZED_WIRE_6,
		 Borrow_out => SYNTHESIZED_WIRE_4);


b2v_inst7 : d_ff
PORT MAP(D => B1,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_15);


b2v_inst8 : d_ff
PORT MAP(D => A2,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_17);


b2v_inst9 : d_ff
PORT MAP(D => B2,
		 CLOCK => CLK,
		 Q => SYNTHESIZED_WIRE_18);


END bdf_type;