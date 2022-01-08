(deftemplate rule

(multislot if)

(multislot then))

(defrule data-input

(initial-fact)

=>
(printout t crlf "what mark do yu have in phisics?")
(bind ?phisics(read))
(assert (phisics ?phisics))

(printout t crlf "what mark do yu have in chemistry? ")
(bind ?chemistry(read))
(assert (chemistry ?chemistry))

(printout t crlf "what mark do yu have in math? ")
(bind ?math(read))
(assert (math ?math))

(printout t crlf "what mark do yu have in biology? ")
(bind ?biology(read))
(assert (biology ?biology))

(printout t crlf "what mark do yu have in english? ")
(bind ?english(read))
(assert (english ?english))

(printout t crlf "what mark do yu have in french? ")
(bind ?french(read))
(assert (french ?french))

(printout t crlf "what mark do yu have in economy?")
(bind ?economy(read))
(assert (economy ?economy))

(printout t crlf "what mark do yu have in history? ")
(bind ?history(read))
(assert (history ?history))

(printout t crlf "what mark do yu have in geography? ")
(bind ?geography(read))
(assert (geography ?geography))

(printout t crlf "what mark do yu have in art? ")
(bind ?art(read))
(assert (art ?art)))


(defrule R1
(phisics ?phisics)
(math ?math)

(test (and (> ?phisics 9) (> ?math 9)))

=>
(printout t crlf crlf "become an explorer" crlf))

(defrule R2
(math ?math)
(phisics ?phisics)

(test (or (< ?math 5) (< ?phisics 5)))

=>
(printout t crlf crlf "dont become an explorer" crlf))

(defrule R3
(art ?art)
(math ?math)

(test (and (> ?art 7) (> ?math 5)))

=>
(printout t crlf crlf "become an architect" crlf))

(defrule R4
(math ?math)
(economy ?economy)

(test (and (> ?math 5) (> ?economy 7)))

=>
(printout t crlf crlf "become an accountant" crlf))

(defrule R5
(math ?math)
(economy ?economy)
(english ?english)


(test (and (< ?math 5) (eq ?english 7) (eq ?economy 7)))

=>
(printout t crlf crlf "become a politician" crlf))

(defrule R6
(biology ?biology)
(math ?math)
(economy ?economy)
(phisics ?phisics)


(test (and (> ?biology 7) (> ?math 5) (> ?economy 5) (> ?phisics 5)))

=>
(printout t crlf crlf "become a medic" crlf))

(defrule R7
(english ?english)
(french ?french)
(art ?art)
(history ?history)


(test (and (eq ?english 9) (> ?history 3) (> ?art 3) (> ?french 5)))

=>
(printout t crlf crlf "become a lawyer" crlf))



