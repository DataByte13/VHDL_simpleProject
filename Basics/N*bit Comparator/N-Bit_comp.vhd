library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity compar_nbit is 
  generic (n :in integer := 4 );
  port (
    input1 : in std_logic_vector(n-1 downto 0);
    input2 : in std_logic_vector(n-1 downto 0);
    resultFlag_G : out std_logic;
    resultFlag_E : out std_logic;
    resultFlag_L : out std_logic 
       );
end compar_nbit;
architecture compar_nbit_arch of compar_nbit is 
  signal greater , equal , lower :std_logic_vector(n-1 downto 0); 
  component compar_1Bit 
  port (
    in1 : in std_logic ;
    in2 : in std_logic ;
    flags_G : out std_logic ; 
    flags_E : out std_logic;
    flags_L : out std_logic
       );
 end component;
begin 
  comprator : for i in n-1 downto 0 generate 
    U_CMP : compar_1Bit port map (
    in1 => input1(i) ,
    in2 => input2(i) ,
    flags_G => greater(i), 
    flags_E => equal(i),
    flags_L => lower(i) 
    );
  end generate;
  process(greater , equal , lower)
  begin 
    for i in n-1 downto 0 loop 
      if equal(i) = '1' then 
        resultFlag_G <= '0';
        resultFlag_E<= '1';
        resultFlag_L<= '0';
        next;
      elsif greater(i) = '1' then 
        resultFlag_G <= '1';
        resultFlag_E<= '0';
        resultFlag_L<= '0';
        exit;
      elsif lower(i) = '1' then 
        resultFlag_G<= '0';
        resultFlag_E<= '0';
        resultFlag_L<= '1';
        exit; 
      end if;
    end loop;
  end process ;
end compar_nbit_arch;

