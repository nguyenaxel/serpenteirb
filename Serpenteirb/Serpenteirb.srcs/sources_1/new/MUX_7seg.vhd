library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_7seg is
Port ( val_aff1_g : in  STD_LOGIC_VECTOR(7 downto 0);
       val_aff2_g : in  STD_LOGIC_VECTOR(7 downto 0);
       val_aff3_g : in  STD_LOGIC_VECTOR(7 downto 0);
       val_aff4_g : in  STD_LOGIC_VECTOR(7 downto 0);
       val_aff1_d : in  STD_LOGIC_VECTOR(7 downto 0);
       val_aff2_d : in  STD_LOGIC_VECTOR(7 downto 0);
       val_aff3_d : in  STD_LOGIC_VECTOR(7 downto 0);
       val_aff4_d : in  STD_LOGIC_VECTOR(7 downto 0);
       an         : in  STD_LOGIC_VECTOR(7 downto 0);
       dead       : in  std_logic;
       y          : out STD_LOGIC_VECTOR(7 downto 0) ); 
end MUX_7seg;

architecture Behavioral of MUX_7seg is

begin
  process(val_aff1_g, val_aff2_g, val_aff3_g, val_aff4_g, val_aff1_d, val_aff2_d, val_aff3_d, val_aff4_d, an)
    begin
        if(dead = '1') then
            case an is
                 when "11111110" => y <= "00001101";
                 when "11111101" => y <= "00001110";
                 when "11111011" => y <= "00001010";
                 when "11110111" => y <= "00001101";
                 when "11101111" => y <= "00011100";
                 when "11011111" => y <= "00011101";
                 when "10111111" => y <= "00011000";
                 when "01111111" => y <= "00011001";
                 when others     => y <= "11111111";
             end case;
        else
            case an is
                 when "11111110" => y <= val_aff4_g;
                 when "11111101" => y <= val_aff3_g;
                 when "11111011" => y <= val_aff2_g;
                 when "11110111" => y <= val_aff1_g;
                 when "11101111" => y <= val_aff4_d;
                 when "11011111" => y <= val_aff3_d;
                 when "10111111" => y <= val_aff2_d;
                 when "01111111" => y <= val_aff1_d;
                 when others     => y <= "11111111";
             end case;
         end if;
    end process;

end Behavioral;
