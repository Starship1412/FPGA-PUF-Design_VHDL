library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
	port (
		clk         : in  STD_LOGIC;
		enable      : in  STD_LOGIC;
		osc_comein  : in  STD_LOGIC;
		challenge   : in STD_LOGIC_VECTOR(3 downto 0);
		lock        : inout STD_LOGIC;
		count       : inout STD_LOGIC_VECTOR(9 downto 0)
	);
end counter;

architecture Behavioral of counter is
	signal enable_ready : STD_LOGIC := '0';
	signal ready_count  : STD_LOGIC_VECTOR(14 downto 0) := (others => '0');
	signal prev_challenge : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
	process(clk)
	begin

		if rising_edge(clk) then
			if challenge /= prev_challenge then
				lock <= '0';
				enable_ready <= '0';
				ready_count <= (others => '0');
				prev_challenge <= challenge;
			end if;
			if lock = '0' then
				if enable = '1' and enable_ready = '0' then
					enable_ready <= '1';
				end if;
				if enable_ready = '1' and unsigned(ready_count) < 32767 then
					ready_count <= std_logic_vector(unsigned(ready_count) + 1);
				elsif enable_ready = '1' then
					enable_ready <= '0';
					lock <= '1';
				end if;
			end if;
		end if;
	end process;

	process(osc_comein)
	begin
		if rising_edge(osc_comein) then
			if challenge /= prev_challenge then
				count <= (others => '0');
			end if;
			if enable_ready = '1' and unsigned(count) < 100 then
				count <= std_logic_vector(unsigned(count) + 1);
			end if;
		end if;
	end process;
end Behavioral;