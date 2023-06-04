


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sensores is
    Port ( CLK : in STD_LOGIC;
           SEN : in STD_LOGIC_VECTOR (1 downto 0);
           CLR : in STD_LOGIC;
           EN : out STD_LOGIC;
           UD : out STD_LOGIC);
end Sensores;

architecture aSensores of Sensores is
type estados is (q0, q1, q2, q3, q4, q5, q6, q7);
signal edo_actual, edo_sig: estados;

begin
    automata: process (edo_actual, sen)
    begin
        case edo_actual is
            when q0 =>
                if (SEN = "00") then
                    edo_sig <= q0;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "01") then
                    edo_sig <= q4;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "10") then
                    edo_sig <= q1;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "11") then
                    edo_sig <= q7;
                    EN <= '0';
                    UD <='-';
                end if;
            when q1 =>
                if (SEN = "00") then
                    edo_sig <= q0;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "01") then
                    edo_sig <= q4;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "10") then
                    edo_sig <= q1;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "11") then
                    edo_sig <= q2;
                    EN <= '0';
                    UD <='-';
                end if;
            when q2 =>
                 if (SEN = "00") then
                    edo_sig <= q0;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "01") then
                    edo_sig <= q3;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "10") then
                    edo_sig <= q1;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "11") then
                    edo_sig <= q2;
                    EN <= '0';
                    UD <='-';
                end if;
            when q3 =>
                 if (SEN = "00") then
                    edo_sig <= q0;
                    EN <= '1';
                    UD <='1';
                elsif (SEN = "01") then
                    edo_sig <= q3;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "10") then
                    edo_sig <= q1;
                    EN <= '1';
                    UD <='1';
                elsif (SEN = "11") then
                    edo_sig <= q2;
                    EN <= '0';
                    UD <='-';
                end if;
            when q4 =>
                 if (SEN = "00") then
                    edo_sig <= q0;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "01") then
                    edo_sig <= q4;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "10") then
                    edo_sig <= q1;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "11") then
                    edo_sig <= q5;
                    EN <= '0';
                    UD <='-';
                end if;
            when q5 =>
                 if (SEN = "00") then
                    edo_sig <= q0;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "01") then
                    edo_sig <= q4;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "10") then
                    edo_sig <= q6;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "11") then
                    edo_sig <= q5;
                    EN <= '0';
                    UD <='-';
                end if;
            when q6 =>
                 if (SEN = "00") then
                    edo_sig <= q0;
                    EN <= '1';
                    UD <='0';
                elsif (SEN = "01") then
                    edo_sig <= q4;
                    EN <= '1';
                    UD <='0';
                elsif (SEN = "10") then
                    edo_sig <= q6;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "11") then
                    edo_sig <= q5;
                    EN <= '0';
                    UD <='-';
                end if;
            when q7 =>
                 if (SEN = "00") then
                    edo_sig <= q0;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "01") then
                    edo_sig <= q4;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "10") then
                    edo_sig <= q1;
                    EN <= '0';
                    UD <='-';
                elsif (SEN = "11") then
                    edo_sig <= q7;
                    EN <= '0';
                    UD <='-';
                end if;
        end case;
end process automata;

transicion: process(CLK, CLR)
    begin
        if (CLR = '1') then
            edo_actual <= q0;
        elsif (CLK'event and CLK = '1') then
            edo_actual <= edo_sig;
        end if;
    end process transicion;

end aSensores;
