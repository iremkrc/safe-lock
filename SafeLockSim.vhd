--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:57:17 12/30/2021
-- Design Name:   
-- Module Name:   /home/irem/Desktop/Courses/Elec204/Safe Lock/SafeLock/SafeLockSim.vhd
-- Project Name:  SafeLock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SafeLockCode
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SafeLockSim IS
END SafeLockSim;
 
ARCHITECTURE behavior OF SafeLockSim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SafeLockCode
    PORT(
         MCLK : IN  std_logic;
         B0 : IN  std_logic;
         B1 : IN  std_logic;
         reset : IN  std_logic;
         inputNum : IN  std_logic_vector(3 downto 0);
         digit : IN  std_logic_vector(1 downto 0);
         password0 : INOUT  std_logic_vector(3 downto 0);
         password1 : INOUT  std_logic_vector(3 downto 0);
         password2 : INOUT  std_logic_vector(3 downto 0);
         password3 : INOUT  std_logic_vector(3 downto 0);
         try0 : INOUT  std_logic_vector(3 downto 0);
         try1 : INOUT  std_logic_vector(3 downto 0);
         try2 : INOUT  std_logic_vector(3 downto 0);
         try3 : INOUT  std_logic_vector(3 downto 0);
         SEVSEG_DATA : OUT  std_logic_vector(6 downto 0);
         SEVSEG_CONTROL : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal MCLK : std_logic := '0';
   signal B0 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal reset : std_logic := '0';
   signal inputNum : std_logic_vector(3 downto 0) := (others => '0');
   signal digit : std_logic_vector(1 downto 0) := (others => '0');

	--BiDirs
   signal password0 : std_logic_vector(3 downto 0);
   signal password1 : std_logic_vector(3 downto 0);
   signal password2 : std_logic_vector(3 downto 0);
   signal password3 : std_logic_vector(3 downto 0);
   signal try0 : std_logic_vector(3 downto 0);
   signal try1 : std_logic_vector(3 downto 0);
   signal try2 : std_logic_vector(3 downto 0);
   signal try3 : std_logic_vector(3 downto 0);

 	--Outputs
   signal SEVSEG_DATA : std_logic_vector(6 downto 0);
   signal SEVSEG_CONTROL : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant MCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SafeLockCode PORT MAP (
          MCLK => MCLK,
          B0 => B0,
          B1 => B1,
          reset => reset,
          inputNum => inputNum,
          digit => digit,
          password0 => password0,
          password1 => password1,
          password2 => password2,
          password3 => password3,
          try0 => try0,
          try1 => try1,
          try2 => try2,
          try3 => try3,
          SEVSEG_DATA => SEVSEG_DATA,
          SEVSEG_CONTROL => SEVSEG_CONTROL
        );

   -- Clock process definitions
   MCLK_process :process
   begin
		MCLK <= '0';
		wait for MCLK_period/2;
		MCLK <= '1';
		wait for MCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 105 ns;
		
		--Password entered: 1234
		digit <= "00";
		inputNum <= "0001";
		B0 <= '1';
		wait for MCLK_period;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "01";
		inputNum <= "0010";
		B0 <= '1';
		wait for MCLK_period;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "10";
		inputNum <= "0011";
		B0 <= '1';
		wait for MCLK_period;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "11";
		inputNum <= "0100";
		B0 <= '1';
		wait for MCLK_period;
		B0 <= '0';
		wait for MCLK_period;
		B1 <= '1';
		wait for MCLK_period;
		B1 <= '0';
		
		--First try: 9876
		wait for MCLK_period*2;
		digit <= "00";
		inputNum <= "1001";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';

		digit <= "01";
		inputNum <= "1000";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';

		digit <= "10";
		inputNum <= "0111";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';

		digit <= "11";
		inputNum <= "0110";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		B1 <= '1';
		wait for MCLK_period;
		B1 <= '0';
		
		
		--Second try: 8421
		wait for MCLK_period*2;
		digit <= "00";
		inputNum <= "1000";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';

		digit <= "01";
		inputNum <= "0100";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';

		digit <= "10";
		inputNum <= "0010";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';

		digit <= "11";
		inputNum <= "0001";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		B1 <= '1';
		wait for MCLK_period;
		B1 <= '0';
      wait for MCLK_period*10;
		
		--Third try: 89AB
		wait for MCLK_period*2;
		digit <= "00";
		inputNum <= "1000";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';

		digit <= "01";
		inputNum <= "1001";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';

		digit <= "10";
		inputNum <= "1010";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';

		digit <= "11";
		inputNum <= "1011";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		B1 <= '1';
		wait for MCLK_period;
		B1 <= '0';
		
		--Reset
      wait for MCLK_period*10;
		reset<= '1';
		wait for MCLK_period*2;
		reset<= '0';
		
		--Second Password entered: 4321
		digit <= "00";
		inputNum <= "0100";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "01";
		inputNum <= "0011";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "10";
		inputNum <= "0010";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "11";
		inputNum <= "0001";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		B1 <= '1';
		wait for MCLK_period*2;
		B1 <= '0';
		
		
		--Correct Try: 4321
		digit <= "00";
		inputNum <= "0100";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "01";
		inputNum <= "0011";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "10";
		inputNum <= "0010";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "11";
		inputNum <= "0001";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		B1 <= '1';
		wait for MCLK_period*2;
		B1 <= '0';
		
		--Master Key: 2021
		digit <= "00";
		inputNum <= "0010";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "01";
		inputNum <= "0000";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "10";
		inputNum <= "0010";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		digit <= "11";
		inputNum <= "0001";
		B0 <= '1';
		wait for MCLK_period*2;
		B0 <= '0';
		wait for MCLK_period;
		B1 <= '1';
		wait for MCLK_period*2;
		B1 <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
