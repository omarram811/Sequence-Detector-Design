library IEEE;
use IEEE.std_logic_1164.all;

entity mul3DetectorTB is
end mul3DetectorTB;

architecture driver of mul3DetectorTB is
  component mul3Detector
    port (
    i_clk : in std_logic ;
    i_reset_n : in std_logic ;
    i_serial : in std_logic ;
    o_mul3 : out std_logic
  );
  end component;
  
  signal tb_clk: std_logic := '0';
  signal tb_reset_n: std_logic := '0';
  signal tb_serial : std_logic := '0';
  signal tb_o_mul3 : std_logic;
  
begin
  UUT : mul3Detector port map (i_clk=>tb_clk, i_reset_n=>tb_reset_n, i_serial=>tb_serial, o_mul3=>tb_o_mul3);
  
  process
  begin
    for i in 1 to 20 loop
      tb_clk <= '0';
      wait for 10 ns ;
      tb_clk <= '1';
      wait for 10 ns ;
    end loop ;
    wait ;
  end process ; 
  
  tb_reset_n <= '1' after 1 ns, '0' after 100 ns, '1' after 101 ns;
  tb_serial <= '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '1' after 40 ns, '0' after 50 ns,
               '1' after 60 ns, '0' after 70 ns, '1' after 80 ns, '1' after 90 ns, '0' after 100 ns, 
               '1' after 110 ns, '0' after 120 ns, '1' after 130 ns, '1' after 140 ns, '0' after 150 ns, 
               '1' after 160 ns, '0' after 170 ns, '1' after 180 ns, '1' after 190 ns, '0' after 200 ns, 
               '0' after 210 ns, '1' after 220 ns, '1' after 230 ns, '0' after 240 ns, '0' after 250 ns, 
               '1' after 260 ns, '1' after 270 ns, '0' after 280 ns, '0' after 290 ns, '1' after 300 ns, 
               '1' after 310 ns, '0' after 320 ns, '0' after 330 ns, '1' after 340 ns, '1' after 350 ns, 
               '0' after 360 ns, '1' after 370 ns, '0' after 380 ns, '1' after 390 ns, '1' after 400 ns;
  
end driver;