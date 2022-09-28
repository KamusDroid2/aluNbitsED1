library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_Nbits is
    generic(n : integer := 4);
    port(
        nro1, nro2: in signed(n-1 downto 0);
        selec : in std_logic_vector(1 downto 0);
        resul: out signed(n-1 downto 0);
        flags: out std_logic_vector(n-1 downto 0)
    );
    end ALU_Nbits;

    architecture behavioral of ALU_Nbits is
        signal selec_x : std_logic;
        signal arit_x, log_x : signed(n-1 downto 0);
        signal flag : std_logic_vector(3 downto 0);
        signal arit_s, log_s : signed(n-1 downto 0);
        begin
        with selec select
        selec_x <= '0' when "00",
        		'1' when "01",
        		'0' when "10",
        		'1' when others;

        FuncLog_Nbits_0: entity work.FuncLog_Nbits(behavioral)
        port map(
            a => nro1,
            b => nro2,
            op => selec_x,
            r => log_x
        );

        SumArit_Nbits_0: entity work.SumArit_Nbits(behavioral)
        port map(
            A => nro1,
            B => nro2,
            op => selec_x,
            zcvn => flags,
            r => arit_x
        );
        
        with selec select
        	arit_s <= "1111" when "00",
                	"1111" when "01",
                    "0000" when others;

		with selec select
        	log_s <= "1111" when "10",
          	      	"1111" when "11",
            	    "0000" when others;
                
        resul <= arit_s or log_s;
        
    	end behavioral;
