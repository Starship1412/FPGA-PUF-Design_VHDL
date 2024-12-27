library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;
----------------------------
entity ROF1 is
	port (
		en : in STD_LOGIC;
		osc : out STD_LOGIC := '1');
end ROF1;

architecture Behavioral of ROF1 is
	signal S : std_logic_vector (110 downto 0); ------------------------(x+1 downto 0)
	signal O_sig : std_logic;
	attribute KEEP : string;
	attribute KEEP of S : signal is "true";
	attribute KEEP of O_sig : signal is "true";
	-------------------------------------------
begin
	O_sig <= en nand S(110); ------------------------------------------- s(x+1)
	----------------------------------
	gate_not1 : LUT1
		generic map (
			INIT => "01" -- Logic function
		)
		port map (
			O => S(0), -- 1-bit output: LUT
			I0 => O_sig -- 1-bit input: LUT
		);
	----------------------------------
	chain : for i in 1 to 109 generate----------------------------number of buffer is x
		Inverter : LUT1
			generic map (
				INIT => "01" -- Logic function
			)
			port map (
				O => S(i), -- 1-bit output: LUT
				I0 => S(i-1) -- 1-bit input: LUT
			);
	end generate chain;
	----------------------------------
	buffer1 : LUT1
		generic map (
			INIT => "10" -- Logic function
		)
		port map (
			O => S(110), -- 1-bit output: LUT-----------------------------------s(x+1)
			I0 => S(109) -- 1-bit input: LUT--------------------------------------s(x)
		);
	----------------------------------
	gate_not_last : LUT1
		generic map (
			INIT => "01" -- Logic function
		)
		port map (
			O => osc, -- 1-bit output: LUT
			I0 => S(109) -- 1-bit input: LUT-------------------------------------- s(x)
		);
	----------------------------------
end Behavioral;