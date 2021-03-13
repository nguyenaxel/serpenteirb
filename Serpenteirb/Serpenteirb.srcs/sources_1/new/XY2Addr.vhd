library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity XY2ADDR is
    port ( clk        : in  STD_LOGIC;
           reset      : in  STD_LOGIC;
           X          : in std_logic_vector(7 downto 0);
           Y          : in std_logic_vector(7 downto 0);
           Addr_H_min : out std_logic_vector(63 downto 0);
           Addr_H_max : out std_logic_vector(63 downto 0);
           Addr_B_min : out std_logic_vector(63 downto 0);
           Addr_B_max : out std_logic_vector(63 downto 0) );
end XY2ADDR;

architecture Behavioral of XY2ADDR is

signal s_X, s_Y : unsigned(7 downto 0);

begin
     s_X <= unsigned(X);
     s_Y <= unsigned(Y);
    
    process(clk, reset)
    begin
        if (clk'event and clk = '1') then
            if((s_X >= 0) and (s_X <= 28) and (s_Y >= 0) and (s_Y <= 15)) then
                Addr_H_min(31 downto 0) <= std_logic_vector(1289 + (s_X*5)+(s_Y*160*5) + 160);
                Addr_H_max(31 downto 0) <= std_logic_vector(1293 + (s_X*5)+(s_Y*160*5) + 160);
                Addr_B_min(31 downto 0) <= std_logic_vector(1289 + (s_X*5)+(s_Y*160*5) + 160*4 + 160);
                Addr_B_max(31 downto 0) <= std_logic_vector(1293 + (s_X*5)+(s_Y*160*5) + 160*4 + 160);
            else
                Addr_H_min <= (others => '0');
                Addr_H_max <= (others => '0');
                Addr_B_min <= (others => '0'); 
                Addr_B_max <= (others => '0');
            end if;
        end if;
    end process;

end Behavioral;
