library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity mod_m_counter is
generic (
N: integer := 4;
M : integer := 10);
port (
clk, reset: in std_logic;
max_tick: out std_logic;
q: out std_logic_vector ( N - 1 downto 0);
an: out std_logic_vector(3 downto 0);
sseg: out std_logic_vector ( 7 downto 0)
);
end mod_m_counter ;
architecture arch of mod_m_counter is
signal cath,off: std_logic ;
signal r_reg : unsigned ( N - 1 downto 0 ) ;
signal r_next : unsigned ( N - 1 downto 0 ) ;
begin

process (clk, reset)
begin
if (reset='0') then
r_reg <= ( others => '0' ) ;
elsif (clk'event and clk='1') then
r_reg <= r_next;
end if ;


end process ;

r_next <= ( others => '0' ) when r_reg=(M-1) else
r_reg + 1;

q <= std_logic_vector(r_reg);

max_tick <= '1' when r_reg=(M-1) else '0' ;

end arch;