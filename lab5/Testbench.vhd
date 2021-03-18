library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is 
end TestBench;

architecture tb of TestBench is
	signal input1:std_logic_vector(7 downto 0);
	signal input2:std_logic_vector(7 downto 0);
	signal cin: std_logic;
	signal carry: std_logic;
	signal output: std_logic_vector(7 downto 0);
	
	component EightbitKogStonAddSub is
		port ( a, b : in std_logic_vector (7 downto 0);
		cin: in std_logic;
		sum: out std_logic_vector (7 downto 0);
		cout: out std_logic);
	end component;
	
	component AdderPreprocess is
		port ( a, b : in std_logic_vector (7 downto 0);
		c,d: out std_logic_vector (7 downto 0)
		);
	end component;
begin 
	dut_instance: EightbitKogStonAddSub
	port map(a => input1, b=>input2, cin => cin, sum =>output, cout=>carry);
	
	process
	begin 
	
	cin <= '0';
	for i in 0 to 255 loop
		input1 <= std_logic_vector(to_unsigned(i, input1'length));
		for j in 0 to 255 loop
			input2 <= std_logic_vector(to_unsigned(j, input2'length));
			if carry =  '0' then
				assert (to_integer(unsigned(input1)))+(to_integer(unsigned(input2)))= to_integer(unsigned(output)) report  integer'image(i) & "  " & integer'image(j) &	"  error  " & integer'image(to_integer(signed(input1))) & " " & integer'image(to_integer(signed(input2))) & " " & integer'image(to_integer(unsigned(output)));
			else
				assert (to_integer(unsigned(input1)))+(to_integer(unsigned(input2)))= 256+to_integer(unsigned(output)) report  integer'image(i) & "  " & integer'image(j) &	"  error  " & integer'image(to_integer(signed(input1))) & " " & integer'image(to_integer(signed(input2))) & " " & integer'image(256+to_integer(unsigned(output)));
			end if;
			wait for 5 ns;
		end loop;
	end loop;
	cin <= '1';
	for i in 0 to 255 loop
		input1 <= std_logic_vector(to_unsigned(i, input1'length));
		for j in 0 to 255 loop
			input2 <= std_logic_vector(to_unsigned(j, input2'length));
			wait for 5 ns;
		if carry =  '1' then
			assert (to_integer(unsigned(input1)))-(to_integer(unsigned(input2)))= to_integer(unsigned(output)) report  integer'image(i) & "  " & integer'image(j) &	"  error  " & integer'image(to_integer(signed(input1))) & " " & integer'image(to_integer(signed(input2))) & " " & integer'image(to_integer(unsigned(output)));
		else
			assert (to_integer(unsigned(input1)))-(to_integer(unsigned(input2)))= -256+to_integer(unsigned(output)) report  integer'image(i) & "  " & integer'image(j) &	"  error  " & integer'image(to_integer(signed(input1))) & " " & integer'image(to_integer(signed(input2))) & " " & integer'image(256+to_integer(unsigned(output)));
		end if;
		end loop;
	end loop;

	end process;
end tb;
	