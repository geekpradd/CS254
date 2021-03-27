library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity StateTransit is
port ( prev_state : in std_logic_vector(3 downto 0);
next_state: out std_logic_vector (3 downto 0));
end entity;

architecture ARCHState of StateTransit is
begin
	next_state <= std_logic_vector(unsigned(prev_state)+1);
	
end;
