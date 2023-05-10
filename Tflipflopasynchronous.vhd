library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity T_FlipFlop is
    Port ( reset : in  STD_LOGIC;
           CLK   : in  STD_LOGIC;
           q     : inout  STD_LOGIC;
           qnot  : inout  STD_LOGIC);
end T_FlipFlop;

architecture Behavioral of T_FlipFlop is

begin
process(reset,CLK)
begin
if reset='0' then
q<='0';
qnot<='1';
else

if (CLK='1' and CLK'event) then
                q <= not q after 7ns;
                qnot <= not qnot after 7ns;
                end if;
           end if;

end process;

end Behavioral;
