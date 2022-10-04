library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

ENTITY SumArit_Nbits_test IS
END SumArit_Nbits_test;

architecture Behavioral of SumArit_Nbits_test is
	component SumArit_Nbits
    generic(n : integer := 4);
    port(
        a, b: in signed(n-1 downto 0);
        op: in std_logic;
        r: out signed(n-1 downto 0);
        zcvn: out std_logic_vector(3 downto 0)
    );
    end component;
    
	signal test_a, test_b: signed (n-1 downto 0) := '0000';
    signal test_op std_logic := '0';
    signal r_test signed (n-1 downto 0) := '0000';
    signal test_zcvn std_logic_vector(3 downto 0) := '0000';

begin
	SumArit: entity work.SumArit_Nbits(Behavioral)
    port map(
    a => test_a;
    b => test_b;
    op => test_op;
    r => r_test;
    zcvn = > test_zcvn
    );

process 
begin

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='', test_zcvn='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='', test_zcvn='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='', test_zcvn='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='', test_zcvn='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='', test_zcvn='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='', test_zcvn='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='', test_zcvn='' ) report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='', test_zcvn='') report "Fallo caso 0" severity error;

    test_a <= '';
    test_b <= '';
    test_sel <= '';
    wait for 1 ns;
    assert (r_test='', test_zcvn='') report "Fallo caso 0" severity error;

    assert false report "Test terminado" severity note;
    wait;
  end process;
end;
