library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_14_14 is
  Port ( clk     : in STD_LOGIC;
         reset     : in STD_LOGIC;
         --Ce      : in STD_LOGIC;
         val_in  : in STD_LOGIC_VECTOR(13 downto 0);
         --load    : in STD_LOGIC;
         val_out : out STD_LOGIC_VECTOR(13 downto 0) );
end Reg_14_14;

architecture Behavioral of Reg_14_14 is

begin

    process(clk, reset)
        begin
            if(reset = '0') then
                val_out <= (others => '0');
            elsif(clk'event and clk = '1') then
                --if(Ce = '1') then
                    --if(load = '1') then
                 val_out <= val_in;
             end if;
    end process;

end Behavioral;
