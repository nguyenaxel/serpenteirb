library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity CE_25MHz is
Port ( clk    : in  STD_LOGIC;
       rst    : in  STD_LOGIC;
       CE_25M : out STD_LOGIC );
end CE_25MHz;

architecture Behavioral of CE_25MHz is

signal cpteur_25MHz :  UNSIGNED(3 downto 0); 

begin
 process(clk,rst)
        begin    
        if rst = '0' then
            cpteur_25MHz <= "0000";
        elsif clk'event and clk = '1' then
            if cpteur_25MHz = 3 then
                cpteur_25MHz <= (OTHERS => '0');
                CE_25M <= '1';
            else
                cpteur_25MHz <= cpteur_25MHz + 1;
                CE_25M <= '0';
            end if;
         end if;                
    end process;        

end Behavioral;

