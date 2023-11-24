library ieee;
use ieee.std_logic_1164.all;
use work.my_pkg.all;


entity SIPO_shift_reg is 
	port
	(
		clk_i : in std_logic;
		rst_i : in std_logic;
		shift_i : in std_logic;
		en_i : in std_logic;
		data_i : in std_logic;
		data_o : out std_logic_vector(DATA_BUS_WIDTH_c-1 downto 0)
	);
end entity;

architecture mix of SIPO_shift_reg is 

	component DFF is
		port (
			D_i : in std_logic;
			rst_i : in std_logic;
			clk_i : in std_logic;
			Q_o : out std_logic;
			Qn_o : out std_logic
		);
	end component DFF;

	signal SIPO_data_s : std_logic_vector(DATA_BUS_WIDTH_c downto 0);

	begin 
		process (rst_i, clk_i)
			if rst_i = '1' then
				SIPO_data_s <= (others => '0');

			elsif rising_edge(clk_i) then
				SIPO_data_s(0) <= data_i;
				SIPO: for i in DATA_BUS_WIDTH_c downto 1 generate
					begin
						SIPO_reg: DFF port map(
							D_i => SIPO_data_s(i-1),
							rst_i => rst_i,
							clk_i => (clk_i and en_i),
							Q_o => SIPO_data_s(i)
						);
						memory_reg: DFF port map(
							D_i => SIPO_data_s(i),
							rst_i => rst_i,
							clk_i => (shift_i and en_i),
							Q_o => data_o(i-1)
						);
				end generate;
			end if;
		end process;
end architecture;