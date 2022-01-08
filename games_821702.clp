(deftemplate game
   (slot is_ball_used)
   (slot count_of_players_in_team)
   (slot two_teams_with_players_count_more_than_2_in_each)
   (slot is_it_allowed_to_forward_ball)
   (slot is_ball_round)
   (slot is_ball_hard)
   (slot is_ball_solid)
   (slot is_game_played_inside)
   (slot is_wooden_molotok_used)
   (slot is_game_played_sitting)
   (slot is_raketka_used)
   (slot game_name)
)

(deffacts game_instance
    (game
	     (is_ball_used nil)
		 (count_of_players_in_team nil)
		 (two_teams_with_players_count_more_than_2_in_each nil)
		 (is_it_allowed_to_forward_ball nil)
		 (is_ball_round nil)
		 (is_ball_hard nil)
		 (is_ball_solid nil)
		 (is_game_played_inside nil)
		 (is_wooden_molotok_used nil)
		 (is_game_played_sitting nil)
		 (is_raketka_used nil)
	)
)

(deffunction ask-yes-or-no (?question)
   (printout t ?question " (yes or no) ")
   (bind ?answer (read))
   (while (and (neq ?answer yes) (neq ?answer no))
      (printout t ?question " (yes or no) ")
      (bind ?answer (read)))
   (return ?answer))
   
(deffunction ask-number (?question)
   (printout t ?question " (enter number) ")
   (bind ?answer (read))
   (return ?answer))
   
(defrule is_ball_used_q
    ?p <- (game (is_ball_used nil))
	=>
	(modify ?p (is_ball_used (ask-yes-or-no "Is ball used in the game?")))
)

(defrule count_of_players_in_team_q
    ?p <- (game (count_of_players_in_team nil))
		(not (is_ball_used nil))
	=>
	(modify ?p (count_of_players_in_team (ask-number "How many people in each team?")))
)

(defrule two_teams_with_players_count_more_than_2_in_each_q
    ?p <- (game (two_teams_with_players_count_more_than_2_in_each nil))
		(not (is_ball_used nil))
		(not (count_of_players_in_team nil))
	=>
	(modify ?p (two_teams_with_players_count_more_than_2_in_each (ask-yes-or-no "Are two teams used with more than 2 people in each one?")))
)

(defrule is_it_allowed_to_forward_ball_q
    ?p <- (game (is_it_allowed_to_forward_ball nil))
		(not (is_ball_used nil))
		(not (count_of_players_in_team nil))
		(not (two_teams_with_players_count_more_than_2_in_each nil))
	=>
	(modify ?p (is_it_allowed_to_forward_ball (ask-yes-or-no "Is it allowed to forward the ball?")))
)

(defrule is_ball_round_q
    ?p <- (game (is_ball_round nil))
		(not (is_ball_used nil))
		(not (count_of_players_in_team nil))
		(not (two_teams_with_players_count_more_than_2_in_each nil))
		(not (is_it_allowed_to_forward_ball nil))
	=>
	(modify ?p (is_ball_round (ask-yes-or-no "Is ball round?")))
)

(defrule is_ball_hard_q
    ?p <- (game (is_ball_hard nil))
		(not (is_ball_used nil))
		(not (count_of_players_in_team nil))
		(not (two_teams_with_players_count_more_than_2_in_each nil))
		(not (is_it_allowed_to_forward_ball nil))
		(not (is_ball_round nil))
	=>
	(modify ?p (is_ball_hard (ask-yes-or-no "Is ball hard?")))
)

(defrule is_ball_solid_q
    ?p <- (game (is_ball_solid nil))
		(not (is_ball_used nil))
		(not (count_of_players_in_team nil))
		(not (two_teams_with_players_count_more_than_2_in_each nil))
		(not (is_it_allowed_to_forward_ball nil))
		(not (is_ball_round nil))
		(not (is_ball_hard nil))
	=>
	(modify ?p (is_ball_solid (ask-yes-or-no "Is ball solid?")))
)

(defrule is_game_played_inside_q
    ?p <- (game (is_game_played_inside nil))
		(not (is_ball_used nil))
		(not (count_of_players_in_team nil))
		(not (two_teams_with_players_count_more_than_2_in_each nil))
		(not (is_it_allowed_to_forward_ball nil))
		(not (is_ball_round nil))
		(not (is_ball_hard nil))
		(not (is_ball_solid nil))
	=>
	(modify ?p (is_game_played_inside (ask-yes-or-no "Is game played inside?")))
)

(defrule is_wooden_molotok_used_q
    ?p <- (game (is_wooden_molotok_used nil))
		(not (is_ball_used nil))
		(not (count_of_players_in_team nil))
		(not (two_teams_with_players_count_more_than_2_in_each nil))
		(not (is_it_allowed_to_forward_ball nil))
		(not (is_ball_round nil))
		(not (is_ball_hard nil))
		(not (is_ball_solid nil))
		(not (is_game_played_inside nil))
	=>
	(modify ?p (is_wooden_molotok_used (ask-yes-or-no "Is wooden molotok used?")))
)

(defrule is_game_played_sitting_q
    ?p <- (game (is_game_played_sitting nil))
		(not (is_ball_used nil))
		(not (count_of_players_in_team nil))
		(not (two_teams_with_players_count_more_than_2_in_each nil))
		(not (is_it_allowed_to_forward_ball nil))
		(not (is_ball_round nil))
		(not (is_ball_hard nil))
		(not (is_ball_solid nil))
		(not (is_game_played_inside nil))
		(not (is_wooden_molotok_used nil))
	=>
	(modify ?p (is_game_played_sitting (ask-yes-or-no "Is game played sitting?")))
)

(defrule is_raketka_used_q
    ?p <- (game (is_raketka_used nil))
		(not (is_ball_used nil))
		(not (count_of_players_in_team nil))
		(not (two_teams_with_players_count_more_than_2_in_each nil))
		(not (is_it_allowed_to_forward_ball nil))
		(not (is_ball_round nil))
		(not (is_ball_hard nil))
		(not (is_ball_solid nil))
		(not (is_game_played_inside nil))
		(not (is_wooden_molotok_used nil))
		(not (is_game_played_sitting nil))
	=>
	(modify ?p (is_raketka_used (ask-yes-or-no "Is raketka used?")))
)

(defrule game_baseball
    ?a <- (game (is_ball_used yes)
		(two_teams_with_players_count_more_than_2_in_each yes)
		(count_of_players_in_team 9)
		(game_name nil))
    =>
    (printout t "The game is baseball")
    (modify ?a (game_name baseball))
)

(defrule game_regby
    ?a <- (game (is_ball_used yes)
		(two_teams_with_players_count_more_than_2_in_each yes)
		(count_of_players_in_team 15)
		(is_it_allowed_to_forward_ball no)
		(game_name nil))
    =>
    (printout t "The game is regby")
    (modify ?a (game_name regby))
)

(defrule game_european_foothbal
    ?a <- (game (is_ball_used yes)
		(two_teams_with_players_count_more_than_2_in_each yes)
		(count_of_players_in_team 11)
		(is_ball_round yes)
		(is_ball_hard no)
		(game_name nil))
    =>
    (printout t "The game is european foothbal")
    (modify ?a (game_name european_foothbal))
)

(defrule game_golf
    ?a <- (game (is_ball_used yes)
		(two_teams_with_players_count_more_than_2_in_each no)
		(is_ball_round yes)
		(is_game_played_inside no)
		(is_wooden_molotok_used no)
		(is_ball_solid yes)
		(game_name nil))
    =>
    (printout t "The game is golf")
    (modify ?a (game_name golf))
)

(defrule game_tennis
    ?a <- (game (is_ball_used yes)
		(two_teams_with_players_count_more_than_2_in_each no)
		(is_game_played_inside no)
		(is_ball_round no)
		(game_name nil))
    =>
    (printout t "The game is tennis")
    (modify ?a (game_name tennis))
)

(defrule game_billiard
    ?a <- (game (is_ball_used yes)
		(two_teams_with_players_count_more_than_2_in_each no)
		(is_ball_round yes)
		(is_game_played_inside yes)
		(count_of_players_in_team 11)
		(is_ball_solid yes)
		(game_name nil))
    =>
    (printout t "The game is billiard")
    (modify ?a (game_name billiard))
)

(defrule game_strelki
    ?a <- (game (is_ball_used no)
		(is_game_played_sitting no)
		(is_raketka_used no)
		(is_game_played_inside yes)
		(game_name nil))
    =>
    (printout t "The game is strelki")
    (modify ?a (game_name strelki))
)