library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity CE_1Hz is
Port ( clk   : in  STD_LOGIC;
       rst   : in  STD_LOGIC;
       CE_1H : out STD_LOGIC );
end CE_1Hz;

architecture Behavioral of CE_1Hz is

signal cpteur_1Hz :  UNSIGNED(27 downto 0); 

begin
    process(clk,rst)
        begin    
        if rst = '0' then
            cpteur_1Hz <= (OTHERS => '0');
        elsif clk'event and clk = '1' then
            if cpteur_1Hz = 100000000 then
                cpteur_1Hz <= (OTHERS => '0');
                CE_1H <= '1';
            else
                cpteur_1Hz <= cpteur_1Hz + 1;
                CE_1H <= '0';
            end if;
         end if;                
    end process; 

end Behavioral;