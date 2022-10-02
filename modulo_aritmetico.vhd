library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity SumArit_Nbits is
    generic(n : integer := 4);
    port(
        a, b: in signed(n-1 downto 0);
        op: in std_logic;
        r: out signed(n-1 downto 0);
        zcvn: out std_logic_vector(3 downto 0)
    );
    end SumArit_Nbits;

architecture behavioral of SumArit_Nbits is
    constant zero : signed(n-1 downto 0) := (others => '0');
    signal comp : signed(n-1 downto 0);
    signal carry : unsigned(n downto 0);
    
    
    begin
      r <= (a+b) when op = '0' else
        (a-b) when op = '1';
        
      carry <= unsigned('0' & a) + unsigned('0' & b); -- se suman las entradas en una señal de N bits, si el bit mas significativo es uno, hubo carry.
      
      
      
      comp <= zero xnor r; --si el numero son sólo ceros, comp vale 1.
      
      with comp(0) select
      zcvn(3) <= '1' when '1', -- si comp vale uno, la flag se levanta
      			'0' when others;
      
      zcvn(2) <= '1' when carry(n) = '1' else -- si el bit mas significativo es 1, hubo carry, se levanta la flag.
      			'0' when carry(n) = '0';
                
      zcvn(1) <= (a(n-1) and b(n-1) and (not(r(n-1)))) or ((not(a(n-1))) and (not(b(n-1))) and r(n-1)); -- cuando alguna operacion de 1, se levanta la flag de overflow.
                
      zcvn(0) <= '1' when r(n-1) = '1'  else -- si el bit más significativo del resultado es 1, el numero es negativo.
      			'0' when r(n-1) = '0';
      
    end behavioral;
