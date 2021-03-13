library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_Clock is
Port ( clk      : in  std_logic;
       reset    : in  std_logic;
       CE_3k    : out std_logic;
       CE_1H    : out std_logic;
       CE_25M   : out std_logic );
end Top_Clock;

architecture Behavioral of Top_Clock is

begin

  CLOCK : entity work.gestion_clk       -- Diviseur de clock 
  port map ( clk    => clk,
             rst    => reset,
             CE_3k  => CE_3k,
             CE_1H  => CE_1H,
             CE_25M => CE_25M );


end Behavioral;
