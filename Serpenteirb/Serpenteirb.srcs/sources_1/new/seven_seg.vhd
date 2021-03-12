library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_seg is
Port ( clk       : in  STD_LOGIC;
       rst       : in  STD_LOGIC;
       CE_25M    : in  STD_LOGIC;
       CE_3k     : in  STD_LOGIC;
       dead      : in  std_logic;
       val_aff_g : in  STD_LOGIC_VECTOR(7 downto 0);
       val_aff_d : in  STD_LOGIC_VECTOR(7 downto 0);
       an        : out STD_LOGIC_VECTOR(7 downto 0);
       seg       : out STD_LOGIC_VECTOR(7 downto 0) );
end seven_seg ;

architecture Behavioral of seven_seg is

signal an_s    : STD_LOGIC_VECTOR(7 downto 0);
signal val_aff1_g, val_aff2_g, val_aff3_g, val_aff4_g : STD_LOGIC_VECTOR(7 downto 0);
signal val_aff1_d, val_aff2_d, val_aff3_d, val_aff4_d : STD_LOGIC_VECTOR(7 downto 0);
signal val_aff1,   val_aff2,   val_aff3,   val_aff4   : STD_LOGIC_VECTOR(7 downto 0);
signal y : std_logic_vector(7 downto 0);

    begin
    
    an <= an_s;
         
    TRANSCODEUR_G : entity work.trancod                   -- Transforme 1 STD_LOGIC_VECTOR 4bit en 4 STD_LOGIC_VECTOR 4bit pour affichage
    port map ( clk => clk,
               CE_25M   => CE_25M,
               rst      => rst,
               val_aff  => val_aff_g,
               val_aff1 => val_aff1_g,
               val_aff2 => val_aff2_g,
               val_aff3 => val_aff3_g,
               val_aff4 => val_aff4_g );
                    
    TRANSCODEUR_D : entity work.trancod                   -- Transforme 1 STD_LOGIC_VECTOR 4bit en 4 STD_LOGIC_VECTOR 4bit pour affichage
    port map ( clk      => clk,
               CE_25M   => CE_25M,
               rst      => rst,
               val_aff  => val_aff_d,
               val_aff1 => val_aff1_d,
               val_aff2 => val_aff2_d,
               val_aff3 => val_aff3_d,
               val_aff4 => val_aff4_d );
                    
    MUX_SELCTEURDIGIT : entity work.MUX_7seg     -- Multiplexeur selectionnant le chiffre à afficher en fct de l'anode
    port map (  val_aff1_g => val_aff1_g,
                val_aff2_g => val_aff2_g,
                val_aff3_g => val_aff3_g,
                val_aff4_g => val_aff4_g,
                val_aff1_d => val_aff1_d,
                val_aff2_d => val_aff2_d,
                val_aff3_d => val_aff3_d,
                val_aff4_d => val_aff4_d,
                an         => an_s ,
                dead       => dead,
                y          => y );

    CPT_S_AN : entity work.cpt_an                            -- change d'anode en fct d'une clk
    port map (  clk   => clk, 
                CE_3k => CE_3k,
                rst   => rst,
                an    => an_s ); 
                
    SEL : entity work.Sel_num
    port map (  clk    => clk, 
                rst    => rst,
                CE_25M => CE_25M,
                y      => y,
                seg    => seg);

end architecture Behavioral;