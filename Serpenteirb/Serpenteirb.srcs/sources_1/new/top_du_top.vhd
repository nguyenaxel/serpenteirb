library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_du_top is
  port ( clk       : in  std_logic;
         reset     : in  std_logic;
         btn_u     : in  std_logic;
         btn_c     : in  std_logic;
         btn_d     : in  std_logic;
         btn_l     : in  std_logic;
         btn_r     : in  std_logic;
         VGA_hs    : out std_logic;
         VGA_vs    : out std_logic;
         VGA_red   : out std_logic_vector(3 downto 0);  
         VGA_green : out std_logic_vector(3 downto 0);
         VGA_blue  : out std_logic_vector(3 downto 0);
         val_btn   : out std_logic_vector(2 downto 0);
         AN        : out std_logic_vector(7 downto 0);
         Sevenseg  : out std_logic_vector(7 downto 0) );
end top_du_top;

architecture Behavioral of top_du_top is

begin

  VGA : entity work.Top_test_vga
  port map ( clk       => clk,
             reset     => reset,
             VGA_vs    => VGA_vs,
             VGA_hs    => VGA_hs,
             VGA_red   => VGA_red,
             VGA_green => VGA_green,
             VGA_blue  => VGA_blue );
             
  BTN : entity work.top_lev
  port map ( clk    => clk,
             reset  => reset,
             btn_u  => btn_u,
             btn_c  => btn_c,
             btn_d => btn_d,
             btn_l  => btn_l,
             btn_r  => btn_r,
             val_btn => val_btn,
             AN  => AN,
             Sevenseg  => Sevenseg );   

end Behavioral;
