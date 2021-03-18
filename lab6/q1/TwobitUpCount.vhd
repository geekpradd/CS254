library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TwobitUpCount is
port ( clk, rst : in std_logic;
count: out std_logic_vector (1 downto 0));

end entity;

architecture ARCHCount of TwobitUpCount is
	component DFlipFlop is
		port (clk, rst, d: in std_logic; q: out std_logic);
	end component;

	component StateTransit is
		port ( prev_state : in std_logic_vector(2 downto 0);
		next_state: out std_logic_vector (2 downto 0));
	end component;
	
	signal reset : std_logic := '0'; -- store the current state	
	signal current_state : std_logic_vector(2 downto 0) := "000"; -- store the current state
	signal next_state : std_logic_vector(2 downto 0) := "001"; -- store the next state

begin
	StateChip: StateTransit
		port map(prev_state => current_state,next_state => next_state);  -- getting the next state using the state transition function
	
	-- using 3 flip flops to store the three state bits 
	FlipFlop0: DFlipFlop
		port map(clk => clk, rst => rst, d => next_state(0), q => current_state(0)); 

	FlipFlop1: DFlipFlop
		port map(clk => clk, rst => rst, d => next_state(1), q => current_state(1)); 

	FlipFlop2: DFlipFlop
		port map(clk => clk, rst => rst, d => next_state(2), q => current_state(2)); 
		
	-- get the output. Note the output function. The output bits are just the last 2 bits of the state
	count(0) <= current_state(0);
	count(1) <= current_state(1);
end;
