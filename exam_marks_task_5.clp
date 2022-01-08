

(deftemplate subject
    (slot type (type SYMBOL) (allowed-values math chemistry physics english french biology economy history geography art))
    (slot mark )
)


(deffunction lowest ($?values)
   (switch (length$ ?values)
      (case 0 then (return))
      (case 1 then (return (nth$ 1 ?values)))
      (default (return (min (expand$ ?values))))))

(deffunction average ($?values)
    (bind ?sum 0)
    (foreach ?v $?values
        (bind ?sum (+ ?sum ?v))
    )
    (bind ?len (length$ ?values))
    (return (/ ?sum ?len))
)

(deffunction ask-number (?question)
   (printout t ?question " (enter number) ")
   (bind ?answer (read))
   (while (not (and (> ?answer 0)(< ?answer 6)))
     (printout t ?question " (enter number) ")
     (bind ?answer (read))
   )
   (return ?answer))
   

(defrule math
  =>
  (assert (subject(type math) (mark (ask-number "What's math mark?" ))))
 )

(defrule physics
  =>
  (assert (subject(type physics) (mark (ask-number "What's physics mark?" ))))
)


(defrule chemistry
  =>
  (assert (subject(type chemistry) (mark (ask-number "What's chemistry mark?" ))))
)



(defrule english
  =>
  (assert (subject(type english) (mark (ask-number "What's english mark?" ))))
)


(defrule french
  =>
  (assert (subject(type french) (mark (ask-number "What's french mark?" ))))
)


(defrule biology
  =>
  (assert (subject(type biology) (mark (ask-number "What's biology mark?" ))))
)


(defrule economy
  =>
  (assert (subject(type economy) (mark (ask-number "What's economy mark?" ))))
)

(defrule history
  =>
  (assert (subject(type history) (mark (ask-number "What's history mark?" ))))
)


(defrule geography
  =>
  (assert (subject(type geography) (mark (ask-number "What's geography mark?" ))))
)


(defrule art
  =>
  (assert (subject(type art) (mark (ask-number "What's art mark?" ))))
)

(defrule researcher-recomendation
?math <- (subject (type math))
?physics <- (subject (type physics))
(test (eq (fact-slot-value ?math mark) 5))
(test (eq (fact-slot-value ?physics mark) 5))
=>
(printout t "recommend researcher" crlf)
)

(defrule researcher-non-recomendation
?math <- (subject (type math))
?physics <- (subject (type physics))
=>
(if (or (< (fact-slot-value ?math mark) 3) (< (fact-slot-value ?physics mark) 3)) then (printout t "not recommend researcher" crlf))
)

(defrule architecture-recomendation
?math <- (subject (type math))
?art <- (subject (type art))
(test (> (fact-slot-value ?math mark) 3))
(test (> (fact-slot-value ?art mark) 4))
=>
(printout t "recommend architecture" crlf)
)


(defrule accountant-recomendation
?math <- (subject (type math))
?economy <- (subject (type economy))
(test (> (fact-slot-value ?math mark) 3))
(test (> (fact-slot-value ?economy mark) 4))
=>
(printout t "recommend accountant" crlf)
)


(defrule medic-recomendation
?math <- (subject (type math))
?physics <- (subject (type physics))
?biology <- (subject (type biology))
?chemistry <- (subject (type chemistry))
?economy <- (subject (type economy))
(test (> (fact-slot-value ?biology mark) 4))
=>
(bind ?low (lowest (fact-slot-value ?math mark)
(fact-slot-value ?physics mark)
(fact-slot-value ?biology mark)
(fact-slot-value ?chemistry mark)
(fact-slot-value ?economy mark)))
(if (> ?low 3) then (printout t "recommend medicine" crlf))
)

(defrule teaching-recomendation
?math <- (subject (type math))
?chemistry <- (subject (type chemistry))
?physics <- (subject (type physics))
?english <- (subject (type english))
?french <- (subject (type french))
?biology <- (subject (type biology))
?economy <- (subject (type economy))
?history <- (subject (type history))
?geography <- (subject (type geography))
?art <- (subject (type art))
=>
    (bind ?tech_average (average (fact-slot-value ?math mark)
(fact-slot-value ?physics mark)
(fact-slot-value ?biology mark)
(fact-slot-value ?chemistry mark)
(fact-slot-value ?economy mark)))

    (bind ?humanitarian_average (average
(fact-slot-value ?english mark)
(fact-slot-value ?french mark)
(fact-slot-value ?history mark)
(fact-slot-value ?art mark)
(fact-slot-value ?geography mark)))
(if (and (< ?tech_average 4) (< ?humanitarian_average 4)) then (printout t "recommend teaching" crlf))
)

(defrule law-recomendation
?math <- (subject (type math))
?chemistry <- (subject (type chemistry))
?physics <- (subject (type physics))
?english <- (subject (type english))
?french <- (subject (type french))
?biology <- (subject (type biology))
?economy <- (subject (type economy))
?history <- (subject (type history))
?geography <- (subject (type geography))
?art <- (subject (type art))
(test (> (fact-slot-value ?english mark) 4))
=>
(bind ?humanitarian_min (lowest
(fact-slot-value ?english mark)
(fact-slot-value ?french mark)
(fact-slot-value ?history mark)
(fact-slot-value ?art mark)
(fact-slot-value ?geography mark)))
(if (> ?humanitarian_min 2) then (printout t "recommend law" crlf))
)

(defrule politics-recomendation
?math <- (subject (type math))
?english <- (subject (type english))
?economy <- (subject (type economy))
(test (eq (fact-slot-value ?english mark) 4))
(test (eq (fact-slot-value ?economy mark) 4))
(test (< (fact-slot-value ?math mark) 3))
=>
(printout t "recommend politics" crlf)
)

(defrule admin-recomendation
?math <- (subject (type math))
?chemistry <- (subject (type chemistry))
?physics <- (subject (type physics))
?english <- (subject (type english))
?french <- (subject (type french))
?biology <- (subject (type biology))
?economy <- (subject (type economy))
?history <- (subject (type history))
?geography <- (subject (type geography))
?art <- (subject (type art))
(test (eq (fact-slot-value ?math mark) 3))
=>
(bind ?humanitarian_min (lowest
(fact-slot-value ?english mark)
(fact-slot-value ?french mark)
(fact-slot-value ?history mark)
(fact-slot-value ?art mark)
(fact-slot-value ?geography mark)))
(bind ?tech_min (lowest 
(fact-slot-value ?physics mark)
(fact-slot-value ?biology mark)
(fact-slot-value ?chemistry mark)
(fact-slot-value ?economy mark)))
(if (or (eq ?tech_min 4) (eq ?humanitarian_min 4)) then (printout t "recommend admin" crlf))
)