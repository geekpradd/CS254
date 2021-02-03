 library ieee; 
use ieee.std_logic_1164.all;
entity AndGate is
	port(P, Q: in std_logic; R: out std_logic);
end entity AndGate;

architecture Struct of AndGate is 
begin
	R <= (P and Q);
end Struct;