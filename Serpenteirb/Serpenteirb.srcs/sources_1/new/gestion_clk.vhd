library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gestion_clk is
 Port ( clk    : in  STD_LOGIC;
        rst    : in  STD_LOGIC;
        CE_3k  : out STD_LOGIC;
        CE_1H  : out STD_LOGIC;
        CE_25M : out STD_LOGIC );
end gestion_clk;

architecture Behavioral of gestion_clk is

begin
   CLOCK_3Khz : entity work.CE_3kHz  -- Diviseur de clock 3kHz
   port map ( clk   => clk,
              rst   => rst,
              CE_3k => CE_3k );  
                     
   CLOCK_Hz : entity work.CE_1Hz     -- Diviseur de clock 1Hz
   port map ( clk   => clk,
              rst   => rst,
              CE_1H => CE_1H );  
                     
   CLOCK_25M : entity work.CE_25MHz  -- Diviseur de clock 25MHz
    port map ( clk    => clk,
               rst    => rst,
               CE_25M => CE_25M );  

end Behavioral;
