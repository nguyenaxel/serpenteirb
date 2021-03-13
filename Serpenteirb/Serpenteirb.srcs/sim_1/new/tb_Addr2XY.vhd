library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_Addr2XY is
end;

architecture bench of tb_Addr2XY is

  component Addr2XY
      port ( Addr : in  std_logic_vector(15 downto 0);
             X    : out std_logic_vector(15 downto 0);
             Y    : out std_logic_vector(15 downto 0);
             IsIn : out std_logic );
  end component;

  signal Addr: std_logic_vector(15 downto 0);
  signal X: std_logic_vector(15 downto 0);
  signal Y: std_logic_vector(15 downto 0);
  signal IsIn: std_logic ;

begin

  uut: Addr2XY port map ( Addr => Addr,
                          X    => X,
                          Y    => Y,
                          IsIn => IsIn );

  stimulus: process
  begin
  
  Addr <= X"0509";
  wait for 10 us;
  Addr <= X"0599";
  wait for 10 us;
  Addr <= X"3529";
  wait for 10 us;
  Addr <= X"35B9";
  wait for 10 us;
  Addr <= X"050E";
  wait for 10 us;
  Addr <= X"0829";
  wait for 10 us;

    wait;
  end process;


end;