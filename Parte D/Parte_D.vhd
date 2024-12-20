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

-- Generated by Quartus II Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition
-- Created on Thu Nov 07 02:52:21 2024

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Parte_D IS
    PORT (
        reset : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        x : IN STD_LOGIC := '0';
        Z4 : OUT STD_LOGIC;
        Z3 : OUT STD_LOGIC;
        Z2 : OUT STD_LOGIC;
        Z1 : OUT STD_LOGIC
    );
END Parte_D;

ARCHITECTURE BEHAVIOR OF Parte_D IS
    TYPE type_fstate IS (state2,state3,state5,state4,state1,state6,state7);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,x)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= state1;
            Z4 <= '0';
            Z3 <= '0';
            Z2 <= '0';
            Z1 <= '0';
        ELSE
            Z4 <= '0';
            Z3 <= '0';
            Z2 <= '0';
            Z1 <= '0';
            CASE fstate IS
                WHEN state2 =>
                    reg_fstate <= state4;

                    Z3 <= '1';

                    Z4 <= '0';

                    Z1 <= '0';

                    Z2 <= '1';
                WHEN state3 =>
                    reg_fstate <= state5;

                    Z3 <= '0';

                    Z4 <= '1';

                    Z1 <= '0';

                    Z2 <= '0';
                WHEN state5 =>
                    reg_fstate <= state4;

                    Z3 <= '1';

                    Z4 <= '1';

                    Z1 <= '0';

                    Z2 <= '0';
                WHEN state4 =>
                    IF ((x = '0')) THEN
                        reg_fstate <= state6;
                    ELSIF ((x = '1')) THEN
                        reg_fstate <= state7;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state4;
                    END IF;

                    Z3 <= '1';

                    Z4 <= '1';

                    Z1 <= '1';

                    Z2 <= '1';
                WHEN state1 =>
                    IF ((x = '0')) THEN
                        reg_fstate <= state2;
                    ELSIF ((x = '1')) THEN
                        reg_fstate <= state3;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state1;
                    END IF;

                    Z3 <= '0';

                    Z4 <= '0';

                    Z1 <= '0';

                    Z2 <= '0';
                WHEN state6 =>
                    reg_fstate <= state1;

                    Z3 <= '0';

                    Z4 <= '1';

                    Z1 <= '1';

                    Z2 <= '0';
                WHEN state7 =>
                    reg_fstate <= state1;

                    Z3 <= '1';

                    Z4 <= '1';

                    Z1 <= '0';

                    Z2 <= '0';
                WHEN OTHERS => 
                    Z4 <= 'X';
                    Z3 <= 'X';
                    Z2 <= 'X';
                    Z1 <= 'X';
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;
