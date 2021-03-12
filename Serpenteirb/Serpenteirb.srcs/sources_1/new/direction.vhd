library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity direction is
  port ( clk           : in  std_logic;
         rst           : in  std_logic;
         btn_u         : in  std_logic;
         btn_c         : in  std_logic;
         btn_d         : in  std_logic;
         btn_l         : in  std_logic;
         btn_r         : in  std_logic;
         direction_old : in std_logic_vector(2 downto 0);
         direction     : out std_logic_vector(2 downto 0) );
end direction;

architecture Behavioral of direction is

signal s_direction : std_logic_vector(2 downto 0) := "000";

begin

    process(clk, rst)
        begin
        if(clk'event and clk = '1') then
            if(rst = '0') then
                s_direction <= "000";
            else
                if    (btn_c = '1') then
                    s_direction <= "000";
                elsif (btn_u = '1' and not(direction_old = "010")) then
                    s_direction <= "001";
                elsif (btn_d = '1' and not(direction_old = "001")) then
                    s_direction <= "010";
                elsif (btn_l = '1' and not(direction_old = "100")) then
                    s_direction <= "011";
                elsif (btn_r = '1' and not(direction_old = "011")) then
                    s_direction <= "100";
                else
                    s_direction <= s_direction;
                end if;
            end if;
        end if;
    end process;
    
    direction <= s_direction;

end Behavioral;
