; функция ask-question с обязательным параметром ?question (вопрос) и групповым параметром $?allowed-values (список допустимых ответов)
(deffunction ask-question (?question $?allowed-values)
   (printout t ?question) 			; вывод вопроса
   (bind ?answer (read))  			; вывод ответа
   (if (lexemep ?answer)  			; если введено строковое значение
       then (bind ?answer (lowcase ?answer))) 	; то символы строки преобразуем в строчные
; пока пользователь не введет ответ, принадлежащий списку допустимых значений, повторять ввод
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction ask_integer_question (?question ?min_value ?max_value)
 (printout t ?question) 
 (bind ?num (read))
 (while (not (integerp ?num)) do
      (printout t ?question)
      (bind ?num (read))
  )
 (while (not (and (<= ?num ?max_value) (>= ?num ?min_value))) 
	(printout t ?question)
        (bind ?num (read))
	(while (not (integerp ?num)) do
             (printout t ?question)
     	     (bind ?num (read))
        )
 ) 
 ?num)	     
	   
(defglobal 
	?*NWLink* = 0.0
	?*TCPIP* = 0.0
	?*AppleTalk* = 0.0
	?*Summ* = 0.0
)

(defrule question1 ""
	(declare (salience 25))
	=>
	(bind ?response (ask-question "Является ли IPX стандартным протоколом? yes/no) ? " yes no))
	(if (eq ?response yes) 
       then (bind ?*NWLink* (+ ?*NWLink* 1))
	)
)

(defrule question2 ""
	(declare (salience 24))
	=>
	(bind ?response (ask-question "Поддерживает ли сетевое программное обеспечение протокол IPX?(yes/no) ? " yes no))
	(if (eq ?response yes) 
       then (bind ?*NWLink* (+ ?*NWLink* 1))
	)
)

(defrule question3 ""
	(declare (salience 23))
	=>
	(bind ?response (ask-question "Нужна ли маршрутизация в сети(yes/no) ? " yes no))
	(if (eq ?response yes) 
       then (bind ?*NWLink* (+ ?*NWLink* 1))
			(bind ?*TCPIP* (+ ?*TCPIP* 1))
			(bind ?*AppleTalk* (+ ?*AppleTalk* 1))
	)
)

(defrule question4 ""
	(declare (salience 22))
	=>
	(bind ?response (ask-question "Будете ли вы поддерживать серверы и компьютеры-клиенты, использующие Nowell NetWare?(yes/no) ? " yes no))
	(if (eq ?response yes) 
       then (bind ?*NWLink* (+ ?*NWLink* 1))
	)
)

(defrule question5 ""
	(declare (salience 21))
	=>
	(bind ?response (ask-question "Является ли TCP/IP стандартным протоколом? (yes/no) ? " yes no))
	(if (eq ?response yes) 
       then (bind ?*TCPIP* (+ ?*TCPIP* 1))
	)
)

(defrule question6 ""
	(declare (salience 20))
	=>
	(bind ?response (ask-question "Поддерживает ли сетевое программное обеспечение протокол TCP/IP?(yes/no)  ? " yes no))
	(if (eq ?response yes) 
       then (bind ?*TCPIP* (+ ?*TCPIP* 1))
	)
)

(defrule question7 ""
	(declare (salience 19))
	=>
	(bind ?response (ask-question "Требуется ли доступ в интернет? (yes/no) ? " yes no))
	(if (eq ?response yes) 
       then (bind ?*TCPIP* (+ ?*TCPIP* 1))
	)
)

(defrule question8 ""
	(declare (salience 18))
	=>
	(bind ?response (ask-question "Требуется ли поддерживать серверы и клиенты от разных поставщиков (TCP/IP) (yes/no)? " yes no))
	(if (eq ?response yes) 
       then (bind ?*TCPIP* (+ ?*TCPIP* 1))
	)
)

(defrule question9 ""
	(declare (salience 17))
	=>
	(bind ?response (ask-question "Является ли AppleTalk стандартным протоколом (yes/no) ? " yes no))
	(if (eq ?response yes) 
       then (bind ?*AppleTalk* (+ ?*AppleTalk* 1))
	)
)

(defrule question10 ""
	(declare (salience 16))
	=>
	(bind ?response (ask-question "Поддерживает ли сетевое программное обеспечение AppleTalk (yes/no) ? " yes no))
	(if (eq ?response yes) 
       then (bind ?*AppleTalk* (+ ?*AppleTalk* 1))
	)
)


(defrule result ""
	(declare (salience 14))
	=>
	(printout t crlf)
	(printout t "Результат:")
	(printout t crlf)
	(if (> ?*AppleTalk* 2) 
		   then	(printout t "AppleTalk"))
	(if (> ?*NWLink* 2) 
		   then	(printout t "NWLink or Nowell IPX"))
	(if (> ?*TCPIP* 2) 
		then(printout t "TCP/IP"))
	   	
	(printout t crlf)
)






