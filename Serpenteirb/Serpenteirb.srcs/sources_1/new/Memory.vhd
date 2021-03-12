library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memory is
    port ( 
           clk              : in STD_LOGIC;
           --CE               : in STD_LOGIC;
           rst              : in STD_LOGIC;
           RW               : in STD_LOGIC;
           enable_mem       : in STD_LOGIC;
           addr_mem         : in STD_LOGIC_VECTOR(13 downto 0);
           mem_in           : in STD_LOGIC_VECTOR(11 downto 0);
           mem_out          : out STD_LOGIC_VECTOR(11 downto 0) ); 
end Memory;

architecture Behavioral of Memory is

TYPE tab_memoire IS ARRAY(0 TO 15999) OF STD_LOGIC_VECTOR(11 downto 0);
signal memoire : tab_memoire ;--:= (others => "101110011100");

begin

    process(clk,rst)
    begin
        if (rst = '0') then
            
        elsif (clk'event and clk = '0') then 
            --if (CE = '1') then
                if  ( enable_mem = '1' ) then
                    if (RW = '1') then
                        memoire(TO_INTEGER(unsigned(addr_mem))) <= mem_in;
                    else
                        mem_out <= memoire(TO_INTEGER(unsigned(addr_mem)));
                    end if;
                end if;  
         end if;
   end process;

end Behavioral;
