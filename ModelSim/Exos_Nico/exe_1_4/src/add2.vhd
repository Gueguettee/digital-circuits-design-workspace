library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add2 is
	port (
		a_i : in std_logic_vector(2 downto 0);
		b_i : in std_logic_vector(2 downto 0);
		res_o : out std_logic_vector(2 downto 0)
	);
end entity add2;


architecture rtl of add2 is
	signal temp_s : signed(2 downto 0);
	begin
	
	temp_s <= signed(a_i) + signed(b_i);
	res_o <= std_logic_vector(temp_s);

end architecture rtl;