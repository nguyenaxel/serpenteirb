library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cpt_an is
Port ( clk   : in  STD_LOGIC;
       CE_3k : in  STD_LOGIC;
       rst   : in  STD_LOGIC;
       an    : out STD_LOGIC_VECTOR(7 downto 0) );
end cpt_an;

architecture Behavioral of cpt_an is

signal cpt_an :  STD_LOGIC_VECTOR(7 downto 0); 

begin
     process(clk,rst)
        begin    
            if rst = '0' then
                cpt_an <= "11111110";
            elsif clk'event and clk = '1' then
                if CE_3k = '1' then
                    if cpt_an = "01111111" then
                        cpt_an <= "11111110";
                     else
                        cpt_an(7 downto 1) <= cpt_an(6 downto 0);
                        cpt_an(0) <= '1';
                    end if;
                end if;
            end if;
    end process; 
    
    an <= cpt_an;  

end Behavioral;
