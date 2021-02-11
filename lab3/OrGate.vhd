 library ieee; 
use ieee.std_logic_1164.all;

--Entity to compute OR of inputs. O = X OR Y. used to create 2x1 MUX
entity OrGate is
	port(X, Y: in std_logic; O: out std_logic);
end entity OrGate;

architecture Struct of OrGate is 
begin
	O <= (X or Y);
end Struct;