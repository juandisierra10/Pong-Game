----------VHDL CONVERTER BCD TO 7 SEGMENTS---------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------
ENTITY bin_to_sseg IS
	PORT(bin   : IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		  sseg  : OUT  STD_LOGIC_VECTOR(13 DOWNTO 0)
		  );
END ENTITY bin_to_sseg;
-------------------------------
ARCHITECTURE behaviour OF bin_to_sseg IS
BEGIN
----------Selection of numbers-----------
	WITH bin SELECT
		sseg <=
			"10000001000000" WHEN "0000", --0
			"10000001111001" WHEN "0001", --1
			"10000000100100" WHEN "0010", --2
			"10000000110000" WHEN "0011", --3
			"10000000011001" WHEN "0100", --4
			"10000000010010" WHEN "0101", --5
			"10000000000010" WHEN "0110", --6
			"10000001111000" WHEN "0111", --7
			"10000000000000" WHEN "1000", --8
			"10000000010000" WHEN "1001", --9
		   "11110011000000" WHEN "1010", --10	
		   "11110011111001" WHEN "1011", --11	
			"10000000000110" WHEN OTHERS; --ERROR
END behaviour;