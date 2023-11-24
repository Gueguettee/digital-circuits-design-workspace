library ieee;

use ieee.std_logic_1164.all;
use work.my_pkg.all;

entity data_flow is
    port(
        en_i: std_logic,
        rst_i: std_logic,
        clk_i: std_logic,
        shift_o: std_logic,
        enSIPO_o: std_logic,
        enPISO_o: std_logic
    );
end entity;

architecture mix of data_flow is

    variable nClk_v : integer := 0;

    begin
        enSIPO_o <= en_i;
        enPISO_o <= en_i;

        process(rst_i, clk_i)
            begin
                if (rst_i = '1') then
                    nClk_v <= 0;
                    
                elsif(nClk_v >= DATA_BUS_WIDTH_c) then
                    shift_o <= 1;
                    nClk_v <= 0;
                else
                    shift_o <= 0;
                    nClk_v <= nClk_v + 1;
                end if;
        end process;

end architecture;
