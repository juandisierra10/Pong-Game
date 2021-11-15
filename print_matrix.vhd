LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------
ENTITY print_matrix IS
	PORT(		clk	         	:	IN	STD_LOGIC;
				rst					:	IN	STD_LOGIC;
				ball_position_x  	:  IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				ball_position_y  	:  IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				racket_player_1 	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				racket_player_2   :  IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				rows_1           	:  OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
				rows_2           	:  OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
				columns_1        	:  OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
				columns_2        	:  OUT STD_LOGIC_VECTOR (7 DOWNTO 0));

END ENTITY;
-------------------------------------
ARCHITECTURE show OF print_matrix IS
	TYPE state IS (empty_1,empty_2,empty_3,Racket_1,Racket_2,Ball);
	SIGNAL	pr_state,nx_state : state;


BEGIN
		PROCESS (rst,clk)
			BEGIN
				IF (rst='1') THEN
					pr_state<=empty_1;
				ELSIF (rising_edge(Clk)) THEN
					pr_state <= nx_state;
				END IF;
		END PROCESS;

		state_logic: PROCESS (pr_state,racket_player_1,racket_player_2,ball_position_x,ball_position_y)
			BEGIN
				CASE pr_state IS
					WHEN empty_1 =>
						rows_1<="00000000";
						rows_2<="00000000";
						columns_1 <= "11111111";
						columns_2 <= "11111111";
					   nx_state <= Racket_1;
						
					WHEN Racket_1 =>
						rows_1 <= racket_player_1;
						rows_2<="00000000";
						columns_1 <= "01111111";
						columns_2<= "11111111";
						nx_state <= empty_2;

					WHEN empty_2 =>
						rows_1<="00000000";
						rows_2<="00000000";
						columns_1 <= "11111111";
						columns_2 <= "11111111";
					   nx_state <= Racket_2;
					
					WHEN Racket_2 =>
					   rows_1<="00000000";
						rows_2 <= racket_player_2;
						columns_1 <= "11111111";
						columns_2 <= "11111110";
						nx_state <= empty_3;

					WHEN empty_3 =>
						rows_1<="00000000";
						rows_2<="00000000";
						columns_1 <= "11111111";
						columns_2 <= "11111111";
					   nx_state <= Ball;
						
					WHEN Ball =>
						rows_1(7 DOWNTO 0) <= ball_position_x (15 DOWNTO 8);
						rows_2(7 DOWNTO 0)<=ball_position_x(7 DOWNTO 0);
						columns_1(7 DOWNTO 0) <= ball_position_y (15 DOWNTO 8);
						columns_2(7 DOWNTO 0)<=ball_position_y(7 DOWNTO 0);
						nx_state <= empty_1;
					END CASE;
			END PROCESS;
	END ARCHITECTURE;
						

				