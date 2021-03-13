library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_XY2ADDR is
end;

architecture bench of tb_XY2ADDR is

  component XY2ADDR
      port ( X    : in std_logic_vector(15 downto 0);
             Y    : in std_logic_vector(15 downto 0);
             Addr_H_min : out  std_logic_vector(63 downto 0);
             Addr_B_min : out  std_logic_vector(63 downto 0);
             Addr_H_max : out  std_logic_vector(63 downto 0);
             Addr_B_max : out  std_logic_vector(63 downto 0) );
  end component;

  signal X: std_logic_vector(15 downto 0);
  signal Y: std_logic_vector(15 downto 0);
  signal Addr_H_min: std_logic_vector(63 downto 0);
  signal Addr_B_min: std_logic_vector(63 downto 0);
  signal Addr_H_max: std_logic_vector(63 downto 0);
  signal Addr_B_max: std_logic_vector(63 downto 0) ;

begin

  uut: XY2ADDR port map ( X          => X,
                          Y          => Y,
                          Addr_H_min => Addr_H_min,
                          Addr_B_min => Addr_B_min,
                          Addr_H_max => Addr_H_max,
                          Addr_B_max => Addr_B_max );

  stimulus: process
  begin
  
   X <= X"0000";
   Y <= X"0000";
   wait for 100ns;
   X <= X"0000";
   Y <= X"0001";
   wait for 100ns;
   X <= X"0001";
   Y <= X"0000";
   wait for 100ns;
   X <= X"0001";
   Y <= X"0001";
   wait for 100ns;
   X <= X"000D";
   Y <= X"0008";
   wait for 100ns;
   X <= X"0015";
   Y <= X"0005";
   wait for 100ns;

    wait;
  end process;


end;