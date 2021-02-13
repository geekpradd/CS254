library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

--Entity to compute AND of inputs. O = X AND Y
entity OrGate is
	port(X, Y: in std_logic; O: out std_logic);
end entity OrGate;

architecture Struct of OrGate is 
begin
	O <= (X or Y);
end Struct;