----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:15:28 12/27/2021 
-- Design Name: 
-- Module Name:    SafeLockCode - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SafeLockCode is
Generic (N : INTEGER:=50*10**6); --50*10ˆ6 Hz Clock
Port ( MCLK : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
			  B1 : in  STD_LOGIC;
			  reset : in STD_LOGIC;
			  
			  inputNum : in STD_LOGIC_VECTOR (3 downto 0);
			  digit : in STD_LOGIC_VECTOR (1 downto 0);
			  
			  password0 : inout STD_LOGIC_VECTOR (3 downto 0):="0000";
			  password1 : inout STD_LOGIC_VECTOR (3 downto 0):="0000";
			  password2 : inout STD_LOGIC_VECTOR (3 downto 0):="0000";
			  password3 : inout STD_LOGIC_VECTOR (3 downto 0):="0000";
			  
			  try0 : inout STD_LOGIC_VECTOR (3 downto 0):="0000";
			  try1 : inout STD_LOGIC_VECTOR (3 downto 0):="0000";
			  try2 : inout STD_LOGIC_VECTOR (3 downto 0):="0000";
			  try3 : inout STD_LOGIC_VECTOR (3 downto 0):="0000";
			  
			  SEVSEG_DATA : out  STD_LOGIC_VECTOR (6 DOWNTO 0);
           SEVSEG_CONTROL : out  STD_LOGIC_VECTOR (7 DOWNTO 0)
			  );
			  
end SafeLockCode;

architecture Behavioral of SafeLockCode is

component SSSLIB 
    PORT ( A : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
           B : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
           C : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
           D : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
           MCLK : IN  STD_LOGIC;
           SEVSEG_DATA : OUT  STD_LOGIC_VECTOR (6 DOWNTO 0);
           SEVSEG_CONTROL : OUT  STD_LOGIC_VECTOR (7 DOWNTO 0));
END component;

signal CLK_DIV : STD_LOGIC := '0';
signal exist : STD_LOGIC := '0';
signal out0 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
signal out1 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
signal out2 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
signal out3 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
signal tcount: STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
signal newTry : STD_LOGIC := '0';

begin

--Clock divider
process(MCLK)
	variable Counter : INTEGER range 0 to N;
	begin
		if rising_edge(MCLK) then
			Counter := Counter + 1;
			if (Counter = N/1-1) then
				Counter := 0;
				CLK_DIV <= not CLK_DIV;
			end if;
		end if;
	end process;

process(CLK_DIV)
	begin
	if rising_edge(CLK_DIV) then
		if(reset = '1') then
			password0 <= "0000";
			password1 <= "0000";
			password2 <= "0000";
			password3 <= "0000";
			try0 <= "0000";
			try1 <= "0000";
			try2 <= "0000";
			try3 <= "0000";
			out0 <= "00000";
			out1 <= "00000";
			out2 <= "00000";
			out3 <= "00000";
			tcount <= "00";
			exist <= '0';
			newTry <= '0';
		end if;
		
		if(exist = '0') then
			if(B1 = '1') then
				out0 <= "00000";
				out1 <= "00000";
				out2 <= "00000";
				out3 <= "00000";
				exist <= '1';
			elsif(digit = "00" and B0 = '1') then
				password0 <= inputNum; 
				out0 <= "0"&inputNum;
			elsif(digit = "01" and B0 = '1') then
				password1 <= inputNum;
				out1 <= "0"&inputNum;
			elsif(digit = "10" and B0 = '1') then
				password2 <= inputNum;
				out2 <= "0"&inputNum;
			elsif(digit = "11" and B0 = '1') then
				password3 <= inputNum;
				out3 <= "0"&inputNum;
			end if;
			
		else
			if(tcount < "11") then
				
				if(B1 = '1') then
					if((try0=password0 and try1=password1 and try2=password2 and try3=password3) or (try0="0010" and try1="0000" and try2="0010" and try3="0001")) then
						out0 <= "10000";
						out1 <= "10001";
						out2 <= "01110";
						out3 <= "10011";
						newTry <= '1';
					else
						out0 <= "01111";
						out1 <= "01010";
						out2 <= "10100";
						out3 <= "10101";
						tcount <= tcount+1;
						newTry <= '1';
					end if;
				end if;
				
				if(B0 = '1') then
					if(newTry = '1') then
						out0 <= "00000";
						out1 <= "00000";
						out2 <= "00000";
						out3 <= "00000";
						try0 <= "0000";
						try1 <= "0000";
						try2 <= "0000";
						try3 <= "0000";
						newTry <= '0';
					end if;
					if(digit = "00") then
						try0 <= inputNum;
						out0 <= "0"&inputNum;
					elsif(digit = "01") then
						try1 <= inputNum;
						out1 <= "0"&inputNum;
					elsif(digit = "10") then
						try2 <= inputNum;
						out2 <= "0"&inputNum;
					elsif(digit = "11") then
						try3 <= inputNum;
						out3 <= "0"&inputNum;
					end if;
				end if;
			else
				out0 <= "10101";
				out1 <= "10000";
				out2 <= "01100";
				out3 <= "10110";
			end if;
		end if;
	end if;
	end process;

pass : SSSLIB port map (out2, out3, out0, out1, MCLK,  SEVSEG_DATA, SEVSEG_CONTROL);

end Behavioral;

