library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity UpDownStateTransit is
port ( prev_state : in std_logic_vector(6 downto 0); up: in std_logic;
next_state: out std_logic_vector (6 downto 0));
end entity;

architecture ARCHState of UpDownStateTransit is
begin
	next_state <= "1100000" when prev_state = "1100000" and up='1' else std_logic_vector(unsigned(prev_state)+2) when up = '1' else
		"0000000" when prev_state = "0000000" else
		 std_logic_vector(unsigned(prev_state)-1);
	
	
end;
