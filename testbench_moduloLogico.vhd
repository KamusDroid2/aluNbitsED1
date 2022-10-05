library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FuncLog_Nbits_test is
end FuncLog_Nbits_test;

architecture Behavioral of FuncLog_Nbits_test is
	constant n_test: integer := 4;
	component FuncLog_Nbits is
    	generic(n: integer := 4);
        port(a, b: in signed(N-1 downto 0);
            op: in std_logic;
            r: out signed(N-1 downto 0)
        );
    end component;
    signal a_test, b_test, r_test: signed(n_test-1 downto 0);
    signal op_test: std_logic;
begin
	uut: FuncLog_Nbits
    generic map(n => n_test)
    port map(
    	a => a_test,
        b => b_test,
        op => op_test,
        r => r_test
    );
    process
    begin
    	a_test <= "1111";
        b_test <= "0001";
        op_test <= '0';
        wait for 1 ns;
        assert r_test = "0000" report "Fallo caso 1" severity failure;
        
        a_test <= "0011";
        b_test <= "0011";
        OP_test <= '1';
        wait for 1 ns;
        assert r_test = "0111" report "Fallo caso 2" severity failure;
        
        a_test <= "1111";
        b_test <= "0011";
        OP_test <= '0';
        wait for 1 ns;
        assert r_test = "0101" report "Fallo caso 3" severity failure;
        
        assert false report "Test Done" severity note;
        wait;
    end process;
end Behavioral;
