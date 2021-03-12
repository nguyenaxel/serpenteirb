library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity CE_3kHz is
Port ( clk   : in  STD_LOGIC;
       rst   : in  STD_LOGIC;
       CE_3k : out STD_LOGIC );
end CE_3kHz;

architecture Behavioral of CE_3kHz is

signal cpteur_3kHz :  UNSIGNED(16 downto 0); 

begin
    process(clk,rst)
        begin    
        if rst = '0' then
            cpteur_3kHz <= (OTHERS => '0');
        elsif clk'event and clk = '1' then
            if cpteur_3kHz = 33334 then
                cpteur_3kHz <= (OTHERS => '0');
                CE_3k <= '1';
            else
                cpteur_3kHz <= cpteur_3kHz + 1;
                CE_3k <= '0';
            end if;
         end if;                
    end process;
            
end Behavioral;