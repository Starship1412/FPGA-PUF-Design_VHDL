library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
	port (
		clk           : in STD_LOGIC;
		enable        : in STD_LOGIC;
		reset         : in STD_LOGIC;
		osc_comein    : in STD_LOGIC;
		challenge     : in STD_LOGIC_VECTOR(3 downto 0);
		count         : inout unsigned(7 downto 0);
		current_state : inout STD_LOGIC_VECTOR(1 downto 0)
	);
end counter;

architecture Behavioral of counter is
	constant IDLE : std_logic_vector(1 downto 0) := "00";
	constant COUNTING : std_logic_vector(1 downto 0) := "01";
	constant DONE : std_logic_vector(1 downto 0) := "10";
	signal next_state : STD_LOGIC_VECTOR(1 downto 0);
	signal prev_challenge : STD_LOGIC_VECTOR(3 downto 0);
	signal next_count : unsigned(7 downto 0) := to_unsigned(0, 8);
	signal ready_count, next_ready_count : unsigned(2 downto 0) := to_unsigned(0, 3);
begin
	process(reset, challenge, clk)
	begin
		if reset = '1' then
			current_state <= IDLE;
			ready_count <= to_unsigned(0, ready_count'length);
		elsif challenge /= prev_challenge then
			prev_challenge <= challenge;
			current_state <= IDLE;
			ready_count <= to_unsigned(0, ready_count'length);
		elsif rising_edge(clk) then
			current_state <= next_state;
			ready_count <= next_ready_count;
		end if;
	end process;
	
	process(reset, challenge, osc_comein)
	begin
		if reset = '1' then
			count <= to_unsigned(0, count'length);
		elsif challenge /= prev_challenge then
			count <= to_unsigned(0, count'length);
		elsif rising_edge(osc_comein) then
			count <= next_count;
		end if;
	end process;
	
	process(current_state, ready_count, enable)
	begin
		case current_state is
			when IDLE =>
				next_ready_count <= to_unsigned(0, next_ready_count'length);
				if reset = '0' then
					if enable = '1' then
						next_state <= COUNTING;
					else
						next_state <= IDLE;
					end if;
				else
					next_state <= IDLE;
				end if;
				
			when COUNTING =>
				if ready_count < 5 then
					next_ready_count <= ready_count + 1;
					next_state <= COUNTING;
				else
					next_ready_count <= ready_count;
					next_state <= DONE;
				end if;
				
			when DONE =>
				next_state <= DONE;
				
			when others => NULL;
		end case;
	end process;
	
	process(current_state, count)
	begin
		case current_state is
			when IDLE =>
				next_count <= to_unsigned(0, next_count'length);
				
			when COUNTING =>
				if count < 255 then
					next_count <= count + 1;
				else
					next_count <= count;
				end if;
				
			when DONE =>
				
			when others => NULL;
		end case;
	end process;
end Behavioral;