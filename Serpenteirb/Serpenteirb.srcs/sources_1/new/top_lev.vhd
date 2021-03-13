library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_lev is
Port ( clk       : in  std_logic;
       reset     : in  std_logic;
       btn_u     : in  std_logic;
       btn_c     : in  std_logic;
       btn_d     : in  std_logic;
       btn_l     : in  std_logic;
       btn_r     : in  std_logic;
       CE_3k     : in  std_logic;
       CE_1H     : in  std_logic;
       CE_25M    : in  std_logic;
       pos_x_out : out std_logic_vector(7 downto 0);
       pos_y_out : out std_logic_vector(7 downto 0);
       val_btn   : out std_logic_vector(2 downto 0);
       AN        : out std_logic_vector(7 downto 0);
       Sevenseg  : out std_logic_vector(7 downto 0) );
end top_lev;

architecture Behavioral of top_lev is

signal val_aff_g, val_aff_d : std_logic_vector(7 downto 0) := "00001000"; 
signal s_direction : std_logic_vector(2 downto 0);
signal s_dead : std_logic;

begin
  
  val_btn   <= s_direction;
  pos_x_out <= val_aff_g;
  pos_y_out <= val_aff_d;
                    
  SEVEN_SEG : entity work.seven_seg                         
  port map ( clk       => clk,
             rst       => reset,
             CE_25M    => CE_25M,
             CE_3k     => CE_3k,
             dead      => s_dead,
             val_aff_g => val_aff_g,
             val_aff_d => val_aff_d,
             an        => AN,
             seg       => Sevenseg );
                 
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
