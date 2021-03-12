library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity trancod is
Port ( clk      : in  STD_LOGIC;
       rst      : in  STD_LOGIC;
       CE_25M   : in  STD_LOGIC;
       val_aff  : in  STD_LOGIC_VECTOR(7 downto 0);
       val_aff1 : out STD_LOGIC_VECTOR(7 downto 0);
       val_aff2 : out STD_LOGIC_VECTOR(7 downto 0);
       val_aff3 : out STD_LOGIC_VECTOR(7 downto 0);
       val_aff4 : out STD_LOGIC_VECTOR(7 downto 0) );
       
end trancod;

architecture Behavioral of trancod is

begin
    process(clk, rst)
        begin
            if(rst = '0') then
                val_aff1 <= "00000000";
                val_aff2 <= "00000000";
                val_aff3 <= "00000000";
                val_aff4 <= "00000000";
                                               
            elsif(clk = '1') and clk'event then
                 if ( CE_25M = '1') then
			         val_aff1 <= std_logic_vector(unsigned(val_aff)        mod 10);
			         val_aff2 <= std_logic_vector(unsigned(val_aff) /   10 mod 10);
			         val_aff3 <= std_logic_vector(unsigned(val_aff) /  100 mod 10);
			         val_aff4 <= std_logic_vector(unsigned(val_aff) / 1000);
			      end if;
			end if;
      end process;
end Behavioral;
