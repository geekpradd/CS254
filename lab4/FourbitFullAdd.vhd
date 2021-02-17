library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

entity FourbitFullAdd is
	port ( a, b : in std_logic_vector (3 downto 0);
	cin: in std_logic;
	sum : out std_logic_vector (3 downto 0);
	carry: out std_logic);
end entity;

architecture ARCH of FourbitFullAdd is 
	component OnebitFullAdd is
		port ( a, b, cin : in std_logic;
		sum, carry: out std_logic);
	end component;
	
	signal m, n, o: std_logic;
begin 
	Chip1: OnebitFullAdd
	port map(a=>a(0), b=>b(0), cin=>cin, sum=>sum(0), carry=>m);
	
	Chip2: OnebitFullAdd
	port map(a=>a(1), b=>b(1), cin=>m, sum=>sum(1), carry=>n);
	
	Chip3: OnebitFullAdd
	port map(a=>a(2), b=>b(2), cin=>n, sum=>sum(2), carry=>o);
	
	Chip4: OnebitFullAdd
	port map(a=>a(3), b=>b(3), cin=>o, sum=>sum(3), carry=>carry);
	


end;