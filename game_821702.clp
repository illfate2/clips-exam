(deftemplate rule

(multislot if)

(multislot then))

(defrule data-input

(initial-fact)

=>
(printout t crlf "Is it the game with ball? ")
(bind ?ball(read))
(assert (ball ?ball))

(printout t crlf "Is it two team game? ")
(bind ?team(read))
(assert (team ?team))

(printout t crlf "How much players in game? ")
(bind ?players(read))
(assert (players ?players))

(printout t crlf "Is ball round? ")
(bind ?round(read))
(assert (round ?round))

(printout t crlf "Is ball solid? ")
(bind ?solid(read))
(assert (solid ?solid))

(printout t crlf "Have the game bit? ")
(bind ?bit(read))
(assert (bit ?bit))

(printout t crlf "Is it game in the room? ")
(bind ?room(read))
(assert (room ?room))

(printout t crlf "Have the game rocket? ")
(bind ?rocket(read))
(assert (rocket ?rocket)))

(defrule R1
(ball ?ball)
(team ?team)
(players ?players)

(test (and (eq ?ball yes) (eq ?team yes) (= ?players 13)))

=>
(printout t crlf crlf "Recomended club rugby" crlf))

(defrule R2
(ball ?ball)
(team ?team)
(players ?players)
(bit ?bit)

(test (and (eq ?ball yes) (eq ?team yes) (= ?players 11) (eq ?bit no)))

=>
(printout t crlf crlf "Recomended hockey" crlf))

(defrule R3
(ball ?ball)
(team ?team)
(players ?players)
(round ?round)

(test (and (eq ?ball yes) (eq ?team yes) (= ?players 11) (eq ?round no)))

=>
(printout t crlf crlf "Recomended american football" crlf))

(defrule R4
(ball ?ball)
(team ?team)
(players ?players)
(rocket ?rocket)

(test (and (eq ?ball yes) (eq ?team no) (> ?players 1) (eq ?rocket yes)))

=>
(printout t crlf crlf "Recomended table tennis" crlf))

(defrule R5
(ball ?ball)
(team ?team)
(players ?players)
(room ?room)
(rocket ?rocket)
(solid ?solid)

(test (and (eq ?ball yes) (eq ?team no) (> ?players 1) (eq ?room no) (eq ?solid no) (eq ?rocket yes)))

=>
(printout t crlf crlf "Recomended skvosh" crlf))

(defrule R6
(ball ?ball)
(team ?team)
(players ?players)
(bit ?bit)
(rocket ?rocket)
(solid ?solid)

(test (and (eq ?ball yes) (eq ?team no) (= ?players 11) (eq ?bit no) (eq ?solid no) (eq ?rocket no)))

=>
(printout t crlf crlf "Recomended pelota" crlf))

(defrule R7
(ball ?ball)
(players ?players)

(test (and (eq ?ball no) (> ?players 1)))

=>
(printout t crlf crlf "Recomended bridge" crlf))
