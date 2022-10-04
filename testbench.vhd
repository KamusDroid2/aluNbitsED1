library IEEE;
use IEEE.std_logic_1164.all;

entity ALU_Nbits_test is
end ALU_Nbits_test;

architecture Behavioral of ALU_Nbits_test is

component ALU_Nbits is 
	port(
    	nro1,nro2: in signed(N-1 downto 0);
        selec: in std_logic_vector (1 downto 0);
        resul: out signed(N-1 downto 0);
        flags: out std_logic_vector(3 downto 0);
         );
end component;

signal nro1_test, nro2_test: signed (N-1 downto 0);
signal selec_test: std_logic_vector (1 downto 0);
signal resul_test: signed (N-1 downto 0);
signal flags_test: std_logic_vector (3 downto 0);

begin

ALU: ALU_Nbits port map(
		nro1=> nro1_test,
        nro2=>nro2_test,
        resul=> resul_test,
        flags=>flags_test
        );

process
begin
	
    nro1_test <='1111';
    nro2_test <='0001';
    selec_test <= "00";
    wait for 1 ns;
    assert (resul_test='') report "Fallo caso 0" severity error;

    nro1_test <='0101';
    nro2_test <='0101';
    selec_test <= "00";
    wait for 1 ns;
    assert (resul_test='') report "Fallo caso 1" severity error;
    
    nro1_test <='0101';
    nro2_test <='0101';
    selec_test <= "01";
    wait for 1 ns;
    assert (resul_test='') report "Fallo caso 2" severity error;
    
    nro1_test <='1000';
    nro2_test <='0111';
    selec_test <= "00";
    wait for 1 ns;
    assert (resul_test='') report "Fallo caso 3" severity error;

    nro1_test <='1000';
    nro2_test <='0111';
    selec_test <= "01";
    wait for 1 ns;
    assert (resul_test='') report "Fallo caso 4" severity error;

    nro1_test <='0110';
    nro2_test <='1010';
    selec_test <= "00";
    wait for 1 ns;
    assert (resul_test='') report "Fallo caso 5" severity error;

    nro1_test <='0110';
    nro2_test <='1010';
    selec_test <= "01";
    wait for 1 ns;
    assert (resul_test='') report "Fallo caso 6" severity error;

    nro1_test <='1101';
    nro2_test <='1100';
    selec_test <= "10";
    wait for 1 ns;
    assert (resul_test='') report "Fallo caso 7" severity error;

    nro1_test <='1101';
    nro2_test <='1101';
    selec_test <= "11";
    wait for 1 ns;
    assert (resul_test='') report "Fallo caso 8" severity error;
    
    assert false report "Test done" severity note;
    wait;
  end process;
end;
