library ieee;
use ieee.std_logic_1164.all;
entity srlatch is
    port (s,r:in std_logic ; Q,Qbar: out std_logic);
   end srlatch;
architecture arch of srlatch is 
signal state,staten:std_logic;
begin
state <= (not s NAND staten);
staten <= (not r NAND state);
Q <= state;
Qbar <= staten;
end arch;
