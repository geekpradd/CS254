library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

--Entity to compute AND of inputs. L = NOT K
entity NotGate is
	port(K: in std_logic; L: out std_logic);
end entity NotGate;

architecture Struct of NotGate is 
begin
	L <= (not K);
end Struct;