(deftemplate rule
(multislot if)
(multislot then))

(defrule data-input
(initial-fact)
=>
(printout t crlf "Do you need ball? ")
(bind ?ball(read))
(assert (ball ?ball))

(printout t crlf "Is it a team where more then 2 player? ")
(bind ?team(read))
(assert (team ?team))

(printout t crlf "Is the ball round? ")
(bind ?round(read))
(assert (round ?round))

(printout t crlf "Is the ball strong? ")
(bind ?strong(read))
(assert (strong ?strong))


(printout t crlf "Is the ball solid? ")
(bind ?solid(read))
(assert (solid ?solid))

(printout t crlf "How many people we need in one team? ")
(bind ?count(read))
(assert (count ?count))

(printout t crlf "Is this game play in room? ")
(bind ?room(read))
(assert (room ?room))

(printout t crlf "Kharakteristiks of the game ")
(bind ?kharakteristiks(read))
(assert (kharakteristiks ?kharakteristiks))

(printout t crlf "Do we need to sit ")
(bind ?sit(read))
(assert (sit ?sit)))

(defrule R1
(ball ?ball)
(team ?team)
(round ?round)
(strong ?strong)
(solid ?solid)
(count ?count)
(room ?room)
(kharakteristiks ?kharakteristiks)
(sit ?sit)

(test (and (eq ?ball yes) (eq ?team yes) (= ?count 9)))

=>
(printout t crlf crlf "This is baseball" crlf))

(defrule R2
(ball ?ball)
(team ?team)
(round ?round)
(strong ?strong)
(solid ?solid)
(count ?count)
(room ?room)
(kharakteristiks ?kharakteristiks)
(sit ?sit)

(test (and (eq ?ball yes) (eq ?team yes) (= ?count 15) (eq ?kharakteristiks forward)))

=>
(printout t crlf crlf "This is regbi" crlf))

(defrule R3
(ball ?ball)
(team ?team)
(round ?round)
(strong ?strong)
(solid ?solid)
(count ?count)
(room ?room)
(kharakteristiks ?kharakteristiks)
(sit ?sit)

(test (and (eq ?ball yes) (eq ?team yes) (= ?count 11 ) (eq ?round yes) (eq ?strong no)))

=>
(printout t crlf crlf "This is europian football" crlf))

(defrule R4
(ball ?ball)
(team ?team)
(round ?round)
(strong ?strong)
(solid ?solid)
(count ?count)
(room ?room)
(kharakteristiks ?kharakteristiks)
(sit ?sit)

(test (and (eq ?ball yes) (eq ?team no)  (eq ?round yes) (eq ?solid yes) (eq ?room no) (eq ?kharakteristiks nowoodenhammer)))

=>
(printout t crlf crlf "This is golf" crlf))

(defrule R5
(ball ?ball)
(team ?team)
(round ?round)
(strong ?strong)
(solid ?solid)
(count ?count)
(room ?room)
(kharakteristiks ?kharakteristiks)
(sit ?sit)

(test (and (eq ?ball yes) (eq ?team no) (eq ?room no) (eq ?kharakteristiks no)))

=>
(printout t crlf crlf "This is tennis" crlf))

(defrule R6
(ball ?ball)
(team ?team)
(round ?round)
(strong ?strong)
(solid ?solid)
(count ?count)
(room ?room)
(kharakteristiks ?kharakteristiks)
(sit ?sit)

(test (and (eq ?ball yes) (eq ?team no)  (eq ?round yes) (eq ?solid yes) (eq ?room yes) (= ?count 11)))


=>
(printout t crlf crlf "This is biliard" crlf))

(defrule R7
(ball ?ball)
(team ?team)
(round ?round)
(strong ?strong)
(solid ?solid)
(count ?count)
(room ?room)
(kharakteristiks ?kharakteristiks)
(sit ?sit)

(test (and (eq ?ball no) (eq ?kharakteristiks noracket) (eq ?room yes)  (eq ?sit no)))


=>
(printout t crlf crlf "This is Strelki" crlf))

