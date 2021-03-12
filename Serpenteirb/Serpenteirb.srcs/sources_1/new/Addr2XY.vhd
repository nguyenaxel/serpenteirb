library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Addr2XY is
    port ( Addr : in  std_logic_vector(15 downto 0);
           X    : out std_logic_vector(7 downto 0);
           Y    : out std_logic_vector(7 downto 0);
           IsIn : out std_logic );
end Addr2XY;

architecture Behavioral of Addr2XY is

signal s_Addr : unsigned(15 downto 0);
signal s_Addr_x : unsigned(7 downto 0);
signal s_Addr_y : unsigned(7 downto 0);


begin

    s_Addr <= unsigned(Addr);
    
    process(s_Addr)
    begin
        if(((s_Addr > 1288) and (s_Addr < 13902)) and (((s_Addr mod 160) > 8) or ((s_Addr mod 160) < 85))) then
            IsIn <= '1';
            s_Addr_x <= s_Addr mod 160;
            s_Addr_y <= s_Addr  /  160;
            X <= std_logic_vector(s_Addr_x);
            Y <= std_logic_vector(s_Addr_y);
        else
            IsIn <= '0';
            X <= "00000001";
            Y <= "00000001";
        end if;
    end process;

end Behavioral;
