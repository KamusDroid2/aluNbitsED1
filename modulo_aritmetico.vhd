
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity SumArit_Nbits is
    generic(n : integer := 2);
    port(
        a, b: in signed(n-1 downto 0);
        op: in std_logic;
        r: out signed(n-1 downto 0);
        zcvn: out std_logic_vector(3 downto 0)
    );
    end SumArit_Nbits;

architecture Behavioral of SumArit_Nbits is
    begin
      r <= (a+b) when op = '0' else
        (a-b) when op = '1';
      
    end Behavioral
