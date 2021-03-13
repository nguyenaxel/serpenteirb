library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Addr2XY is
    port ( Addr : in  std_logic_vector(15 downto 0);
           X    : out std_logic_vector(15 downto 0);
           Y    : out std_logic_vector(15 downto 0);
           IsIn : out std_logic );
end Addr2XY;

architecture Behavioral of Addr2XY is

signal s_Addr : unsigned(15 downto 0);

begin

    s_Addr <= unsigned(Addr);
    
    process(s_Addr)
    begin
        if(((s_Addr > 1288) and (s_Addr < 13902)) and (((s_Addr mod 160) > 8) and ((s_Addr mod 160) < 154))) then
            IsIn <= '1';
            X <= std_logic_vector(((s_Addr mod 160) - 9) / 5);
            Y <= std_logic_vector(((s_Addr  /  160) - 8) / 5);
        else
            IsIn <= '0';
            X <= "0000000000000000";
            Y <= "0000000000000000";
        end if;
    end process;

end Behavioral;
