----------------------------------------------------------------------------------
-- COMPANY: 	KOC UNIVERSITY
-- ENGINEER: 	ONURHAN OZTURK
-- 
-- CREATE DATE:    18:21:21 04/26/2016 
-- DESIGN NAME: 	
-- MODULE NAME:    SEVSEG_DECODER - BEHAVIORAL 
-- PROJECT NAME: 	 SSSLIB
-- TARGET DEVICES: SPARTAN 3E
-- TOOL VERSIONS: 
-- DESCRIPTION: 
--
-- DEPENDENCIES: 
--
-- REVISION: 
-- REVISION 0.01 - FILE CREATED
-- ADDITIONAL COMMENTS: 
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- UNCOMMENT THE FOLLOWING LIBRARY DECLARATION IF USING
-- ARITHMETIC FUNCTIONS WITH SIGNED OR UNSIGNED VALUES
--USE IEEE.NUMERIC_STD.ALL;

-- UNCOMMENT THE FOLLOWING LIBRARY DECLARATION IF INSTANTIATING
-- ANY XILINX PRIMITIVES IN THIS CODE.
--LIBRARY UNISIM;
--USE UNISIM.VCOMPONENTS.ALL;

ENTITY SEVSEG_DECODER IS
    PORT ( INPUT : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
           SEVSEG_BUS : OUT  STD_LOGIC_VECTOR (6 DOWNTO 0));
END SEVSEG_DECODER;

ARCHITECTURE BEHAVIORAL OF SEVSEG_DECODER IS

BEGIN

WITH INPUT SELECT SEVSEG_BUS <=
	"0000001" WHEN "00000", --0
	"1001111" WHEN "00001", --1
	"0010010" WHEN "00010", --2
	"0000110" WHEN "00011", --3
	"1001100" WHEN "00100", --4
	"0100100" WHEN "00101", --5
	"0100000" WHEN "00110", --6
	"0001111" WHEN "00111", --7
	"0000000" WHEN "01000", --8
	"0000100" WHEN "01001", --9
	"0001000" WHEN "01010", --A
	"1100000" WHEN "01011", --B
	"0110001" WHEN "01100", --C
	"1000010" WHEN "01101", --D
	"0110000" WHEN "01110", --E
	"0111000" WHEN "01111", --F
	"1100010" WHEN "10000", --O
	"0011000" WHEN "10001", --P
	"0001001" WHEN "10011", --N
	"1111001" WHEN "10100", --I
	"1110001" WHEN "10101", --L
	"0101000" WHEN "10110", --K
	"0000001" WHEN OTHERS;
END BEHAVIORAL;

