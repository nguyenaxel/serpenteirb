library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Afficheur is
generic(bit_per_pixel : integer range 1 to 12:=12;    -- number of bits per pixel
          grayscale     : boolean := false);           -- should data be displayed in grayscale
  port (clk          : in   std_logic;
        reset        : in   std_logic;
        data_in      : in   std_logic_vector(bit_per_pixel - 1 downto 0);
        ADDR         : out  std_logic_vector(13 downto 0);
        data_out     : out  std_logic_vector(bit_per_pixel - 1 downto 0);
        data_write   : out  std_logic );
end Afficheur;

architecture Behavioral of Afficheur is

signal s_ADDR : unsigned(13 downto 0);


begin

    process (clk, reset)
        begin
        if reset = '0' then
            s_ADDR       <= "00000000000000";
        elsif (clk'event and clk = '1') then
            if(s_ADDR < 16000) then           
                s_ADDR       <= s_ADDR + 1; 
            else
                s_ADDR       <= "00000000000000";  
            end if;
        end if;
    end process;
    ADDR <= std_logic_vector(s_ADDR);
    data_out   <= data_in;
    data_write <= '1'; 
    
end Behavioral;
