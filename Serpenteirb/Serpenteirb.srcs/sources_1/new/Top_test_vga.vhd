library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Top_test_vga is
  generic(bit_per_pixel : integer range 1 to 12:=12;    -- number of bits per pixel
          grayscale     : boolean := false);           -- should data be displayed in grayscale
        
  port ( clk        : in  std_logic;
         reset      : in  std_logic;
         VGA_hs     : out std_logic;
         VGA_vs     : out std_logic;
         VGA_red    : out std_logic_vector(3 downto 0);  
         VGA_green  : out std_logic_vector(3 downto 0);
         VGA_blue   : out std_logic_vector(3 downto 0) );
end Top_test_vga;

architecture Behavioral of Top_test_vga is

signal s_ADDR_reg, s_ADDR, s_addr_mem, s_addr_rst_mem, s_addr_aff       : std_logic_vector(13 downto 0);
signal s_data_write : std_logic;
signal s_data_vga_in, s_data_vga_out    : std_logic_vector(bit_per_pixel - 1 downto 0);

signal s_RW, s_RW_rst, s_RW_nrml, s_enable_mem, s_reset_mem       : std_logic;
signal s_mem_in, s_mem_out      : std_logic_vector(11 downto 0);

begin
    
s_enable_mem <= '1';
s_RW_nrml    <= '0';

   MUX : entity work.MUX_RW 
   port map (  reset_mem        => s_reset_mem,      
               addr_aff         => s_addr_aff,  
               addr_rst_mem     => s_addr_rst_mem,
               RW_nrml          => s_RW_nrml,   
               RW_rst           => s_RW_rst,  
               ADDR             => s_ADDR,
               RW               => s_RW );
    
    Reg : entity work.Reg_14_14 
    port map ( clk        => clk,      
               reset      => reset,  
               val_in     => s_ADDR,
               val_out    => s_ADDR_reg);   

     
    VGA : entity work.VGA_bitmap_160x100 
    port map ( clk        => clk,      
               reset      => reset,  
               VGA_hs     => VGA_hs,
               VGA_vs     => VGA_vs,   
               VGA_red    => VGA_red,  
               VGA_green  => VGA_green,
               VGA_blue   => VGA_blue,  
               ADDR       => s_ADDR_reg,
               data_in    => s_data_vga_in,
               data_write => s_data_write,
               data_out   => s_data_vga_out );
     
     AFF : entity work.afficheur 
     port map ( clk        => clk,      
                reset      => reset, 
                data_in    => s_mem_out, 
                ADDR       => s_addr_aff, 
                data_out   => s_data_vga_in,
                data_write => s_data_write );
                
     MEM : entity work.Memory
     port map ( clk        => clk,
                --CE         => s_CE,
                rst        => reset,
                RW         => s_RW,
                enable_mem => s_enable_mem,
                addr_mem   => s_ADDR,
                mem_in     => s_mem_in,
                mem_out    => s_mem_out );
                
     RST : entity work.rst_mem
     port map( clk       => clk,
               reset    => reset,
               addr_mem => s_addr_rst_mem,
               reset_mem => s_reset_mem,
               RW_rst       => s_RW_rst,
               mem_out  => s_mem_in );
                                               
end Behavioral;
