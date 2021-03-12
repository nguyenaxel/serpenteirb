library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_lev is
Port ( clk      : in  std_logic;
       reset    : in  std_logic;
       btn_u    : in  std_logic;
       btn_c    : in  std_logic;
       btn_d    : in  std_logic;
       btn_l    : in  std_logic;
       btn_r    : in  std_logic;
       val_btn  : out std_logic_vector(2 downto 0);
       AN       : out std_logic_vector(7 downto 0);
       Sevenseg : out std_logic_vector(7 downto 0) );
end top_lev;

architecture Behavioral of top_lev is

signal val_aff_g, val_aff_d : std_logic_vector(7 downto 0) := "00001000"; 
signal CE_3k   : std_logic;
signal CE_1H   : std_logic;
signal CE_25M  : std_logic;
signal s_direction : std_logic_vector(2 downto 0);
signal s_dead : std_logic;

begin
  
  val_btn <= s_direction;
    
  CLOCK : entity work.gestion_clk       -- Diviseur de clock 
  port map ( clk    => clk,
             rst    => reset,
             CE_3k  => CE_3k,
             CE_1H  => CE_1H,
             CE_25M => CE_25M );
                    
  SEVEN_SEG : entity work.seven_seg                         
  port map ( clk     => clk,
             rst     => reset,
             CE_25M  => CE_25M,
             CE_3k   => CE_3k,
             dead     => s_dead,
             val_aff_g => val_aff_g,
             val_aff_d => val_aff_d,
             an      => AN,
             seg     => Sevenseg );
                 
  BUTT : entity work.direction                         
  port map ( clk           => clk,
             rst           => reset,
             btn_u         => btn_u,
             btn_c         => btn_c,
             btn_d         => btn_d,
             btn_l         => btn_l,
             btn_r         => btn_r,
             direction_old => s_direction,
             direction     => s_direction );   

  MVM : entity work.mouvement                         
  port map ( clk       => clk,
             CE_1H     => CE_1H,
             rst       => reset,
             direction => s_direction,
             pos_x_in  => val_aff_g,
             pos_y_in  => val_aff_d,
             pos_x_out => val_aff_g,
             pos_y_out => val_aff_d,
             dead      => s_dead );                                         

end Behavioral;
