library ieee;
use ieee.std_logic_1164.all;
use work.my_pkg.all;


entity PISO_shift_reg is 
	port
	(
		clk_i : in std_logic;
		rst_i : in std_logic;
		shift_i : in std_logic;
		data_i : in std_logic_vector(DATA_BUS_WIDTH_c-1 downto 0);
		data_o : out std_logic
	);
end entity;

architecture mix of PISO_shift_reg is 

	component DFF is
		port (
			D_i : in std_logic;
			rst_i : in std_logic;
			clk_i : in std_logic;
			Q_o : out std_logic;
			Qn_o : out std_logic
		);
	end component DFF;

	# TO DO à partir de là

	signal PISO_data_s : std_logic_vector(DATA_BUS_WIDTH_c downto 0);

	begin 

		PISO_data_s(0) <= data_i;
		data_o <= PISO_data_s(DATA_BUS_WIDTH_c downto 1);

		SIPO: for i in DATA_BUS_WIDTH_c downto 1 generate
			begin
			SIPO_reg: DFF port map(
				Q_o => PISO_data_s(i),
				clk_i => clk_i,
				rst_i => rst_i,
				D_i => PISO_data_s(i-1)
			);
		end generate;

end architecture;