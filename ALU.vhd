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
        signal mas_sig, menos_sig : std_logic;
        
        begin
        
        
        with menos_sig select
        selec_x <= '0' when '0',
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
        
        mas_sig <= selec(1);
        menos_sig <= selec(0);
        with mas_sig select
        resul <= log_x when '1',
                arit_X when others;
        
    	end behavioral;
