library IEEE;
use IEEE.std_logic_1164.all;

entity mul3Detector is
  port (i_clk : in std_logic ;
        i_reset_n : in std_logic ;
        i_serial : in std_logic ;
        o_mul3 : out std_logic
  );
end mul3Detector ;

architecture behavioral of mul3Detector is
  type myState is (A, B, C);
  signal y: myState;
begin
  process (i_reset_n, i_clk)
  begin
    if i_reset_n = '0' then 
      y <= A;
    elsif rising_edge(i_clk) then
      case y is
        when A =>
          if i_serial = '0' then y <= A;
          else y <= B;
          end if;
        when B =>
          if i_serial = '0' then y <= C;
          else y <= A;
          end if;
        when C =>
          if i_serial = '0' then y <= B;
          else y <= C;
          end if;
      end case;
    end if;
  end process;
  o_mul3 <= '1' when y = A else '0';
end behavioral;