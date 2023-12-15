library ieee;

use ieee.std_logic_1164.all;
use work.my_pkg.all;

entity data_flow is
    port(
        en_i: in std_logic;
        rst_i: in std_logic;
        clk_i: in std_logic;
        shift_o: out std_logic;
        enSIPO_o: out std_logic;
        enPISO_o: out std_logic
    );
end entity;

architecture mix of data_flow is

    signal shift_s : std_logic;

    signal nClk_s : integer := 0;

begin
    enSIPO_o <= en_i;
    enPISO_o <= en_i;

    shift_o <= shift_s;

    process(rst_i, clk_i)
    begin
        if (rst_i = '1') then
            shift_s <= '0';
            nClk_s <= 0;
        elsif rising_edge(clk_i) then
            if(nClk_s >= DATA_BUS_WIDTH_c) then
                shift_s <= '1';
                nClk_s <= 0;
            else
                shift_s <= '0';
                nClk_s <= nClk_s + 1;
            end if;
        end if;
    end process;

end architecture;
