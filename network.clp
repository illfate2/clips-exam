

(defglobal 
	?*num_of_ipx_yes_answers* = 0
	?*num_of_tcp_yes_answers* = 0
	?*num_of_apple_talk_yes_answers* = 0
)


(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(defrule is-ipx-standard-protocol
 (declare (salience 99))
  =>
  (bind ?res (ask-question "is IPX standard protocol? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_ipx_yes_answers* (+ ?*num_of_ipx_yes_answers* 1)))
 )

 
(defrule software-supports-ipx
 (declare (salience 98))
  =>
  (bind ?res (ask-question "Does software support IPX? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_ipx_yes_answers* (+ ?*num_of_ipx_yes_answers* 1)))
 )

  
(defrule ipx-routing
 (declare (salience 97))
  =>
  (bind ?res (ask-question "Does it requires routing IPX? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_ipx_yes_answers* (+ ?*num_of_ipx_yes_answers* 1)))
 )

   
(defrule support-ipx-servers
 (declare (salience 96))
  =>
  (bind ?res (ask-question "Do you support IPX servers? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_ipx_yes_answers* (+ ?*num_of_ipx_yes_answers* 1)))
 )



; this hack is needed cos we cant use pattern matching for global variable
; as possible solution rewrite it to fact, but it's more complicated
(defrule check-ipx-result
    (declare (salience 95))
    =>
    (if (>= ?*num_of_ipx_yes_answers* 3) then 
    (printout t "IPX " ?*num_of_ipx_yes_answers* crlf)
    (halt))  ; terminates rules execution
)

; TCP

(defrule is-tcp-standard-protocol
 (declare (salience 94))
  =>
  (bind ?res (ask-question "Is TCP standard protocol? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_tcp_yes_answers* (+ ?*num_of_tcp_yes_answers* 1)))
 )

 
(defrule software-supports-tcp
 (declare (salience 93))
  =>
  (bind ?res (ask-question "Does software support TCP? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_tcp_yes_answers* (+ ?*num_of_tcp_yes_answers* 1)))
 )

  
(defrule tcp-routing
 (declare (salience 92))
  =>
  (bind ?res (ask-question "Does it requires routing TCP? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_tcp_yes_answers* (+ ?*num_of_tcp_yes_answers* 1)))
 )

   
(defrule support-tcp-servers
 (declare (salience 91))
  =>
  (bind ?res (ask-question "Do you support TCP servers? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_tcp_yes_answers* (+ ?*num_of_tcp_yes_answers* 1)))
 )


(defrule check-tcp-result
    (declare (salience 90))
    =>
    (if (>= ?*num_of_tcp_yes_answers* 3) then 
    (printout t "TCP " ?*num_of_tcp_yes_answers* crlf)
    (halt)) 
)


; apple-talk

(defrule is-apple-talk-standard-protocol
 (declare (salience 89))
  =>
  (bind ?res (ask-question "Is AppleTalk standard protocol? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_apple_talk_yes_answers* (+ ?*num_of_apple_talk_yes_answers* 1)))
 )

 
(defrule software-supports-apple-talk
 (declare (salience 88))
  =>
  (bind ?res (ask-question "Does software support AppleTalk? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_apple_talk_yes_answers* (+ ?*num_of_apple_talk_yes_answers* 1)))
 )

  
(defrule apple-talk-routing
 (declare (salience 87))
  =>
  (bind ?res (ask-question "Does it requires routing AppleTalk? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_apple_talk_yes_answers* (+ ?*num_of_apple_talk_yes_answers* 1)))
 )

   
(defrule support-apple-talk-servers
 (declare (salience 86))
  =>
  (bind ?res (ask-question "Do you support AppleTalk servers? (yes, no) " yes no))
  (if (eq ?res yes) then
  (bind ?*num_of_apple_talk_yes_answers* (+ ?*num_of_apple_talk_yes_answers* 1)))
 )


(defrule check-apple-talk-result
    (declare (salience 85))
    =>
    (if (>= ?*num_of_apple_talk_yes_answers* 3) then 
    (printout t "AppleTalk " ?*num_of_apple_talk_yes_answers* crlf)
    (halt)) 
)



(defrule not-found-result
    =>
    (printout t "can't find supported protocol" crlf)
    (printout t "IPX res:" ?*num_of_ipx_yes_answers* crlf)
    (printout t "TCP res:" ?*num_of_tcp_yes_answers* crlf)
    (printout t "AppleTalk res:" ?*num_of_apple_talk_yes_answers* crlf)
)

