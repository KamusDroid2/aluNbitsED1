library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity test_FuncLog_Nbits is
end test_FuncLog_Nbits;


architecture Behavioral of test_FuncLog_Nbits is

    constant(n: integer := 4);

    component modulo_logico 
    generic(n : integer := 4);
    port
        (
            a, b: in signed(n-1 downto 0);
            op: in std_logic;
            r: out signed(n-1 downto 0)
        );
    end component;

    -- inputs
    signal test_a : signed(n-1 downto 0) := '0000';
    signal test_b : signed(n-1 downto 0) := '0000';
    -- outputs
    signal test_r : signed(n-1 downto 0);
    signal test_op : std_logic       := '0';

begin
    uut : modulo_logico port map
    (
        a => test_a,
        b => test_b,
        op => test_op,
        r => test_r
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
    test_a <= '1111';
    test_b <= '1110';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '1110' report "Fallo en caso 2" severity failure;

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

    -- Caso 6
    test_a <= '1000';
    test_b <= '1010';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '1010' report "Fallo en caso 6" severity failure;

    -- Caso 7
    test_a <= '0001';
    test_b <= '0101';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '0101' report "Fallo en caso 7" severity failure;

    -- Caso 8
    test_a <= '0001';
    test_b <= '0000';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '0001' report "Fallo en caso 8" severity failure;


    -- Caso 9
    test_a <= '0000';
    test_b <= '0010';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '0010' report "Fallo en caso 9" severity failure;


    -- Caso 10
    test_a <= '0001';
    test_b <= '0010';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '0011' report "Fallo en caso 10" severity failure;

    -- Caso 11
    test_a <= '0000';
    test_b <= '0100';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '0100' report "Fallo en caso 11" severity failure;
   
    -- Caso 12
    test_a <= '0010';
    test_b <= '0100';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '0110' report "Fallo en caso 12" severity failure;

    -- Caso 13
    test_a <= '0101';
    test_b <= '0111';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '0111' report "Fallo en caso 13" severity failure;

    -- Caso 14
    test_a <= '1000';
    test_b <= '0000';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '1000' report "Fallo en caso 14" severity failure;
    
    -- Caso 15
    test_a <= '1001';
    test_b <= '1011';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '1011' report "Fallo en caso 15" severity failure;

    -- Caso 16
    test_a <= '1000';
    test_b <= '1100';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '1100' report "Fallo en caso 16" severity failure;

    -- Caso 17
    test_a <= '1010';
    test_b <= '0110';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '1110' report "Fallo en caso 17" severity failure;

    -- Caso 18
    test_a <= '0000';
    test_b <= '0000';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '0000' report "Fallo en caso 18" severity failure;

    -- Caso 19                
    test_a <= '0001';
    test_b <= '1001';
    test_op <= '1';
    wait for 1 ns;
    assert test_r = '1001' report "Fallo en caso 19" severity failure;

    -- Caso 20
    test_a <= '1011';
    test_b <= '0001';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '0001' report "Fallo en caso 20" severity failure;

    -- Caso 20
    test_a <= '1011';
    test_b <= '0001';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '0001' report "Fallo en caso 20" severity failure;

    -- Caso 21
    test_a <= '1110';
    test_b <= '0011';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '0010' report "Fallo en caso 21" severity failure;

    -- Caso 22
    test_a <= '1011';
    test_b <= '0111';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '0011' report "Fallo en caso 22" severity failure;

    -- Caso 23
    test_a <= '0110';
    test_b <= '1101';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '0100' report "Fallo en caso 23" severity failure;

    -- Caso 24
    test_a <= '1111';
    test_b <= '0101';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '0101' report "Fallo en caso 24" severity failure;

    -- Caso 25
    test_a <= '1110';
    test_b <= '0111';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '0110' report "Fallo en caso 25" severity failure;

    -- Caso 26
    test_a <= '0111';
    test_b <= '1111';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '0111' report "Fallo en caso 26" severity failure;

    -- Caso 27
    test_a <= '1011';
    test_b <= '1100';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '1000' report "Fallo en caso 27" severity failure;

    -- Caso 28
    test_a <= '1011';
    test_b <= '1001';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '1001' report "Fallo en caso 28" severity failure;

    -- Caso 29
    test_a <= '1110';
    test_b <= '1011';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '1010' report "Fallo en caso 29" severity failure;

    -- Caso 30
    test_a <= '1111';
    test_b <= '1011';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '1011' report "Fallo en caso 30" severity failure;

    -- Caso 31
    test_a <= '1101';
    test_b <= '1111';
    test_op <= '0';
    wait for 1 ns;
    assert test_r = '1101' report "Fallo en caso 31" severity failure;

    assert false report "testbench completado" severity note;

wait;
end process;
end Behavioral;
