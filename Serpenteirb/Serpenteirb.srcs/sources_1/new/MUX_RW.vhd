library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_RW is
Port (
        reset_mem       : in  std_logic;
        addr_aff        : in std_logic_vector(13 downto 0);
        addr_rst_mem    : in std_logic_vector(13 downto 0);
        RW_nrml         : in std_logic;
        RW_rst          : in std_logic;
        ADDR            : out std_logic_vector(13 downto 0);
        RW              : out std_logic);         
end MUX_RW;   

architecture Behavioral of MUX_RW is
begin

process(reset_mem)
begin    
    if (reset_mem = '1') then      
        ADDR <= addr_rst_mem;
        RW   <= RW_rst;
    else  
        ADDR <= addr_aff;
        RW <= RW_nrml;
         end if;
end process;    
  
end Behavioral;
