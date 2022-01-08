(deftemplate rule

(multislot if)

(multislot then))

(defrule data-input

(initial-fact)

=>

(printout t crlf "What number of players? ")
(bind ?players(read))
(assert (players ?players))

  (printout t crlf)
  (printout t
  "Choose a number of command:" crlf
  "     1) 2" crlf
  "     2) more." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?command(read))
(assert (command ?command))

  (printout t crlf)
  (printout t
  "Can you go with ball:" crlf
  "     1) Yes" crlf
  "     2) No" crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?attack(read))
(assert (attack ?attack))

  (printout t crlf)
  (printout t
  "Its a game with ball:" crlf
  "     1) Yes" crlf
  "     2) No." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?count(read))
(assert (count ?count))

(printout t crlf "What number of players in team? ")
(bind ?team(read))
(assert (team ?team))

  (printout t crlf)
  (printout t
  "Its a game with bat:" crlf
  "     1) Yes" crlf
  "     2) No." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?bat(read))
(assert (bat ?bat))

  (printout t crlf)
  (printout t
  "Where place of this game:" crlf
  "     1) inside" crlf
  "     2) outside." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?place(read))
(assert (place ?place))

  (printout t crlf)
  (printout t
  "This game with wooden hammer:" crlf
  "     1) yes" crlf
  "     2) no." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?hammer(read))
(assert (hammer ?hammer))

  (printout t crlf)
  (printout t
  "In this game, the ball is round:" crlf
  "     1) yes" crlf
  "     2) no." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?round(read))
(assert (round ?round))

  (printout t crlf)
  (printout t
  "In this game, the ball is solid:" crlf
  "     1) yes" crlf
  "     2) no." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?solid(read))
(assert (solid ?solid))

  (printout t crlf)
  (printout t
  "Is a racket used in this game:" crlf
  "     1) yes" crlf
  "     2) no." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?racket(read))
(assert (racket ?racket))

  (printout t crlf)
  (printout t
  "This game is played sitting down:" crlf
  "     1) yes" crlf
  "     2) no." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?sitting(read))
(assert (sitting ?sitting))

  (printout t crlf)
  (printout t
  "This game uses cards:" crlf
  "     1) yes" crlf
  "     2) no." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?cards(read))
(assert (cards ?cards))

  (printout t crlf)
  (printout t
  "This game uses a board:" crlf
  "     1) yes" crlf
  "     2) no." crlf 
  "     3) Skip." crlf 
  "Choice: " )
(bind ?board(read))
(assert (board ?board)))

(defrule R1
(count ?count)
(command ?command)
(team ?team)
(players ?players)
(attack ?attack)
(test (and (eq ?count 1) (eq ?command 1) (> ?team 2) (eq ?players 15) (eq ?attack 1)))
=>
(printout t crlf crlf "Scotland football" crlf))

(defrule R2
(count ?count)
(command ?command)
(team ?team)
(players ?players)
(bat ?bat)

(test (and (eq ?count 1) (eq ?command 1) (> ?team 2) (eq ?players 11) (eq ?bat 1)))
=>
(printout t crlf crlf "Cricket" crlf))

(defrule R3
(count ?count)
(command ?command)
(team ?team)
(players ?players)
(test (and (eq ?count 1) (eq ?command 1) (> ?team 2) (eq ?players 5)))
=>
(printout t crlf crlf "Basketball" crlf))

(defrule R4
(count ?count)
(command ?command)
(team ?team)
(place ?place)
(hummer ?hummer)
(test (and (eq ?count 1) (eq ?command 2) (> ?team 2) (eq ?place 1)  (eq ?hummer 1)))
=>
(printout t crlf crlf "Croquet" crlf))

(defrule R5
(count ?count)
(command ?command)
(team ?team)
(players ?players)
(command ?command)
(round ?round)
(solid ?solid)
(test (and (eq ?count 1) (eq ?command 2) (> ?team 2) (eq ?players 11) (eq ?round 2) (eq ?solid 1)))
=>
(printout t crlf crlf "Skittles" crlf))

(defrule R6
(count ?count)
(racket ?racket)
(test (and (eq ?count 2) (eq ?racket 1)))
=>
(printout t crlf crlf "badminton" crlf))

(defrule R7
(count ?count)
(sitting ?sitting)
(cards ?cards)
(board ?board)
(test (and (eq ?count 2) (eq ?sitting 1) (eq ?cards 2) (eq ?board 1)))
=>
(printout t crlf crlf "Table games" crlf))

