library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SumArit_Nbits_test is
end SumArit_Nbits_test;

architecture Behavioral of SumArit_Nbits_test is
	component SumArit_Nbits is
    	generic(n: integer := 4);
        port(
            a, b: in signed(N-1 downto 0);
            op: in std_logic;
            r: out signed(N-1 downto 0);
            zcvn: out std_logic_vector(3 downto 0);
        );
    end component;
   	constant n_test: integer := 4;
    signal a_test, b_test, r_test: signed(N_test - 1 downto 0);
    signal op_test: std_logic;
    signal zcvn_test: std_logic_vector(3 downto 0);
begin
	uut: SumArit_Nbits generic map(N => N_test)
    				   port map(
                           a => a_test,
                           b => b_test,
                           op => op_test,
                           r => r_test,
                           zcvn => zcvn_test
                       );
	process
    begin
    	a_test <= "1100";
        b_test <= "0011";
        op_test <= '0';
        wait for 1 ns;
        assert r_test = "0010" report "Falló Caso 1" severity failure;
        assert zcvn_test = "1111" report "Fallo Caso 1 (flag)" severity failure;
        
        a_test <= "1001";
        b_test <= "1111";
        op_test <= '1';
        wait for 1 ns;
        assert r_test = "1010" report "Fallo Caso 2" severity failure;
        assert zcvn_test = "1111" report "Fallo Caso 2 (flag)" severity failure;
        
        assert false report "Test Done" severity note;
        wait;
    end process;
end behavioral;
