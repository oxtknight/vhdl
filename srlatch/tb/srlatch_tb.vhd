library ieee;
use ieee.std_logic_1164.all;
entity srlatch_tb is
    end entity;
architecture arch of srlatch_tb is
    signal s,r,q,qbar:std_logic:='0';
begin
    uut: entity work.srlatch port map(s=>s,r=>r,Q=>q,Qbar=>qbar);
    process
    begin
        s<='0'; r<='1' ;wait for 20 ns; --reset state 
        s<='1';r<='0';wait for 20 ns; --set state
        s<='0';r<='0';wait for 20 ns; --hold state
        s<='0';r<='1'; wait for 20 ns; --reset state
        wait;
    end process;
end arch;


