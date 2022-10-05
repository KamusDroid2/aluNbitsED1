library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- Es para usar 'signed' y 'unsigned'.

entity FuncLog_Nbits is
    generic(n : integer := 4);
    port(
        a, b: in signed(n-1 downto 0);
        op: in std_logic;
        r: out signed(n-1 downto 0)
    );
    end FuncLog_Nbits;

architecture behavioral of FuncLog_Nbits is
    begin
        r <= a and b when op = '0' else
            a or b;
    end behavioral;
