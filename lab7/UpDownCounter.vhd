library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UpDownCounter is
port ( clk, rst : in std_logic; up: in std_logic;
count: out std_logic_vector (6 downto 0));

end entity;

architecture ARCHCount of UpDownCounter is
	component DFlipFlop is
		port (clk, rst, d: in std_logic; q: out std_logic);
	end component;

	component UpDownStateTransit is
		port ( prev_state : in std_logic_vector(6 downto 0); up: in std_logic;
		next_state: out std_logic_vector (6 downto 0));
	end component;
	
	signal reset : std_logic := '0'; -- store the current state	
	signal current_state : std_logic_vector(6 downto 0) := "0000000"; -- store the current state
	signal next_state : std_logic_vector(6 downto 0) := "0000001"; -- store the next state

begin
	StateChip: UpDownStateTransit
		port map(prev_state => current_state,up => up, next_state => next_state);  -- getting the next state using the state transition function
	
	-- using 3 flip flops to store the three state bits 
	FlipFlop0: DFlipFlop
		port map(clk => clk, rst => rst, d => next_state(0), q => current_state(0)); 

	FlipFlop1: DFlipFlop
		port map(clk => clk, rst => rst, d => next_state(1), q => current_state(1)); 

	FlipFlop2: DFlipFlop
		port map(clk => clk, rst => rst, d => next_state(2), q => current_state(2)); 
		
	FlipFlop3: DFlipFlop
		port map(clk => clk, rst => rst, d => next_state(3), q => current_state(3)); 	
		
	FlipFlop4: DFlipFlop
		port map(clk => clk, rst => rst, d => next_state(4), q => current_state(4)); 
		
	FlipFlop5: DFlipFlop
		port map(clk => clk, rst => rst, d => next_state(5), q => current_state(5)); 	
		
	FlipFlop6: DFlipFlop
		port map(clk => clk, rst => rst, d => next_state(6), q => current_state(6)); 	
		
	-- get the output. Note the output function. The output bits are just the last 2 bits of the state
	count(0) <= current_state(0);
	count(1) <= current_state(1);
	count(2) <= current_state(2);
	count(3) <= current_state(3);
	count(4) <= current_state(4);
	count(5) <= current_state(5);
	count(6) <= current_state(6);
end;
