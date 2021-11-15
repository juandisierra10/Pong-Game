LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
--------------------------
ENTITY racket IS
	PORT (	clk			  :      IN  STD_LOGIC;
				rst			  :      IN  STD_LOGIC;
				Up 			  :		IN	 STD_LOGIC;
				Down   		  :		IN  STD_LOGIC;
            Racket_Player : 		OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;
--------------------------
ARCHITECTURE position OF racket IS
	TYPE state IS (initial,position_1,position_2,position_3,position_4,position_5);
	SIGNAL	pr_state,nx_state : state; 
	SIGNAL   Racket_Player_Next    : STD_LOGIC_VECTOR (7 DOWNTO 0);
	
BEGIN
			---------Process of the state logic----------
	   state_logic: PROCESS (rst, clk)
		BEGIN 
		   IF (rst='1') THEN 
			
				pr_state <= initial;
				Racket_Player <= "11100000";
				
			ELSIF (rising_edge(clk)) THEN
				pr_state <= nx_state;
				Racket_Player <= Racket_Player_Next;
	    	END IF;
	END PROCESS;
	
	PROCESS(pr_state,Up,Down)
	BEGIN

			CASE pr_state IS
				WHEN initial =>	
					Racket_Player_Next <= "11100000";
					IF ((Down='1')) THEN
							nx_state <= position_1;
					ELSE
							nx_state <= initial;
					END IF;
					
				WHEN position_1 =>
						Racket_Player_Next <= "01110000";
					IF((Up='1')AND(Down='0')) THEN
						nx_state<= initial;
					ELSIF((Up='0')AND(Down='1')) THEN
						nx_state <= position_2;
					ELSE	
						nx_state <= position_1;
					END IF;
					
				WHEN position_2 =>
						Racket_Player_Next <= "00111000";
					IF((Up='1')AND(Down='0')) THEN
						nx_state<= position_1;
					ELSIF((Up='0')AND(Down='1')) THEN
						nx_state <= position_3;
					ELSE	
						nx_state <= position_2;
					END IF;
					
				WHEN position_3 =>
						Racket_Player_Next <= "00011100";
					IF((Up='1')AND(Down='0')) THEN
						nx_state<= position_2;
					ELSIF((Up='0')AND(Down='1')) THEN
						nx_state <= position_4;
					ELSE	
						nx_state <= position_3;
					END IF;
					
				WHEN position_4 =>
						Racket_Player_Next <= "00001110";
					IF((Up='1')AND(Down='0')) THEN
						nx_state<= position_3;
					ELSIF((Up='0')AND(Down='1')) THEN
						nx_state <= position_5;
					ELSE	
						nx_state <= position_4;
					END IF;
					
				WHEN position_5 =>
						Racket_Player_Next <= "00000111";
					IF((Up='1')AND(Down='0')) THEN
						nx_state<= position_4;
					ELSE	
						nx_state <= position_5;
					END IF;
				END CASE;
	END PROCESS;
END ARCHITECTURE;