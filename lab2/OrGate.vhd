 library ieee; 
use ieee.std_logic_1164.all;
entity OrGate is
	port(X, Y: in std_logic; O: out std_logic);
end entity OrGate;

architecture Struct of OrGate is 
begin
	O <= (X or Y);
end Struct;