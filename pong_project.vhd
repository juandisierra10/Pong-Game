LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------------------------------
ENTITY pong_project IS

	PORT	( clk								: IN  STD_LOGIC;
			  rst								: IN  STD_LOGIC;
			  UpButton_Player1		   : IN 	STD_LOGIC;
			  DownButton_Player_1		: IN  STD_LOGIC;
			  UpButton_Player2         : IN  STD_LOGIC;
			  DownButton_Player_2      : IN  STD_LOGIC;
			  LEDS							: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);-----To confirm movements
			  X_Player1    			   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0); ----Player 1 Columns (GND)
		     Y_Player1     				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0); ----Player 1 Rows (Vcc)
			  X_Player2   				   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0); ----Player 2 Columns (GND)
			  Y_Player2     				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0); ----Player 2 Rows (Vcc)
			  Score_Player_1           : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
			  Score_Div                : OUT STD_LOGIC;							 ------Point Separating scores
			  Score_Player_2           : OUT STD_LOGIC_VECTOR (13 DOWNTO 0));

END ENTITY;

-----------------------------------------------------------------------------------
ARCHITECTURE game OF pong_project IS

			SIGNAL  max_tick_racket_1,max_tick_racket_2	      		:    STD_LOGIC;
			SIGNAL  clk_racket_1,clk_racket_2,clk_print              :    STD_LOGIC;   ----Clocks for rackets and printing
			SIGNAL  player_1, player_2  									   :    STD_LOGIC_VECTOR (7 DOWNTO 0); --------Rackets positions
			SIGNAL  columns_total,rows_total                    		:    STD_LOGIC_VECTOR (15 DOWNTO 0);
			SIGNAL  points_player_1, points_player_2                 :    STD_LOGIC;
			SIGNAL  score_total_1,score_total_2								:    STD_LOGIC_VECTOR(3 DOWNTO 0);
			SIGNAL  rst_score_1,rst_score_2									:    STD_LOGIC;
			SIGNAL  max_tick_1,max_tick_2,enable							:    STD_LOGIC;
			SIGNAL  clk_ball_1,clk_ball_2,clk_ball_3,clk_ball_4      :    STD_LOGIC;
			SIGNAL  enable_ball													:    STD_LOGIC;

			
BEGIN
    
		  LEDS <= "00" WHEN UpButton_Player1 = '0' AND DownButton_Player_1 ='0' ELSE
					 "11";
		  Score_Div<= '0';
	
	--------------------Clock for the movement of racket 1---------------
	Racket1_Movement: ENTITY work.univ_bin_counter
	GENERIC MAP (N	=> 23)
	PORT MAP ( clk		=>  clk,
				  rst    =>  rst,
				  ena    =>  '1',
				  max_tick => max_tick_racket_1);
				  
	--------------------Clock for the movement of racket 2---------------
	Racket2_Movement: ENTITY work.univ_bin_counter
	GENERIC MAP (N	=> 23)
	PORT MAP ( clk		=>  clk,
				  rst    =>  rst,
				  ena    =>  '1',
				  max_tick => max_tick_racket_2);
	
	clk_racket_1 <= max_tick_racket_1;
	clk_racket_2 <= max_tick_racket_2;
	
	-----------------Clock to print the game--------------------
	Game_Movement: ENTITY work.univ_bin_counter_2
	GENERIC MAP (N	=> 23)
	PORT MAP ( clk		=>  clk,
				  rst    =>  rst,
				  ena    =>  '1',
				  max_tick => clk_print);
	
   --------------------Clock for the movement of ball---------------
	Ball_Clock_1: ENTITY work.univ_bin_counter_3
	GENERIC MAP (N	=> 25)
	PORT MAP ( clk		=>  clk,
				  rst    =>  rst,
				  ena    =>  '1',
				  max_tick => clk_ball_1);

   --------------------Clock for the movement of ball---------------
	Ball_Clock_2: ENTITY work.univ_bin_counter_4
	GENERIC MAP (N	=> 25)
	PORT MAP ( clk		=>  clk,
				  rst    =>  rst,
				  ena    =>  '1',
				  max_tick => clk_ball_2);

   --------------------Clock for the movement of ball---------------
	Ball_Clock_3: ENTITY work.univ_bin_counter_5
	GENERIC MAP (N	=> 25)
	PORT MAP ( clk		=>  clk,
				  rst    =>  rst,
				  ena    =>  '1',
				  max_tick => clk_ball_3);

   --------------------Clock for the movement of ball---------------
	Ball_Clock_4: ENTITY work.univ_bin_counter_6
	GENERIC MAP (N	=> 25)
	PORT MAP ( clk		=>  clk,
				  rst    =>  rst,
				  ena    =>  '1',
				  max_tick => clk_ball_4);
	
	
	------------Movement of the racket of the first player----------
   Racket_Player_1: ENTITY work.racket 
	PORT MAP(  clk		       =>     clk_racket_1,
				  rst           =>     rst,
				  Up            =>     UpButton_Player1,
				  Down          =>     DownButton_Player_1,
				  Racket_Player =>     player_1);
	
-------------------Movement of the racket of the second player---------	
	Racket_Player_2: ENTITY work.racket 
	PORT MAP(  clk		       =>     clk_racket_2,
				  rst           =>     rst,
				  Up            =>     UpButton_Player2,
				  Down          =>     DownButton_Player_2,
				  Racket_Player =>     player_2);
	
	--------------Print game on both matrix--------------------
	Print: ENTITY work.print_matrix
	PORT MAP (  clk			    =>    clk_print,
					rst             =>    rst,
					racket_player_1 =>    player_1,
					racket_player_2 =>    player_2,
					ball_position_x =>    columns_total,
					ball_position_y =>    rows_total,
					rows_1			 =>    Y_Player1,
					rows_2          =>    Y_Player2,
					columns_1       =>    X_Player1,
					columns_2       =>    X_Player2);
	
	-------------Movement of the ball-----------
   Ball_Movement: ENTITY work.ball
   PORT MAP	(	clk       => clk,
					en_ball   => enable_ball,
	            rst       =>  rst,						
					player1   => player_1,
					player2   => player_2,
					score_1   => points_player_1,
					score_2   => points_player_2,	
					Ball_X_r  => columns_total,
					Ball_Y_r  => rows_total);
	
	enable_ball <= clk_ball_1 WHEN ((score_total_1="0000")AND(score_total_2="0000")) ELSE
						clk_ball_2 WHEN (((score_total_1="0001")AND(score_total_2="0000"))OR((score_total_1="0000")AND(score_total_2="0001"))) ELSE
						clk_ball_3 WHEN (((score_total_1="0010")AND(score_total_2="0000"))OR((score_total_1="0000")AND(score_total_2="0010"))OR ((score_total_1="0001")AND(score_total_2="0001"))) ELSE
					   clk_ball_4;
	-----------------------Reset when a player scores 3 points-----------------
					
	rst_score_1 <= '1' WHEN ((score_total_1="0011")OR(score_total_2="0011")) ELSE
						rst;
						
	rst_score_2 <= '1' WHEN ((score_total_1="0011")OR(score_total_2="0011")) ELSE
						rst;
	
					
	--------------Points Player 1-------------------
	Points_P1: ENTITY work.counter_DFF
	PORT MAP (	clk		=> points_player_1,
					rst		=> rst_score_1,
					ena      => '1',
					counter  => score_total_1);

	--------------Points Player 2-------------------
	Points_P2: ENTITY work.counter_DFF
	PORT MAP (	clk		=> points_player_2,
					rst		=> rst_score_2,
					ena      => '1',
					counter  => score_total_2);
  
	--------------Score Player 1-------------------
	Score_P1: ENTITY work.bin_to_sseg
	PORT MAP (	bin => score_total_1,
					sseg => Score_Player_1);
					
	--------------Score Player 2-------------------
	Score_P2: ENTITY work.bin_to_sseg
	PORT MAP (	bin => score_total_2,
					sseg => Score_Player_2);
					
END ARCHITECTURE;
			  
			  