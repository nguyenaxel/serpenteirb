library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mouvement is
  port ( clk       : in  std_logic;
         CE_1H     : in  std_logic;
         rst       : in  std_logic;
         direction : in  std_logic_vector(2 downto 0);
         pos_x_in  : in  std_logic_vector(7 downto 0);
         pos_y_in  : in  std_logic_vector(7 downto 0);
         pos_x_out : out std_logic_vector(7 downto 0);
         pos_y_out : out std_logic_vector(7 downto 0);
         dead      : out std_logic );
end mouvement;

architecture Behavioral of mouvement is

signal s_dead : std_logic := '0';
signal s_pos_x_out, s_pos_y_out  : std_logic_vector(7 downto 0) := "00001000";

begin

    dead <= s_dead;
    pos_x_out <= s_pos_x_out;
    pos_y_out <= s_pos_y_out;

    process(clk,rst)
        begin
            if(rst = '0') then
                s_pos_x_out <= "00001000";
                s_pos_y_out <= "00001000";
                s_dead      <= '0';
            elsif(clk'event and clk = '1') then
                if(CE_1H = '1') then
                    if(s_dead = '0') then
                        if   (direction = "000") then
                            s_pos_x_out <= pos_x_in;
                            s_pos_y_out <= pos_y_in;
                        elsif(direction = "001") then
                            s_pos_y_out <= std_logic_vector(unsigned(pos_y_in) - 1);
                        elsif(direction = "010") then
                            s_pos_y_out <= std_logic_vector(unsigned(pos_y_in) + 1);
                        elsif(direction = "011") then
                            s_pos_x_out <= std_logic_vector(unsigned(pos_x_in) - 1);
                        elsif(direction = "100") then
                            s_pos_x_out <= std_logic_vector(unsigned(pos_x_in) + 1);
                        end if;
                    end if;
                    if(s_pos_x_out = "00000000" or s_pos_x_out = "00011000" or s_pos_y_out = "00000000" or s_pos_y_out = "00010000") then
                        s_dead <= '1';
                    end if;
                end if;
            end if;
    end process;

end Behavioral;
