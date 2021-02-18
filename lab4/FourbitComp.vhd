library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

entity FourbitComp is
port ( a, b : in std_logic_vector (1 downto 0);
l, g, e : out std_logic);
end entity;

architecture ARCH_Comp of FourbitComp is 
	component TwoByOneMux is
		port (i0 : in std_logic;
				i1 : in std_logic;
				sel : in std_logic; 
				z : out std_logic);
	end component;
	
	signal z: std_logic_vector (1 downto 0);
	signal x: std_logic_vector(3 downto 0);
	signal buff: std_logic_vector (2 downto 0);
begin 

	And1: TwoByOneMux
	port map(a(1),'0',b(1),x(0));  -- a1 AND ~b1

	And2: TwoByOneMux
	port map(a(0),'0',b(0),x(1)); -- a0 AND ~b0

	And3: TwoByOneMux
	port map(b(1),'0',a(1),x(2));   -- ~a1 AND b1

	And4: TwoByOneMux
	port map(b(0),'0',a(0),x(3));   -- ~a0 AND b0
	
	
	Comb_1: TwoByOneMux
	port map(x(1),'0',x(2),z(0));  -- (a0 AND ~b0) AND ~(~a1 AND b1) = (a0 AND ~b0 AND a1) OR (a0 AND ~b0 AND ~b1)
	
	Comb_2: TwoByOneMux
	port map(x(3),'0',x(0),z(1));  -- (~a0 AND b0) AND ~(a1 AND ~b1) = (~a0 AND b0 AND ~a1) OR (~a0 AND b0 AND b1)

	
	Greater_1: TwoByOneMux
	port map(x(0),'1',z(0),buff(0)); -- x(0) OR z(0). This is final g but we need to give it as input to compute e, so need to store in a different signal
	
	Lesser_1: TwoByOneMux
	port map(x(2),'1',z(1),buff(1)); -- x(3) OR z(1). This is final l but we need to give it as input to compute e, so need to store in a different signal
	
	Not_l: TwoByOneMux
	port map('1','0',buff(1),buff(2));  -- ~l
	
	Equal: TwoByOneMux
	port map(buff(2),'0',buff(0),e); -- e = ~g AND ~l
	
	Greater_2: TwoByOneMux
	port map('0','1',buff(0),g); -- copying buff(0) to g
	
	Lesser_2: TwoByOneMux
	port map('0','1',buff(1),l); --copying buff(1) to l
end;