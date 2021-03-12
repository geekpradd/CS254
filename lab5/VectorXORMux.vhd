library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- XORing element of a vector with another number using MUX
entity VectorXORMux2 is
	port( i: in std_logic_vector(7 downto 0);
	num: in std_logic;
	z: out std_logic_vector(7 downto 0)
	);
end entity;

architecture ARCHXOR2 of VectorXORMux2 is
	component  XORMux is
		port( i1: in std_logic;
		i0: in std_logic;
		z: out std_logic
		);
	end component;
begin
	chip0: XORMux
		port map(i(0),num,z(0));
	chip1: XORMux
		port map(i(1),num,z(1));
	chip2: XORMux
		port map(i(2),num,z(2));
	chip3: XORMux
		port map(i(3),num,z(3));
	chip4: XORMux
		port map(i(4),num,z(4));
	chip5: XORMux
		port map(i(5),num,z(5));
	chip6: XORMux
		port map(i(6),num,z(6));
	chip7: XORMux
		port map(i(7),num,z(7));
end;


library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- XORing two vectors component-wise using MUX
entity VectorXORMux is
	port( i0, i1: in std_logic_vector(7 downto 0);
	z: out std_logic_vector(7 downto 0)
	);
end entity;

architecture ARCHXOR1 of VectorXORMux is
	component  XORMux is
		port( i1: in std_logic;
		i0: in std_logic;
		z: out std_logic
		);
	end component;
begin
	chip0: XORMux
		port map(i0(0),i1(0),z(0));
	chip1: XORMux
		port map(i0(1),i1(1),z(1));
	chip2: XORMux
		port map(i0(2),i1(2),z(2));
	chip3: XORMux
		port map(i0(3),i1(3),z(3));
	chip4: XORMux
		port map(i0(4),i1(4),z(4));
	chip5: XORMux
		port map(i0(5),i1(5),z(5));
	chip6: XORMux
		port map(i0(6),i1(6),z(6));
	chip7: XORMux
		port map(i0(7),i1(7),z(7));
end;
