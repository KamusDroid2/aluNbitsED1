library IEEE;
use IEEE.std_logic_1164.all;

entity test_FuncLog_Nbits is
end test_FuncLog_Nbits;


architecture Behavioral of test_FuncLog_Nbits is

    component modulo_logico 
    generic(n : integer := 4);
    port
        (
            a, b: in signed(n-1 downto 0);
            op: in std_logic;
            r: out signed(n-1 downto 0)
        );
    end component;

    signal test_a : std_logic_vector := '0000';
    signal test_b : std_logic_vector := '0000';
    signal test_op : std_logic       := '0';
    signal test_r : std_logic_vector;


begin
    uut : modulo_logico port map
    (
        a => test_a,
        b => test_b,
        op => test_op
    );
    process begin

    -- Caso 0
    test_a <= '0000';
    test_b <= '0000';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '0000' report "Fallo en caso 0" severity failure;

    -- Caso 1
    test_a <= '1111';
    test_b <= '1111';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '1111' report "Fallo en caso 1" severity failure;

    -- Caso 2
    test_a <= '0010';
    test_b <= '1101';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '0000' report "Fallo en caso 2" severity failure;

    -- Caso 3
    test_a <= '0010';
    test_b <= '1101';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '1111' report "Fallo en caso 3" severity failure;

    -- Caso 4
    test_a <= '1101';
    test_b <= '1100';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '1100' report "Fallo en caso 4" severity failure;

    -- Caso 5
    test_a <= '1101';
    test_b <= '1101';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '1101' report "Fallo en caso 5" severity failure;

    assert false report "testbench completado" severity note;
    wait;

end process;
end Behavioral;
