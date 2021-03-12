library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rst_mem is
    port ( clk              : in  STD_LOGIC;
           --CE               : in STD_LOGIC;
           reset            : in  STD_LOGIC;
           addr_mem         : out STD_LOGIC_VECTOR(13 downto 0);
           reset_mem        : out STD_LOGIC;
           RW_rst           : out STD_LOGIC;
           mem_out          : out STD_LOGIC_VECTOR(11 downto 0) );
end rst_mem;

architecture Behavioral of rst_mem is

signal cpt : unsigned(13 downto 0) := "00000000000000";
signal s_res : std_logic;

begin

    process(clk, reset)
    begin
    
        if (reset = '0') then
            s_res <= '1';
            reset_mem <= '1';    
            RW_rst <= '1';
        elsif (clk'event and clk = '1') then
            if ( s_res = '1') then 
                if(cpt < 16000) then
                    addr_mem <= std_logic_vector(cpt);
    
                    if   ((cpt > 1288 and cpt < 1434) or (cpt > 13448 and cpt < 13594)) then    -- Traits horizontaux noirs contour zone de jeu
                        mem_out <= "000000000000";
                    elsif(((cpt mod 160 = 8) or (cpt mod 160 = 154)) and (cpt >= 1288 and cpt <= 13594)) then -- Traits verticaux noirs contour zone de jeu
                        mem_out <= "000000000000";
                    elsif(cpt >= 1289 and cpt <= 13593 and (cpt mod 160 >= 9 and cpt mod 160 <= 153) and ((cpt mod 10 >= 9) or (cpt mod 10 <= 3)) and (((cpt / 160) mod 10 >= 9) or ((cpt / 160) mod 10 <= 3 ))) then -- Cases lilas claires
                        mem_out <= "110010101111";
                    elsif(cpt >= 1289 and cpt <= 13593 and (cpt mod 160 >= 9 and cpt mod 160 <= 153) and ((cpt mod 10 < 9) and (cpt mod 10 > 3)) and (((cpt / 160) mod 10 < 9) and ((cpt / 160) mod 10 > 3 ))) then -- Cases lilas claires
                        mem_out <= "110010101111";
                    else
                        mem_out <= "101010001111";
                    end if;
                    
                    if    (((cpt >= 7104 and cpt <= 7755) and (cpt mod 160 > 63 and cpt mod 160 < 74))) then -- Cases vertes serpent
                        mem_out <= "101011111011";
                    elsif (((cpt >= 5554 and cpt <= 6353) and (cpt mod 160 > 113 and cpt mod 160 < 119))) then    -- Case rouge pomme
                        mem_out <= "101101000010";
                    end if;
                    
                    cpt <= cpt + 1;
                else
                    cpt <= "00000000000000";
                    RW_rst <= '0';
                    s_res <= '0'; 
                end if;
            end if;
    end if;
    end process;


end Behavioral;
