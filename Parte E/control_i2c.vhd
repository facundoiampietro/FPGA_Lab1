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
-- Created on Thu Nov 07 20:11:43 2024

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_i2c IS
    PORT (
        reset : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        SDA : IN STD_LOGIC := '0';
        soy : IN STD_LOGIC := '0';
        fin_dato : IN STD_LOGIC := '0';
        fin_dir : IN STD_LOGIC := '0';
        Hab_dir : OUT STD_LOGIC;
        Hab_dat : OUT STD_LOGIC;
        ACK : OUT STD_LOGIC
    );
END control_i2c;

ARCHITECTURE BEHAVIOR OF control_i2c IS
    TYPE type_fstate IS (Idle,Start,Guarda_dir,RW,ACKNOLEDGEMENT,Guarda_dato);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,SDA,soy,fin_dato,fin_dir)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= Idle;
            Hab_dir <= '0';
            Hab_dat <= '0';
            ACK <= '0';
        ELSE
            Hab_dir <= '0';
            Hab_dat <= '0';
            ACK <= '0';
            CASE fstate IS
                WHEN Idle =>
                    IF ((SDA = '0')) THEN
                        reg_fstate <= Start;
                    ELSIF ((SDA = '1')) THEN
                        reg_fstate <= Idle;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Idle;
                    END IF;

                    ACK <= '0';

                    Hab_dat <= '0';

                    Hab_dir <= '0';
                WHEN Start =>
                    reg_fstate <= Guarda_dir;

                    ACK <= '0';

                    Hab_dat <= '0';

                    Hab_dir <= '0';
                WHEN Guarda_dir =>
                    IF (((fin_dir = '1') AND (soy = '0'))) THEN
                        reg_fstate <= Idle;
                    ELSIF ((fin_dir = '0')) THEN
                        reg_fstate <= Guarda_dir;
                    ELSIF (((fin_dir = '1') AND (soy = '1'))) THEN
                        reg_fstate <= RW;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Guarda_dir;
                    END IF;

                    ACK <= '0';

                    Hab_dat <= '0';

                    Hab_dir <= '1';
                WHEN RW =>
                    reg_fstate <= ACKNOLEDGEMENT;

                    ACK <= '0';

                    Hab_dat <= '0';

                    Hab_dir <= '0';
                WHEN ACKNOLEDGEMENT =>
                    reg_fstate <= Guarda_dato;

                    ACK <= '1';

                    Hab_dat <= '0';

                    Hab_dir <= '0';
                WHEN Guarda_dato =>
                    IF ((fin_dato = '0')) THEN
                        reg_fstate <= Guarda_dato;
                    ELSIF ((fin_dato = '1')) THEN
                        reg_fstate <= Idle;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Guarda_dato;
                    END IF;

                    ACK <= '0';

                    Hab_dat <= '1';

                    Hab_dir <= '0';
                WHEN OTHERS => 
                    Hab_dir <= 'X';
                    Hab_dat <= 'X';
                    ACK <= 'X';
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;