library IEEE;
use IEEE.std_logic_1164.all;

entity D_FF is
  port (i_clk, i_reset_n, i_D : in std_logic;
        o_y, o_y_n : out std_logic);
end D_FF;

architecture beh of D_FF is
begin
  process (i_clk, i_reset_n, i_D)
    variable state : std_logic := '0';
  begin
    if i_reset_n = '0' then
      state := '0';
    elsif rising_edge(i_clk) then
      state := i_D;
    end if;
    o_y <= state;
    o_y_n <= not(state);
  end process;
end beh;

library IEEE;
use IEEE.std_logic_1164.all;

entity mul3Detector is
  port (i_clk : in std_logic ;
        i_reset_n : in std_logic ;
        i_serial : in std_logic ;
        o_mul3 : out std_logic
  );
end mul3Detector ;

architecture structural of mul3Detector is
    signal y1, y2, y1_n, y2_n, y1_i, y2_i: std_logic;
    
    component D_FF
    port (i_clk, i_reset_n, i_D : in std_logic;
        o_y, o_y_n : out std_logic);
    end component;
    
begin
    DFF1: D_FF port map (i_clk, i_reset_n, y1_i, y1, y1_n);
    DFF2: D_FF port map (i_clk, i_reset_n, y2_i, y2, y2_n);
    
    y1_i <= ((not(i_serial)) and y2) or (i_serial and (not(y2)) and (not(y1)));
    y2_i <= ((not(i_serial)) and y1) or (i_serial and y2);
    o_mul3 <= (y1_n) and (y2_n);
    
end structural;
