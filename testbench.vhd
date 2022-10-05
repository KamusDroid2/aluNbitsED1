library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_Nbits_test is
end ALU_Nbits_test;

architecture Behavioral of ALU_Nbits_test is

	constant zero : integer := 4;
	constant n : integer := 4;

	component ALU_Nbits is 
	generic (n : integer := 4);
	port(
    	nro1,nro2: in signed(N-1 downto 0);
        selec: in std_logic_vector (1 downto 0);
        resul: out signed(N-1 downto 0);
        flags: out std_logic_vector(3 downto 0);
         );
    end component;

signal nro1_test, nro2_test: signed (N-1 downto 0) := "0000";
signal selec_test: std_logic_vector (1 downto 0) := "00";
signal resul_test: signed (N-1 downto 0);
signal flags_test: std_logic_vector (3 downto 0);

begin

ALU: ALU_Nbits port map(
	nro1=> nro1_test,
        nro2=>nro2_test,
		selec=>selec_test,
        resul=> resul_test,
        flags=>flags_test
        );

process
begin
	
    nro1_test <= "1111";
        nro2_test <= "0001";
        selec_test <= "00";
        wait for 1 ns;
        assert (resul_test = "0000") report "Fallo Caso 1" severity failure;
        assert (flags_test = "1100") report "Fallo Caso 1 (flag)" severity failure;
        
        nro1_test <= "0101";
        nro2_test <= "0101";
        selec_test <= "00";
        wait for 1 ns;
        assert (resul_test = "1010") report "Fallo Caso 2" severity failure;
        assert (flags_test = "0011") report "Fallo Caso 2 (flag)" severity failure;
        
        selec_test <= "01";
        wait for 1 ns;
        assert (resul_test = "0000") report "Fallo Caso 3" severity failure;
        assert (flags_test = "1000") report "Fallo Caso 3 (flag)" severity failure;
        
        nro1_test <= "1000";
        nro2_test <= "0111";
        selec_test <= "00";
        wait for 1 ns;
        assert (resul_test = "1111") report "Fallo Caso 4" severity failure;
        assert (flags_test = "0001") report "Fallo Caso 4 (flag)" severity failure;
        
        selec_test <= "01";
        wait for 1 ns;
        assert (resul_test = "0001") report "Fallo Caso 5" severity failure;
        assert (flags_test = "0010") report "Fallo Caso 5 (flag)" severity failure;
        
        nro1_test <= "0110";
        nro2_test <= "1010";
        selec_test <= "00";
        wait for 1 ns;
        assert (resul_test = "0000") report "Fallo Caso 6" severity failure;
        assert (flags_test = "1100") report "Fallo Caso 6 (flag)" severity failure;
        
        selec_test <= "01";
        wait for 1 ns;
        assert (resul_test = "1100") report "Fallo Caso 7" severity failure;
        assert (flags_test = "0111") report "Fallo Caso 7 (flag)" severity failure;
        
        nro1_test <= "1101";
        nro2_test <= "1100";
        selec_test <= "10";
        wait for 1 ns;
        assert (resul_test = "1100") report "Fallo Caso 8" severity failure;
        assert (flags_test = "0000") report "Fallo Caso 8 (flag)" severity failure;
        
        nro2_test <= "1101";
        selec_test <= "11";
        wait for 1 ns;
        assert (resul_test = "1101") report "Fallo Caso 9" severity failure;
        assert (flags_test = "0000") report "Fallo Caso 9 (flag)" severity failure;
    
    assert false report "Test done" severity note;
    wait;
  end process;
end;
