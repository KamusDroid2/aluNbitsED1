library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

ENTITY FuncLog_Nbits_test IS
END FuncLog_Nbits_test;

architecture Behavioral of FuncLog_Nbits_test is
	component FuncLog_Nbits
    generic(n : integer := 2);
    port(
        a, b: in signed(n-1 downto 0);
        op: in std_logic;
        r: out signed(n-1 downto 0)
    );
    end component;
    
	signal test_a, test_b: signed (n-1 downto 0) := '00';
    signal test_op std_logic := '0';
    signal test_r signed (n-1 downto 0) := '00';

begin
	FunLog: entity work.FuncLog_Nbits(Behavioral)
    port map(
    a => test_a;
    b => test_b;
    op => test_op;
    r => test_r
    );

process 
begin

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='') report "Fallo caso 0" severity error;

    assert false report "Test terminado" severity note;
    wait;
  end process;
end;
