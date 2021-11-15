LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
------------------------------------------
ENTITY ball IS

	PORT	(	clk			: IN STD_LOGIC;
				en_ball     : IN STD_LOGIC;
				rst     		: IN STD_LOGIC;
				player1 		: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				player2 		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				Score_1     : OUT STD_LOGIC; 
				Score_2     : OUT STD_LOGIC; 
				Ball_X_r  	: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
				Ball_Y_r  	: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			 
END ENTITY;
--------------------------------------------
ARCHITECTURE play OF ball IS

	TYPE state IS (winner_1,winner_2,r2_1,r2_2,r2_3,r2_4,r2_5,r2_6,r2_7,r2_8,r2_9,r2_10,r2_11,r2_12,r2_13,r2_14,r3_1,r3_2,r3_3,r3_4,r3_5,r3_6,r3_7,r3_8,r3_9,r3_10,r3_11,r3_12,r3_13,r3_14,r4_1,r4_2,r4_3,r4_4,r4_5,r4_6,r4_7,r4_8,r4_9,r4_10,r4_11,r4_12,r4_13,r4_14,r5_1,r5_2,r5_3,r5_4,r5_5,r5_6,r5_7,r5_8,r5_9,r5_10,r5_11,r5_12,r5_13,r5_14,r6_1,r6_2,r6_3,r6_4,r6_5,r6_6,r6_7,r6_8,r6_9,r6_10,r6_11,r6_12,r6_13,r6_14,r7_1,r7_2,r7_3,r7_4,r7_5,r7_6,r7_7,r7_8,r7_9,r7_10,r7_11,r7_12,r7_13,r7_14,l2_1,l2_2,l2_3,l2_4,l2_5,l2_6,l2_7,l2_8,l2_9,l2_10,l2_11,l2_12,l2_13,l2_14,l3_1,l3_2,l3_3,l3_4,l3_5,l3_6,l3_7,l3_8,l3_9,l3_10,l3_11,l3_12,l3_13,l3_14,l4_1,l4_2,l4_3,l4_4,l4_5,l4_6,l4_7,l4_8,l4_9,l4_10,l4_11,l4_12,l4_13,l4_14,l5_1,l5_2,l5_3,l5_4,l5_5,l5_6,l5_7,l5_8,l5_9,l5_10,l5_11,l5_12,l5_13,l5_14,l6_1,l6_2,l6_3,l6_4,l6_5,l6_6,l6_7,l6_8,l6_9,l6_10,l6_11,l6_12,l6_13,l6_14,l7_1,l7_2,l7_3,l7_4,l7_5,l7_6,l7_7,l7_8,l7_9,l7_10,l7_11,l7_12,l7_13,l7_14,udr1_1,udr1_2,udr1_3,udr1_4,udr1_5,udr1_6,udr1_7,udr1_8,udr1_9,udr1_10,udr1_11,udr1_12,udr1_13,udr1_14,udr2_1,udr2_2,udr2_3,udr2_4,udr2_5,udr2_6,udr2_7,udr2_8,udr2_9,udr2_10,udr2_11,udr2_12,udr2_13,udr2_14,udr3_1,udr3_2,udr3_3,udr3_4,udr3_5,udr3_6,udr3_7,udr3_8,udr3_9,udr3_10,udr3_11,udr3_12,udr3_13,udr3_14,udr4_1,udr4_2,udr4_3,udr4_4,udr4_5,udr4_6,udr4_7,udr4_8,udr4_9,udr4_10,udr4_11,udr4_12,udr4_13,udr4_14,udr5_1,udr5_2,udr5_3,udr5_4,udr5_5,udr5_6,udr5_7,udr5_8,udr5_9,udr5_10,udr5_11,udr5_12,udr5_13,udr5_14,udl1_1,udl1_2,udl1_3,udl1_4,udl1_5,udl1_6,udl1_7,udl1_8,udl1_9,udl1_10,udl1_11,udl1_12,udl1_13,udl1_14,udl2_2,udl2_3,udl2_4,udl2_5,udl2_6,udl2_7,udl2_8,udl2_9,udl2_10,udl2_11,udl2_12,udl2_13,udl2_14,udl3_2,udl3_3,udl3_4,udl3_5,udl3_6,udl3_7,udl3_8,udl3_9,udl3_10,udl3_11,udl3_12,udl3_13,udl3_14,udl4_2,udl4_3,udl4_4,udl4_5,udl4_6,udl4_7,udl4_8,udl4_9,udl4_10,udl4_11,udl4_12,udl4_13,udl4_14,udl5_2,udl5_3,udl5_4,udl5_5,udl5_6,udl5_7,udl5_8,udl5_9,udl5_10,udl5_11,udl5_12,udl5_13,udl5_14,ddr1_1,ddr1_2,ddr1_3,ddr1_4,ddr1_5,ddr1_6,ddr1_7,ddr1_8,ddr1_9,ddr1_10,ddr1_11,ddr1_12,ddr1_13,ddr1_14,ddr2_1,ddr2_2,ddr2_3,ddr2_4,ddr2_5,ddr2_6,ddr2_7,ddr2_8,ddr2_9,ddr2_10,ddr2_11,ddr2_12,ddr2_13,ddr2_14,ddr3_1,ddr3_2,ddr3_3,ddr3_4,ddr3_5,ddr3_6,ddr3_7,ddr3_8,ddr3_9,ddr3_10,ddr3_11,ddr3_12,ddr3_13,ddr3_14,ddr4_1,ddr4_2,ddr4_3,ddr4_4,ddr4_5,ddr4_6,ddr4_7,ddr4_8,ddr4_9,ddr4_10,ddr4_11,ddr4_12,ddr4_13,ddr4_14,ddr5_1,ddr5_2,ddr5_3,ddr5_4,ddr5_5,ddr5_6,ddr5_7,ddr5_8,ddr5_9,ddr5_10,ddr5_11,ddr5_12,ddr5_13,ddr5_14,ddl1_1,ddl1_2,ddl1_3,ddl1_4,ddl1_5,ddl1_6,ddl1_7,ddl1_8,ddl1_9,ddl1_10,ddl1_11,ddl1_12,ddl1_13,ddl1_14,ddl2_1,ddl2_2,ddl2_3,ddl2_4,ddl2_5,ddl2_6,ddl2_7,ddl2_8,ddl2_9,ddl2_10,ddl2_11,ddl2_12,ddl2_13,ddl2_14,ddl3_1,ddl3_2,ddl3_3,ddl3_4,ddl3_5,ddl3_6,ddl3_7,ddl3_8,ddl3_9,ddl3_10,ddl3_11,ddl3_12,ddl3_13,ddl3_14,ddl4_1,ddl4_2,ddl4_3,ddl4_4,ddl4_5,ddl4_6,ddl4_7,ddl4_8,ddl4_9,ddl4_10,ddl4_11,ddl4_12,ddl4_13,ddl4_14,ddl5_1,ddl5_2,ddl5_3,ddl5_4,ddl5_5,ddl5_6,ddl5_7,ddl5_8,ddl5_9,ddl5_10,ddl5_11,ddl5_12,ddl5_13,ddl5_14);--(UpDiagonalRightCasePosition,UpDiagonalLeftCasePosition,DownDiagonalRightCasePosition,DownDiagonalLeftCasePosition)
	SIGNAL pr_state, nx_state: state;
	SIGNAL Player_1 : STD_LOGIC;
	SIGNAL Player_2 : STD_LOGIC;
	SIGNAL Ball_X  : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL Ball_Y  : STD_LOGIC_VECTOR (15 DOWNTO 0);
	

BEGIN	
   Ball_X_r <= Ball_X;
	Ball_Y_r <= Ball_Y;
	Score_1 <= Player_1;
	Score_2 <= Player_2;
   state_logic: PROCESS (rst, clk)
	BEGIN
		IF (rst = '1') THEN
			pr_state <= r4_1;
		ELSIF (rising_edge(clk)) THEN
			IF (en_ball='1') THEN
				pr_state <= nx_state;
			END IF;
			
		END IF;
	END PROCESS;
   
	game: PROCESS (pr_state,player1,player2)
	BEGIN
		CASE pr_state IS
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------          SCORES        --------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
			WHEN winner_1 =>
			    Player_1 <= '1';
				 Player_2 <= '0';
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1011111111111111"; 
				 nx_state <= r4_1;

			WHEN winner_2 =>
			    Player_1 <= '0';
				 Player_2 <= '1';
				 Ball_X <= "0001000000010000"; 
				 Ball_Y <= "1011111111111111"; 
				 nx_state <= r4_1;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE RIGHT CASE 2--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
		   WHEN r2_1 =>
				 Ball_X <= "0100000000010000";
				 Ball_Y <= "1011111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
						IF(player1="11100000") THEN
							nx_state <= r2_3; 	
						ELSIF(player1="01110000") THEN
							nx_state <= udr1_2;
						ELSE 	
							nx_state <= winner_2;
						END IF;
		   WHEN r2_2 =>
				 Ball_X <= "0100000000010000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_3; 
				 
		   WHEN r2_3 =>
				 Ball_X <= "0100000000010000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_4; 
				 
		   WHEN r2_4 =>
				 Ball_X <= "0100000000010000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_5; 

		   WHEN r2_5 =>
				 Ball_X <= "0100000000010000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_6; 

			WHEN r2_6 =>
				 Ball_X <= "0100000000010000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_7; 
				 
			WHEN r2_7 =>
				 Ball_X <= "0100000000010000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_8; 
	
		   WHEN r2_8 =>
				 Ball_X <= "0001000001000000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_9; 	

		   WHEN r2_9 =>
				 Ball_X <= "0001000001000000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_10; 
			
		   WHEN r2_10 =>
				 Ball_X <= "0001000001000000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_11; 

		   WHEN r2_11 =>
				 Ball_X <= "0001000001000000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_12; 
				
		   WHEN r2_12 =>
				 Ball_X <= "0001000001000000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_13; 
				 
		   WHEN r2_13 =>
				 Ball_X <= "0001000001000000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_14; 
				 
		   WHEN r2_14 =>
				 Ball_X <= "0001000001000000";
				 Ball_Y <= "1111111111111101";
				 Player_1 <= '0';
				 Player_2 <= '0';
					 IF(player2="01110000") THEN
							nx_state <= udl1_2;
					 ELSIF(player2="11100000") THEN
					      nx_state <= l2_2;
					 ELSE
							nx_state <= winner_1;
					 END IF;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE RIGHT CASE 3--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------	
			WHEN r3_1 =>
			    Ball_X <= "0010000000010000";
				 Ball_Y <= "1011111111111111";
				Player_1 <= '0';
				 Player_2 <= '0'; 
						IF(player1="11100000") THEN
				          nx_state <= ddr1_2;
					   ELSIF(player1="00111000") THEN
							 nx_state <=udr2_2;
						ELSIF(player1="01110000") THEN
							 nx_state <= r3_2;
						ELSE
							 nx_state <= winner_2;
						END IF;
				 
		   WHEN r3_2 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_3; 
				 
		   WHEN r3_3 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_4; 
				 
		   WHEN r3_4 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_5; 

		   WHEN r3_5 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_6; 

			WHEN r3_6 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_7; 
				 
			WHEN r3_7 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_8; 
	
		   WHEN r3_8 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_9; 	

		   WHEN r3_9 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_10; 
			
		   WHEN r3_10 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_11; 

		   WHEN r3_11 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_12; 
				
		   WHEN r3_12 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_13; 
				 
		   WHEN r3_13 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_14; 

		   WHEN r3_14 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111111111101";
				 Player_1 <= '0';
				 Player_2 <= '0';
						IF(player2="11100000") THEN
							nx_state <= ddl1_2;
						ELSIF(player2="01110000")THEN
							nx_state <= l3_2;
						ELSIF(player2="00111000") THEN
							nx_state <=udl2_2;
						ELSE
							nx_state <= winner_1;
						END IF;	
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE RIGHT CASE 4--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
			WHEN r4_1 =>
			    Ball_X <= "0001000000010000";
				 Ball_Y <= "1011111111111111"; 
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_2;
				 
		   WHEN r4_2 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_3; 
				 
		   WHEN r4_3 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_4; 
				 
		   WHEN r4_4 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_5; 

		   WHEN r4_5 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_6; 

			WHEN r4_6 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_7; 
				 
			WHEN r4_7 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_8; 
	
		   WHEN r4_8 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_9; 	

		   WHEN r4_9 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_10; 
			
		   WHEN r4_10 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_11; 

		   WHEN r4_11 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_12; 
				
		   WHEN r4_12 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_13; 
				 
		   WHEN r4_13 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_14; 
				 
		   WHEN r4_14 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111111111101";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 IF(player2="00011100") THEN
				    nx_state <= udl3_2; 
				 ELSIF(player2="00111000") THEN
				    nx_state <= l4_2; 
				 ELSIF(player2="01110000") THEN
				    nx_state <= ddl2_2;
		  	    ELSE
				    nx_state <= winner_1;
				 END IF;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE RIGHT CASE 5--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
			WHEN r5_1 =>
			    Ball_X <= "0000100000001000";
				 Ball_Y <= "1011111111111111"; 
				 Player_1 <= '0';
				 Player_2 <= '0';
						IF(player1="00001110") THEN
							nx_state <= udr4_2;
				      ELSIF(player1="00011100") THEN
					      nx_state <= r5_2;
						ELSIF(player1="00111000") THEN
						   nx_state <= ddr3_2;
						ELSE
						   nx_state <= winner_2;
						END IF;
		   WHEN r5_2 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_3; 
				 
		   WHEN r5_3 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_4; 
				 
		   WHEN r5_4 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_5; 

		   WHEN r5_5 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_6; 

			WHEN r5_6 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_7; 
				 
			WHEN r5_7 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_8; 
	
		   WHEN r5_8 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_9; 	

		   WHEN r5_9 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_10; 
			
		   WHEN r5_10 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_11; 

		   WHEN r5_11 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_12; 
				
		   WHEN r5_12 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_13; 
				 
		   WHEN r5_13 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_14; 
				 
		   WHEN r5_14 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111111101";
				 Player_1 <= '0';
				 Player_2 <= '0';
						IF(player2="00001110") THEN
								nx_state <= udl4_2;
						ELSIF(player2="00011100") THEN
								nx_state <= l5_2;
						ELSIF(player2="00111000") THEN
						      nx_state <= ddl3_2;
						ELSE
								nx_state <= winner_1;
						END IF;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE RIGHT CASE 6--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
			WHEN r6_1 =>
			    Ball_X <= "0000010000000100";
				 Ball_Y <= "1011111111111111"; 
				 Player_1 <= '0';
				 Player_2 <= '0';
						IF(player1="00000111") THEN
							nx_state<=udr5_2;
						ELSIF(player1="00001110") THEN
						   nx_state<=r6_2;
						ELSIF(player1="00011100") THEN
							nx_state<=ddr4_2;
						ELSE
							nx_state <= winner_2;
						END IF;
				 
		   WHEN r6_2 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_3; 
				 
		   WHEN r6_3 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_4; 
				 
		   WHEN r6_4 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_5; 

		   WHEN r6_5 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_6; 

			WHEN r6_6 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_7; 
				 
			WHEN r6_7 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_8; 
	
		   WHEN r6_8 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_9; 	

		   WHEN r6_9 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_10; 
			
		   WHEN r6_10 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_11; 

		   WHEN r6_11 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_12; 
				
		   WHEN r6_12 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_13; 
				 
		   WHEN r6_13 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_14; 
				 
		   WHEN r6_14 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111111111101";
				 Player_1 <= '0';
				 Player_2 <= '0';
						IF(player2="00000111") THEN
							nx_state <=udl5_2;
						ELSIF(player2="00001110")THEN
							nx_state<=l6_2;
						ELSIF(player2="00011100")THEN
							nx_state<=ddl4_2;
						ELSE
							nx_state <= winner_1;
						END IF;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE RIGHT CASE 7--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
			WHEN r7_1 =>
			    Ball_X <= "0000001000000010";
				 Ball_Y <= "1011111111111111"; 
				 Player_1 <= '0';
				 Player_2 <= '0';
						IF(player1="00001110") THEN
							nx_state<=ddr5_2;
						ELSIF(player1="00000111") THEN
							nx_state <= r7_2;
						ELSE
							nx_state<=winner_2;
						END IF;
				 
		   WHEN r7_2 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_3; 
				 
		   WHEN r7_3 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_4; 
				 
		   WHEN r7_4 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_5; 

		   WHEN r7_5 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_6; 

			WHEN r7_6 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_7; 
				 
			WHEN r7_7 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_8; 
	
		   WHEN r7_8 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_9; 	

		   WHEN r7_9 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_10; 
			
		   WHEN r7_10 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_11; 

		   WHEN r7_11 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_12; 
				
		   WHEN r7_12 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_13; 
				 
		   WHEN r7_13 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_14; 
				 
		   WHEN r7_14 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111111111101";
				 Player_1 <= '0';
				 Player_2 <= '0';
						IF(player2="00001110") THEN
							nx_state<=ddl5_2;
						ELSIF(player2="00000111") THEN
							nx_state<=l7_2;
						ELSE
			            nx_state <= winner_1;
						END IF;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE LEFT CASE 2--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
		   WHEN l2_13 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1101111111111111";
		       Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_1; 
				 
		   WHEN l2_12 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l2_13; 
				 
		   WHEN l2_11 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l2_12; 

		   WHEN l2_10 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l2_11; 

			WHEN l2_9 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l2_10; 
				 
			WHEN l2_8 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1111111011111111";
				 nx_state <= l2_9; 
	
		   WHEN l2_7 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l2_8; 	

		   WHEN l2_6 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l2_7; 
			
		   WHEN l2_5 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l2_6; 

		   WHEN l2_4 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l2_5; 
				
		   WHEN l2_3 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l2_4; 
				 
		   WHEN l2_2 =>
				 Ball_X <= "0100000001000000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l2_3;
				 
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE LEFT CASE 3--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
		   WHEN l3_13 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_1; 
				 
		   WHEN l3_12 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_13; 
				 
		   WHEN l3_11 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_12; 

		   WHEN l3_10 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_11; 

			WHEN l3_9 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_10; 
				 
			WHEN l3_8 =>
				 Ball_X <= "0010000000010000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_9; 
	
		   WHEN l3_7 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_8; 	

		   WHEN l3_6 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_7; 
			
		   WHEN l3_5 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_6; 

		   WHEN l3_4 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_5; 
				
		   WHEN l3_3 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_4; 
				 
		   WHEN l3_2 =>
				 Ball_X <= "0001000000100000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l3_3; 

-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE LEFT CASE 4--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
			WHEN l4_14 =>
			    Ball_X <= "0001000000010000";
				 Ball_Y <= "1011111111111111"; 
				 Player_1 <= '0';
				 Player_2 <= '0';
					IF(player1="01110000") THEN
						nx_state <= ddr2_2;
               ELSIF(player1="00111000") THEN
						nx_state <= r4_2;
					ELSIF(player1="00011100") THEN
						nx_state<= udr3_2;
					ELSE
					   nx_state <= winner_2;
					END IF;
				 
		   WHEN l4_13 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_14; 
				 
		   WHEN l4_12 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_13; 
				 
		   WHEN l4_11 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_12; 

		   WHEN l4_10 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_11; 

			WHEN l4_9 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_10; 
				 
			WHEN l4_8 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_9; 
	
		   WHEN l4_7 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_8; 	

		   WHEN l4_6 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_7; 
			
		   WHEN l4_5 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_6; 

		   WHEN l4_4 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_5; 
				
		   WHEN l4_3 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_4; 
				 
		   WHEN l4_2 =>
				 Ball_X <= "0001000000010000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_3;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE LEFT CASE 5--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
		   WHEN l5_13 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_1; 
				 
		   WHEN l5_12 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_13; 
				 
		   WHEN l5_11 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_12; 

		   WHEN l5_10 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_11; 

			WHEN l5_9 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_10; 
				 
			WHEN l5_8 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_9; 
	
		   WHEN l5_7 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_8; 	

		   WHEN l5_6 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_7; 
			
		   WHEN l5_5 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_6; 

		   WHEN l5_4 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_5; 
				
		   WHEN l5_3 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_4; 
				 
		   WHEN l5_2 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l5_3; 
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE LEFT CASE 6--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
		   WHEN l6_13 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_1; 
				 
		   WHEN l6_12 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l6_13; 
				 
		   WHEN l6_11 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l6_12; 

		   WHEN l6_10 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l6_11; 

			WHEN l6_9 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l6_10; 
				 
			WHEN l6_8 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l6_9; 
	
		   WHEN l6_7 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l6_8; 	

		   WHEN l6_6 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l6_7; 
			
		   WHEN l6_5 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l6_6; 

		   WHEN l6_4 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l6_5; 
				
		   WHEN l6_3 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l6_4; 
				 
		   WHEN l6_2 =>
				 Ball_X <= "0000010000000100";
				 Ball_Y <= "1111111111111011";
				 nx_state <= l6_3; 
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------STRAIGHT LINE LEFT CASE 7--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
        WHEN l7_13 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_1; 
				 
		   WHEN l7_12 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_13; 
				 
		   WHEN l7_11 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_12; 

		   WHEN l7_10 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_11; 

			WHEN l7_9 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_10; 
				 
			WHEN l7_8 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_9; 
	
		   WHEN l7_7 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_8; 	

		   WHEN l7_6 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_7; 
			
		   WHEN l7_5 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_6; 

		   WHEN l7_4 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_5; 
				
		   WHEN l7_3 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_4; 
				 
		   WHEN l7_2 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l7_3; 

-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------UP DIAGONAL RIGHT CASE 1--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
         WHEN udr1_2	 =>
			    Ball_X <= "1000000000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_3;
				 
			WHEN udr1_3	=>
			    Ball_X <= "0100000000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_4;
				 
			WHEN udr1_4 =>
	          Ball_X <= "0010000000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_5;
			
			WHEN udr1_5 =>
				 Ball_X <= "0001000000000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_6;
			
	      WHEN udr1_6 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_7;
			
		   WHEN udr1_7 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_8;

		   WHEN udr1_8 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_9;
				 
		   WHEN udr1_9 =>
				 Ball_X <= "0000100000000001";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_10;
				 
			WHEN udr1_10 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_11;

			WHEN udr1_11 =>
				 Ball_X <= "0000100000000100";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_12;
					
			WHEN udr1_12 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr1_13;

			WHEN udr1_13 =>
				 Ball_X <= "0100100000010000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_14;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---		 				 
---------------------------------UP DIAGONAL RIGHT CASE 2--------------------------------------
---		 				 																							  ---
---																													  ---	
----------------------------------------------------------------------------------------------- 
         WHEN udr2_2	 =>
			    Ball_X <= "0100000000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_3;
				 
			WHEN udr2_3	=>
			    Ball_X <= "1000000000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_4;
				 
			WHEN udr2_4 =>
	          Ball_X <= "0100000000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_5;
			
			WHEN udr2_5 =>
				 Ball_X <= "0010000000000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_6;
			
	      WHEN udr2_6 =>
				 Ball_X <= "0001000000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_7;
			
		   WHEN udr2_7 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_8;

		   WHEN udr2_8 =>
				 Ball_X <= "0000100000000100";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_9;
				 
		   WHEN udr2_9 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_10;
				 
			WHEN udr2_10 =>
				 Ball_X <= "0000100000000001";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_11;

			WHEN udr2_11 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_12;
					
			WHEN udr2_12 =>
				 Ball_X <= "0000100000000100";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr2_13;

			WHEN udr2_13 =>
				 Ball_X <= "0100100000001000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_14;


-----------------------------------------------------------------------------------------------
---		 				 																							  ---
---																													  ---			 				 
---------------------------------UP DIAGONAL RIGHT CASE 3--------------------------------------
---																													  ---	
---		 				 																							  ---
----------------------------------------------------------------------------------------------- 
         WHEN udr3_2	 =>
			    Ball_X <= "0010000000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_3;
				 
         WHEN udr3_3	 =>
			    Ball_X <= "0100000000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_4;
				 
			WHEN udr3_4	=>
			    Ball_X <= "1000000000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_5;
				 
			WHEN udr3_5 =>
	          Ball_X <= "0100000000000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_6;
			
			WHEN udr3_6 =>
				 Ball_X <= "0010000000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_7;
			
	      WHEN udr3_7 =>
				 Ball_X <= "0001000000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_8;

		   WHEN udr3_8 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_9;
				 
		   WHEN udr3_9 =>
				 Ball_X <= "0000100000000100";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_10;
				 
			WHEN udr3_10 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_11;

			WHEN udr3_11 =>
				 Ball_X <= "0000100000000001";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_12;
					
			WHEN udr3_12 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr3_13;

			WHEN udr3_13 =>
				 Ball_X <= "0100100000000100";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_14;


-----------------------------------------------------------------------------------------------
---		 				 																							  ---
---																													  ---			 				 
---------------------------------UP DIAGONAL RIGHT CASE 4--------------------------------------
---																													  ---	
---		 				 																							  ---
----------------------------------------------------------------------------------------------- 
         WHEN udr4_2	 =>
			    Ball_X <= "0001000000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_3;
				 
         WHEN udr4_3	 =>
			    Ball_X <= "0010000000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_4;
				 
			WHEN udr4_4	=>
			    Ball_X <= "0100000000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_5;
				 
			WHEN udr4_5 =>
	          Ball_X <= "1000000000000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_6;
			
			WHEN udr4_6 =>
				 Ball_X <= "0100000000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_7;
			
	      WHEN udr4_7 =>
				 Ball_X <= "0010000000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_8;

		   WHEN udr4_8 =>
				 Ball_X <= "0000100000010000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_9;
				 
		   WHEN udr4_9 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_10;
				 
			WHEN udr4_10 =>
				 Ball_X <= "0100100000000100";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_11;

			WHEN udr4_11 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_12;
					
			WHEN udr4_12 =>
				 Ball_X <= "0000100000000001";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr4_13;

			WHEN udr4_13 =>
				 Ball_X <= "0100100000000010";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_14;

-----------------------------------------------------------------------------------------------
---		 				 																							  ---
---																													  ---			 				 
---------------------------------UP DIAGONAL RIGHT CASE 5--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
         WHEN udr5_2	 =>
			    Ball_X <= "0000100000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_3;
				 
         WHEN udr5_3	 =>
			    Ball_X <= "0001000000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_4;
				 
			WHEN udr5_4	=>
			    Ball_X <= "0010000000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_5;
				 
			WHEN udr5_5 =>
	          Ball_X <= "0100000000000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_6;
			
			WHEN udr5_6 =>
				 Ball_X <= "1000000000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_7;
			
	      WHEN udr5_7 =>
				 Ball_X <= "0100000000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_8;

		   WHEN udr5_8 =>
				 Ball_X <= "0100100000100000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_9;
				 
		   WHEN udr5_9 =>
				 Ball_X <= "0100100000010000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_10;
				 
			WHEN udr5_10 =>
				 Ball_X <= "0100100000001000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_11;

			WHEN udr5_11 =>
				 Ball_X <= "0000100000000100";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_12;
					
			WHEN udr5_12 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udr5_13;

			WHEN udr5_13 =>
				 Ball_X <= "0100100000000001";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_14;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------UP DIAGONAL LEFT CASE 1--------------------------------------
---																													  ---	
---		 				 																							  ---
----------------------------------------------------------------------------------------------- 
        WHEN udl1_2	 =>
			    Ball_X <= "1001000010000000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_3;
				 
			WHEN udl1_3	=>
			    Ball_X <= "1000100001000000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_4;
				 
			WHEN udl1_4 =>
	          Ball_X <= "1010000000100000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_5;
			
			WHEN udl1_5 =>
				 Ball_X <= "1000000000010000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_6;
			
	      WHEN udl1_6 =>
				 Ball_X <= "1000000000001000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_7;
			
		   WHEN udl1_7 =>
				 Ball_X <= "1000000000000100";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_8;

		   WHEN udl1_8 =>
				 Ball_X <= "0000001000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_9;
				 
		   WHEN udl1_9 =>
				 Ball_X <= "0000000100000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_10;
				 
			WHEN udl1_10 =>
				 Ball_X <= "0000001000000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_11;

			WHEN udl1_11 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_12;
					
			WHEN udl1_12 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl1_13;

			WHEN udl1_13 =>
				 Ball_X <= "0001000000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_1;
				 
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------UP DIAGONAL LEFT CASE 2--------------------------------------
---																													  ---	
---		 				 																							  ---
----------------------------------------------------------------------------------------------- 
        WHEN udl2_2	 =>
			    Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_3;
				 
			WHEN udl2_3	=>
			    Ball_X <= "1101000010000000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_4;
				 
			WHEN udl2_4 =>
	          Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_5;
			
			WHEN udl2_5 =>
				 Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_6;
			
	      WHEN udl2_6 =>
				 Ball_X <= "1101000000010000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_7;
			
		   WHEN udl2_7 =>
				 Ball_X <= "1101000000001000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_8;

		   WHEN udl2_8 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_9;
				 
		   WHEN udl2_9 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_10;
				 
			WHEN udl2_10 =>
				 Ball_X <= "0000000100000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_11;

			WHEN udl2_11 =>
				 Ball_X <= "0000001000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_12;
					
			WHEN udl2_12 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl2_13;

			WHEN udl2_13 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_14;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------UP DIAGONAL LEFT CASE 3--------------------------------------
---																													  ---	
---		 				 																							  ---
----------------------------------------------------------------------------------------------- 
        WHEN udl3_2	 =>
			    Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_3;
				 
			WHEN udl3_3	=>
			    Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_4;
				 
			WHEN udl3_4 =>
	          Ball_X <= "1101000010000000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_5;
			
			WHEN udl3_5 =>
				 Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_6;
			
	      WHEN udl3_6 =>
				 Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_7;
			
		   WHEN udl3_7 =>
				 Ball_X <= "1101000000010000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_8;

		   WHEN udl3_8 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_9;
				 
		   WHEN udl3_9 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_10;
				 
			WHEN udl3_10 =>
				 Ball_X <= "0000001000000001";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_11;

			WHEN udl3_11 =>
				 Ball_X <= "0000000100000001";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_12;
					
			WHEN udl3_12 =>
				 Ball_X <= "0000001000000001";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl3_13;

			WHEN udl3_13 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_1;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------UP DIAGONAL LEFT CASE 4--------------------------------------
---																													  ---	
---		 				 																							  ---
----------------------------------------------------------------------------------------------- 
        WHEN udl4_2	 =>
			    Ball_X <= "1101000000010000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_3;
				 
			WHEN udl4_3	=>
			    Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_4;
				 
			WHEN udl4_4 =>
	          Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_5;
			
			WHEN udl4_5 =>
				 Ball_X <= "1101000010000000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_6;
			
	      WHEN udl4_6 =>
				 Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_7;
			
		   WHEN udl4_7 =>
				 Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_8;

		   WHEN udl4_8 =>
				 Ball_X <= "0001000000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_9;
				 
		   WHEN udl4_9 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_10;
				 
			WHEN udl4_10 =>
				 Ball_X <= "0000010000000001";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_11;

			WHEN udl4_11 =>
				 Ball_X <= "0000001000000001";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_12;
					
			WHEN udl4_12 =>
				 Ball_X <= "0000000100000001";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl4_13;

			WHEN udl4_13 =>
				 Ball_X <= "0000001000000001";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_1;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------UP DIAGONAL LEFT CASE 5--------------------------------------
---																													  ---	
---		 				 																							  ---
----------------------------------------------------------------------------------------------- 
        WHEN udl5_2	 =>
			    Ball_X <= "1101000000001000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_3;
				 
			WHEN udl5_3	=>
			    Ball_X <= "1101000000010000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_4;
				 
			WHEN udl5_4 =>
	          Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_5;
			
			WHEN udl5_5 =>
				 Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_6;
			
	      WHEN udl5_6 =>
				 Ball_X <= "1101000010000000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_7;
			
		   WHEN udl5_7 =>
				 Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_8;

		   WHEN udl5_8 =>
				 Ball_X <= "0010000000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_9;
				 
		   WHEN udl5_9 =>
				 Ball_X <= "0001000000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_10;
				 
			WHEN udl5_10 =>
				 Ball_X <= "0000100000000001";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_11;

			WHEN udl5_11 =>
				 Ball_X <= "0000010000000001";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_12;
					
			WHEN udl5_12 =>
				 Ball_X <= "0000001000000001";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= udl5_13;

			WHEN udl5_13 =>
				 Ball_X <= "0000000100000001";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r7_1;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------DOWN DIAGONAL RIGHT CASE 1--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------
        WHEN ddr1_13	 =>
			    Ball_X <= "1001000010000000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_14;
				 
			WHEN ddr1_12	=>
			    Ball_X <= "1000100001000000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_13;
				 
			WHEN ddr1_11 =>
	          Ball_X <= "1010000000100000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_12;
			
			WHEN ddr1_10 =>
				 Ball_X <= "1000000000010000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_11;
			
	      WHEN ddr1_9 =>
				 Ball_X <= "1000000000001000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_10;
			
		   WHEN ddr1_8 =>
				 Ball_X <= "1000000000000100";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_9;

		   WHEN ddr1_7 =>
				 Ball_X <= "0000001000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_8;
				 
		   WHEN ddr1_6 =>
				 Ball_X <= "0000000100000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_7;
				 
			WHEN ddr1_5 =>
				 Ball_X <= "0000001000000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_6;

			WHEN ddr1_4 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_5;
					
			WHEN ddr1_3 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_4;

			WHEN ddr1_2 =>
				 Ball_X <= "0001000000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr1_3;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------DOWN DIAGONAL RIGHT CASE 2--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------			 
			WHEN ddr2_13	 =>
			    Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_14;
				 
			WHEN ddr2_12	=>
			    Ball_X <= "1101000010000000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_13;
				 
			WHEN ddr2_11 =>
	          Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_12;
			
			WHEN ddr2_10 =>
				 Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_11;
			
	      WHEN ddr2_9 =>
				 Ball_X <= "1101000000010000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_10;
			
		   WHEN ddr2_8 =>
				 Ball_X <= "1101000000001000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_9;

		   WHEN ddr2_7 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_8;
				 
		   WHEN ddr2_6 =>
				 Ball_X <= "0000001000000010";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_7;
				 
			WHEN ddr2_5 =>
				 Ball_X <= "0000000100000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_6;

			WHEN ddr2_4 =>
				 Ball_X <= "0000001000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_5;
					
			WHEN ddr2_3 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_4;

			WHEN ddr2_2 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr2_3;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------DOWN DIAGONAL RIGHT CASE 3--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------	
        WHEN ddr3_13	 =>
			    Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r4_14;
				 
			WHEN ddr3_12	=>
			    Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_13;
				 
			WHEN ddr3_11 =>
	          Ball_X <= "1101000010000000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_12;
			
			WHEN ddr3_10 =>
				 Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_11;
			
	      WHEN ddr3_9 =>
				 Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_10;
			
		   WHEN ddr3_8 =>
				 Ball_X <= "1101000000010000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_9;

		   WHEN ddr3_7 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_8;
				 
		   WHEN ddr3_6 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_7;
				 
			WHEN ddr3_5 =>
				 Ball_X <= "0000001000000001";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_6;

			WHEN ddr3_4 =>
				 Ball_X <= "0000000100000001";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_5;
					
			WHEN ddr3_3 =>
				 Ball_X <= "0000001000000001";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_4;

			WHEN ddr3_2 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr3_3;

-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------DOWN DIAGONAL RIGHT CASE 4--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------	
        WHEN ddr4_13	 =>
			    Ball_X <= "1101000000010000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_14;
				 
			WHEN ddr4_12	=>
			    Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_13;
				 
			WHEN ddr4_11 =>
	          Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_12;
			
			WHEN ddr4_10 =>
				 Ball_X <= "1101000010000000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_11;
			
	      WHEN ddr4_9 =>
				 Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_10;
			
		   WHEN ddr4_8 =>
				 Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_9;

		   WHEN ddr4_7 =>
				 Ball_X <= "0001000000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_8;
				 
		   WHEN ddr4_6 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_7;
				 
			WHEN ddr4_5 =>
				 Ball_X <= "0000010000000001";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_6;

			WHEN ddr4_4 =>
				 Ball_X <= "0000001000000001";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_5;
					
			WHEN ddr4_3 =>
				 Ball_X <= "0000000100000001";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_4;

			WHEN ddr4_2 =>
				 Ball_X <= "0000001000000001";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr4_3;

-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------DOWN DIAGONAL RIGHT CASE 5--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------	
        WHEN ddr5_13	 =>
			    Ball_X <= "1101000000001000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_14; 
				 
			WHEN ddr5_12	=>
			    Ball_X <= "1101000000010000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_13;
				 
			WHEN ddr5_11 =>
	          Ball_X <= "1101000000100000";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_12;
			
			WHEN ddr5_10 =>
				 Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_11;
			
	      WHEN ddr5_9 =>
				 Ball_X <= "1101000010000000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_10;
			
		   WHEN ddr5_8 =>
				 Ball_X <= "1101000001000000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_9;

		   WHEN ddr5_7 =>
				 Ball_X <= "0010000000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_8;
				 
		   WHEN ddr5_6 =>
				 Ball_X <= "0001000000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_7;
				 
			WHEN ddr5_5 =>
				 Ball_X <= "0000100000000001";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_6;

			WHEN ddr5_4 =>
				 Ball_X <= "0000010000000001";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_5;
					
			WHEN ddr5_3 =>
				 Ball_X <= "0000001000000001";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_4;

			WHEN ddr5_2 =>
				 Ball_X <= "0000000100000001";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddr5_3;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---
---------------------------------DOWN DIAGONAL LEFT CASE 1--------------------------------------
---																													  ---	
---		 				 																							  ---
-----------------------------------------------------------------------------------------------				 
				 
         WHEN ddl1_13	 =>
			    Ball_X <= "1000000000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r2_1;
				 
			WHEN ddl1_12	=>
			    Ball_X <= "0100000000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_13;
				 
			WHEN ddl1_11 =>
	          Ball_X <= "0010000000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_12;
			
			WHEN ddl1_10 =>
				 Ball_X <= "0001000000000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_11;
			
	      WHEN ddl1_9 =>
				 Ball_X <= "0000100000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_10;
			
		   WHEN ddl1_8 =>
				 Ball_X <= "0000010000000000";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_9;

		   WHEN ddl1_7 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_8;
				 
		   WHEN ddl1_6 =>
				 Ball_X <= "0000100000000001";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_7;
				 
			WHEN ddl1_5 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_6;

			WHEN ddl1_4 =>
				 Ball_X <= "0000100000000100";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_5;
					
			WHEN ddl1_3 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_4;

			WHEN ddl1_2 =>
				 Ball_X <= "0100100000010000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl1_3;
	
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---		 				 
---------------------------------DOWN DIAGONAL LEFT CASE 2--------------------------------------
---		 				 																							  ---
---																													  ---	
----------------------------------------------------------------------------------------------- 
         WHEN ddl2_13	 =>
			    Ball_X <= "0100000000000100";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r3_1;
				 
			WHEN ddl2_12	=>
			    Ball_X <= "1000000000000100";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_13;
				 
			WHEN ddl2_11 =>
	          Ball_X <= "0100000000001000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_12;
			
			WHEN ddl2_10 =>
				 Ball_X <= "0010000000010001";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_11;
			
	      WHEN ddl2_9 =>
				 Ball_X <= "0001000000001000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_10;
			
		   WHEN ddl2_8 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_9;

		   WHEN ddl2_7 =>
				 Ball_X <= "0000100000000100";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_8;
				 
		   WHEN ddl2_6 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_7;
				 
			WHEN ddl2_5 =>
				 Ball_X <= "0000100000000001";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_6;

			WHEN ddl2_4 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_5;
					
			WHEN ddl2_3 =>
				 Ball_X <= "0000100000000100";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_4;

			WHEN ddl2_2 =>
				 Ball_X <= "0100100000001000";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl2_3;	
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---		 				 
---------------------------------DOWN DIAGONAL LEFT CASE 3--------------------------------------
---		 				 																							  ---
---																													  ---	
----------------------------------------------------------------------------------------------- 
         WHEN ddl3_13	 =>
			    Ball_X <= "0010000000000000";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= l4_14;
				 
         WHEN ddl3_12	 =>
			    Ball_X <= "0100000000000000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_13;
				 
			WHEN ddl3_11	=>
			    Ball_X <= "1000000000000000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_12;
				 
			WHEN ddl3_10 =>
	          Ball_X <= "0100000000000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_11;
			
			WHEN ddl3_9 =>
				 Ball_X <= "0010000000000000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_10;
		
	      WHEN ddl3_8 =>
				 Ball_X <= "0001000000000100";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_9;

		   WHEN ddl3_7 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_8;
				 
		   WHEN ddl3_6 =>
				 Ball_X <= "0000100000000100";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_7;
				 
			WHEN ddl3_5 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_6;

			WHEN ddl3_4 =>
				 Ball_X <= "1000100000000001";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_5;
					
			WHEN ddl3_3 =>
				 Ball_X <= "1000100000000010";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_4;

			WHEN ddl3_2 =>
				 Ball_X <= "1100100000000100";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl3_3;
-----------------------------------------------------------------------------------------------
---																													  ---	
---		 				 																							  ---		 				 
---------------------------------DOWN DIAGONAL LEFT CASE 4--------------------------------------
---		 				 																							  ---
---																													  ---	
----------------------------------------------------------------------------------------------- 
         WHEN ddl4_13	 =>
			    Ball_X <= "0001000000000010";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r5_1;
				 
         WHEN ddl4_12	 =>
			    Ball_X <= "0010000000000000";
				 Ball_Y <= "1110111111110011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_13;
				 
			WHEN ddl4_11	=>
			    Ball_X <= "0100000000001000";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_12;
				 
			WHEN ddl4_10 =>
	          Ball_X <= "1000000000000000";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_11;
			
			WHEN ddl4_9 =>
				 Ball_X <= "0100000000000100";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_10;
			
	      WHEN ddl4_8 =>
				 Ball_X <= "0010000000000100";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_9;

		   WHEN ddl4_7 =>
				 Ball_X <= "0000100000010000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_8;
				 
		   WHEN ddl4_6 =>
				 Ball_X <= "0000100000001000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_7;
				 
			WHEN ddl4_5 =>
				 Ball_X <= "0100100000000100";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_6;

			WHEN ddl4_4 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_5;
					
			WHEN ddl4_3 =>
				 Ball_X <= "0100100000000001";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_4;

			WHEN ddl4_2 =>
				 Ball_X <= "0100100000000010";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl4_3;

-------------------------------------------------------------------------------------------------
-----																													  ---	
-----		 				 																							  ---		 				 
-----------------------------------DOWN DIAGONAL LEFT CASE 5--------------------------------------
-----		 				 																							  ---
-----																													  ---	
------------------------------------------------------------------------------------------------- 
         WHEN ddl5_13	 =>
			    Ball_X <= "0000100000000100";
				 Ball_Y <= "1101111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= r6_1;
				 
         WHEN ddl5_12	 =>
			    Ball_X <= "0001000000010000";
				 Ball_Y <= "1110111111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_13;
				 
			WHEN ddl5_11	=>
			    Ball_X <= "0010000000000100";
				 Ball_Y <= "1111011111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_12;
				 
			WHEN ddl5_10 =>
	          Ball_X <= "0100000000000100";
				 Ball_Y <= "1111101111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_11;
			
			WHEN ddl5_9 =>
				 Ball_X <= "1000000000001000";
				 Ball_Y <= "1111110111111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_10;
			
	      WHEN ddl5_8 =>
				 Ball_X <= "0100000000000100";
				 Ball_Y <= "1111111011111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_9;

		   WHEN ddl5_7 =>
				 Ball_X <= "0100100000100000";
				 Ball_Y <= "1111111101111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_8;
				 
		   WHEN ddl5_6 =>
				 Ball_X <= "0100100000010000";
				 Ball_Y <= "1111111110111111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_7;
				 
			WHEN ddl5_5 =>
				 Ball_X <= "0100100000001000";
				 Ball_Y <= "1111111111011111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_6;

			WHEN ddl5_4 =>
				 Ball_X <= "0000100000000100";
				 Ball_Y <= "1111111111101111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_5;
					
			WHEN ddl5_3 =>
				 Ball_X <= "0000100000000010";
				 Ball_Y <= "1111111111110111";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_4;

			WHEN ddl5_2 =>
				 Ball_X <= "0100100000000001";
				 Ball_Y <= "1111111111111011";
				 Player_1 <= '0';
				 Player_2 <= '0';
				 nx_state <= ddl5_3;
				 
		  WHEN OTHERS => NULL;
		END CASE;
	END PROCESS;
END ARCHITECTURE;
