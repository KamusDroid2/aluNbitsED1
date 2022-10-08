library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

ENTITY SumArit_Nbits_test IS
END SumArit_Nbits_test;

architecture Behavioral of SumArit_Nbits_test is
	constant n : integer := 4;
    component SumArit_Nbits is
    generic(n : integer := 4);
    port(
        a, b: in signed(n-1 downto 0);
        op: in std_logic;
        r: out signed(n-1 downto 0);
        zcvn: out std_logic_vector(3 downto 0)
    );
    end component;

	signal a_test: signed (n-1 downto 0) := "0000";
    signal b_test: signed (n-1 downto 0) := "0000";
    signal op_test : std_logic := '0';
    signal r_test : signed (n-1 downto 0);
    signal zcvn_test : std_logic_vector(3 downto 0);

begin
	SumArit: SumArit_Nbits
    port map(
    a => a_test,
    b => b_test,
    op => op_test,
    r => r_test,
    zcvn => zcvn_test
    );
	process
    begin
    	
    	a_test <= "0000";
        b_test <= "0000";
        op_test <= '0';
        wait for 1 ns;
        assert r_test = "0000" report "Fallo Caso 0" severity failure;
        assert zcvn_test = "1000" report "Fallo Caso 0 (flag)" severity failure;
        
        a_test <= "0001";
        b_test <= "0001";
        op_test <= '0';
        wait for 1 ns;
        assert r_test = "0010" report "Fallo Caso 1" severity failure;
        assert zcvn_test = "0000" report "Fallo Caso 1 (flag)" severity failure;
        
    	a_test <= "1100";
        b_test <= "0011";
        op_test <= '0';
        wait for 1 ns;
        assert r_test = "1111" report "Fallo Caso 2" severity failure;
        assert zcvn_test = "0001" report "Fallo Caso 2 (flag)" severity failure;
        
        a_test <= "1001";
        b_test <= "1111";
        op_test <= '1';
        wait for 1 ns;
        assert r_test = "1010" report "Fallo Caso 3" severity failure;
        assert zcvn_test = "0101" report "Fallo Caso 3 (flag)" severity failure;
        
        a_test <= "1011";
        b_test <= "0000";
        op_test <= '1';
        wait for 1 ns;
        assert r_test = "1011" report "Fallo Caso 4" severity failure;
        assert zcvn_test = "0001" report "Fallo Caso 4 (flag)" severity failure;
        
        a_test <= "1000";
        b_test <= "0001";
        op_test <= '0';
        wait for 1 ns;
        assert r_test = "1001" report "Fallo Caso 5" severity failure;
        assert zcvn_test = "0001" report "Fallo Caso 5 (flag)" severity failure;
        
        a_test <= "1100";
        b_test <= "0001";
        op_test <= '0';
        wait for 1 ns;
        assert r_test = "1101" report "Fallo Caso 6" severity failure;
        assert zcvn_test = "0001" report "Fallo Caso 6 (flag)" severity failure;
        
        a_test <= "1111";
        b_test <= "0000";
        op_test <= '1';
        wait for 1 ns;
        assert r_test = "1111" report "Fallo Caso 7" severity failure;
        assert zcvn_test = "0001" report "Fallo Caso 7 (flag)" severity failure;
        
        a_test <= "0000";
        b_test <= "0011";
        op_test <= '0';
        wait for 1 ns;
        assert r_test = "0011" report "Fallo Caso 8" severity failure;
        assert zcvn_test = "0000" report "Fallo Caso 8 (flag)" severity failure;
        
        a_test <= "0100";
        b_test <= "0000";
        op_test <= '0';
        wait for 1 ns;
        assert r_test = "0100" report "Fallo Caso 9" severity failure;
        assert zcvn_test = "0000" report "Fallo Caso 9 (flag)" severity failure;
        
        assert false report "Test Done" severity note;
        wait;
    end process;
end behavioral;
