----------------------------------------------------------------------------------
-- COMPANY: 	KOC UNIVERSITY
-- ENGINEER: 	ONURHAN OZTURK
-- 
-- CREATE DATE:    18:21:21 04/26/2016 
-- DESIGN NAME: 	
-- MODULE NAME:    SEVSEG_DRIVER - BEHAVIORAL 
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
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- UNCOMMENT THE FOLLOWING LIBRARY DECLARATION IF USING
-- ARITHMETIC FUNCTIONS WITH SIGNED OR UNSIGNED VALUES
USE IEEE.NUMERIC_STD.ALL;

-- UNCOMMENT THE FOLLOWING LIBRARY DECLARATION IF INSTANTIATING
-- ANY XILINX PRIMITIVES IN THIS CODE.
--LIBRARY UNISIM;
--USE UNISIM.VCOMPONENTS.ALL;

ENTITY SEVSEG_DRIVER IS
    PORT ( A : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
           B : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
			  C : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
           D : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
           CLK : IN  STD_LOGIC;
			  SEV_SEG_DATA : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
           SEV_SEG_DRIVER : OUT  STD_LOGIC_VECTOR (7 DOWNTO 0));
END SEVSEG_DRIVER;

ARCHITECTURE BEHAVIORAL OF SEVSEG_DRIVER IS

SIGNAL COUNTER : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
BEGIN

--INCREMENT COUNTER
PROCESS_CLK : PROCESS(CLK)
BEGIN
	IF(CLK'EVENT AND CLK = '1') THEN
		COUNTER <= COUNTER + 1;
	END IF;
END PROCESS;

-- SEV_SEG DATA
WITH COUNTER SELECT SEV_SEG_DATA <=
D WHEN "00",
C WHEN "01",
B WHEN "10",
A WHEN "11",
"01101" WHEN OTHERS; 
--DATA END

--SEV_SEG_CONTROLLER
WITH COUNTER SELECT SEV_SEG_DRIVER <=
"11101111" WHEN "00",
"11011111" WHEN "01",
"10111111" WHEN "10",
"01111111" WHEN "11",
"00001111" WHEN OTHERS;
--SEV_SEG CONTROLLER END

END BEHAVIORAL;

