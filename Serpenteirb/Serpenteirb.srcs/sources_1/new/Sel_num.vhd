library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sel_num is
  port ( clk      : in  std_logic;
         rst      : in  std_logic;
         CE_25M   : in  std_logic;
         y        : in  std_logic_vector(7 downto 0);
         seg  : out std_logic_vector(7 downto 0) );
end Sel_num;

architecture Behavioral of Sel_num is

signal sev_seg : std_logic_vector(7 downto 0);

begin

process(clk, rst) 
        begin 
            if(rst = '0') then
                sev_seg <="11111111";
             
            elsif (clk = '1') then
                if (CE_25M = '1') then
                    case y is
                        when "00000000" => sev_seg <= "11000000";    -- display 0
                        when "00000001" => sev_seg <= "11111001";    -- display 1
                        when "00000010" => sev_seg <= "10100100";    -- display 2
                        when "00000011" => sev_seg <= "10110000";    -- display 3
                        when "00000100" => sev_seg <= "10011001";    -- display 4
                        when "00000101" => sev_seg <= "10010010";    -- display 5
                        when "00000110" => sev_seg <= "10000010";    -- display 6
                        when "00000111" => sev_seg <= "11111000";    -- display 7
                        when "00001000" => sev_seg <= "10000000";    -- display 8
                        when "00001001" => sev_seg <= "10010000";    -- display 9
                        when "00001010" => sev_seg <= "10001000";    -- display A
                        when "00001011" => sev_seg <= "10000011";    -- display B
                        when "00001100" => sev_seg <= "10110001";    -- display C
                        when "00001101" => sev_seg <= "10100001";    -- display D
                        when "00001110" => sev_seg <= "10000110";    -- display E
                        when "00001111" => sev_seg <= "10001110";    -- display F
                        when "00010000" => sev_seg <= "10000010";    -- display G
                        when "00010001" => sev_seg <= "10001001";    -- display H
                        when "00010010" => sev_seg <= "10000110";    -- display I
                        when "00010011" => sev_seg <= "10001110";    -- display J
                        when "00010100" => sev_seg <= "10001001";    -- display K
                        when "00010101" => sev_seg <= "10000111";    -- display L
                        when "00010110" => sev_seg <= "11001000";    -- display M
                        when "00010111" => sev_seg <= "10001011";    -- display N
                        when "00011000" => sev_seg <= "11000000";    -- display O
                        when "00011001" => sev_seg <= "10001100";    -- display P
                        when "00011010" => sev_seg <= "01000000";    -- display Q
                        when "00011011" => sev_seg <= "10001000";    -- display R
                        when "00011100" => sev_seg <= "10010010";    -- display S
                        when "00011101" => sev_seg <= "10000111";    -- display T
                        when "00011110" => sev_seg <= "11000001";    -- display U
                        when "00011111" => sev_seg <= "11000001";    -- display V
                        when "00100000" => sev_seg <= "11000001";    -- display W
                        when "00100001" => sev_seg <= "10001001";    -- display X
                        when "00100010" => sev_seg <= "10011001";    -- display Y
                        when "00100011" => sev_seg <= "10100100";    -- display Z
                        
                        when others => sev_seg <= "11111111";    -- display nothing    
                    end case;
                end if;
            end if;
    seg <= sev_seg;
    end process;


end Behavioral;
