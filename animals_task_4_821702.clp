(deftemplate rule

(multislot if)

(multislot then))

(defrule data-input

(initial-fact)

=>
(printout t crlf "Vid zhivotnogo ")
(bind ?vid(read))
(assert (vid ?vid))

(printout t crlf "Pitanie zhivotnogo ")
(bind ?pit(read))
(assert (pit ?pit))

(printout t crlf "Imeet li rizhevato-korichnevii zvet? ")
(bind ?colorrk(read))
(assert (colorrk ?colorrk))

(printout t crlf "Imeet li 4-b zvet? ")
(bind ?colorchb(read))
(assert (colorchb ?colorchb))

(printout t crlf "Temnie pyatna? ")
(bind ?tp(read))
(assert (tp ?tp))

(printout t crlf "4ernie polosi? ")
(bind ?tpol(read))
(assert (tpol ?tpol))

(printout t crlf "Dlinnaya sheya? ")
(bind ?ds(read))
(assert (ds ?ds))

(printout t crlf "Dlinnie nogi? ")
(bind ?dn(read))
(assert (dn ?dn))

(printout t crlf "Umeet letatb? ")
(bind ?ul(read))
(assert (ul ?ul))

(printout t crlf "Umeet plavatb? ")
(bind ?up(read))
(assert (up ?up))

(printout t crlf "Volosi? ")
(bind ?vs(read))
(assert (vs ?vs))

(printout t crlf "Moloko? ")
(bind ?mlk(read))
(assert (mlk ?mlk)))


(defrule R1
(vid ?vid)
(pit ?pit)
(colorrk ?colorrk)
(colorchb ?colorchb)
(tp ?tp)
(tpol ?tpol)
(ds ?ds)
(dn ?dn)
(ul ?ul)
(up ?up)
(vs ?vs)
(mlk ?mlk)


(test (and (eq ?vid mleko) (eq ?pit xish) (eq ?colorrk yes) (eq ?tp yes)))

=>
(printout t crlf crlf "Obezyana" crlf))

(defrule R2
(vid ?vid)
(pit ?pit)
(colorrk ?colorrk)
(colorchb ?colorchb)
(tp ?tp)
(tpol ?tpol)
(ds ?ds)
(dn ?dn)
(ul ?ul)
(up ?up)
(vs ?vs)
(mlk ?mlk)


(test (and (eq ?vid mleko) (eq ?pit xish) (eq ?colorrk yes) (eq ?colorchb yes)))

=>
(printout t crlf crlf "Tiger" crlf))

(defrule R3
(vid ?vid)
(pit ?pit)
(colorrk ?colorrk)
(colorchb ?colorchb)
(tp ?tp)
(tpol ?tpol)
(ds ?ds)
(dn ?dn)
(ul ?ul)
(up ?up)
(vs ?vs)
(mlk ?mlk)


(test (and (eq ?vid kop) (eq ?ds yes) (eq ?dn yes) (eq ?tp yes)))

=>
(printout t crlf crlf "Girafe" crlf))

(defrule R4
(vid ?vid)
(pit ?pit)
(colorrk ?colorrk)
(colorchb ?colorchb)
(tp ?tp)
(tpol ?tpol)
(ds ?ds)
(dn ?dn)
(ul ?ul)
(up ?up)
(vs ?vs)
(mlk ?mlk)


(test (and (eq ?vid kop) (eq ?tpol yes)))

=>
(printout t crlf crlf "Zebra" crlf))

(defrule R5
(vid ?vid)
(pit ?pit)
(colorrk ?colorrk)
(colorchb ?colorchb)
(tp ?tp)
(tpol ?tpol)
(ds ?ds)
(dn ?dn)
(ul ?ul)
(up ?up)
(vs ?vs)
(mlk ?mlk)


(test (and (eq ?vid ptiza) (eq ?ds yes) (eq ?dn yes) (eq ?colorchb yes)))

=>
(printout t crlf crlf "Straus" crlf))

(defrule R6
(vid ?vid)
(pit ?pit)
(colorrk ?colorrk)
(colorchb ?colorchb)
(tp ?tp)
(tpol ?tpol)
(ds ?ds)
(dn ?dn)
(ul ?ul)
(up ?up)
(vs ?vs)
(mlk ?mlk)


(test (and (eq ?ul no) (eq ?up yes) (eq ?colorchb yes)))

=>
(printout t crlf crlf "Pinguin" crlf))

(defrule R7
(vid ?vid)
(pit ?pit)
(colorrk ?colorrk)
(colorchb ?colorchb)
(tp ?tp)
(tpol ?tpol)
(ds ?ds)
(dn ?dn)
(ul ?ul)
(up ?up)
(vs ?vs)
(mlk ?mlk)


(test (eq ?ul yes))

=>
(printout t crlf crlf "Albatros" crlf))


(defrule R8
(vid ?vid)
(pit ?pit)
(colorrk ?colorrk)
(colorchb ?colorchb)
(tp ?tp)
(tpol ?tpol)
(ds ?ds)
(dn ?dn)
(ul ?ul)
(up ?up)
(vs ?vs)
(mlk ?mlk)


(test (eq ?mlk yes))

=>
(printout t crlf crlf "Mlekopitayushee" crlf))


(defrule R9
(vid ?vid)
(pit ?pit)
(colorrk ?colorrk)
(colorchb ?colorchb)
(tp ?tp)
(tpol ?tpol)
(ds ?ds)
(dn ?dn)
(ul ?ul)
(up ?up)
(vs ?vs)
(mlk ?mlk)


(test (eq ?vs yes))

=>
(printout t crlf crlf "Mlekopitayushee" crlf))