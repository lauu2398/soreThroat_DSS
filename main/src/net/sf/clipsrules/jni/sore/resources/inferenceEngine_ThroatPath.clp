
;; TEMPLATE FOR PATIENT
(deftemplate Patient
        (slot name)
        (slot fever)
        (slot exudate)
        (slot s-nodes)
        (slot cough)
        (slot fatigue)
        (slot swallowing)
        (slot s-spleen)
        (slot s-tonsils)

        (slot score-mono (default 0))
        (slot score-viral (default 0))       
        (slot score-strep (default 0))
        (slot score-cancer (default 0))
        (slot score-abscess (default 0))
        (slot score-body (default 0))

        (slot fever_computed (default FALSE))
        (slot exudate_computed (default FALSE))
        (slot s-nodes_computed (default FALSE))
        (slot cough_computed (default FALSE))
        (slot fatigue_computed (default FALSE))
        (slot swallowing_computed (default FALSE))
        (slot s-spleen_computed (default FALSE))
        (slot s-tonsils_computed (default FALSE))
        (slot decision_highest)
        (slot decision_computed (default FALSE))

        (slot more_patients)
)

;;FUNCTION FOR LIMITING INPUT
(deffunction ask-question (?question $?allowed-values)
        (printout t ?question)
        (bind ?answer (read))
        (if (lexemep ?answer)then (bind ?answer (lowcase ?answer)))
        (while (not (member$ ?answer ?allowed-values)) do
                (printout t ?question)
                (bind ?answer (read))
                (if (lexemep ?answer)then (bind ?answer (lowcase ?answer))))?answer)

(deffacts Initial
        (Patient )) ;; Initial fact

;;OBTAINING INFO FROM USER
(defrule getName
        (declare (salience 500))
        ?p <- (Patient (name nil))
        =>
        (printout t "Enter patient's name: ")
        (modify ?p (name (read)))
)

(defrule getFever
        (declare (salience 500))
        ?p <- (Patient (fever nil))
        =>
        (modify ?p (fever (ask-question "Does he/she have fever? (h: high, m:mild, n:no): " h m n)))
)

(defrule getExudate
        (declare (salience 500))
        ?p <- (Patient (exudate nil))
        =>
        (modify ?p (exudate (ask-question "Does he/she have exudate? (y: yes, n:no): " y n)))
)

(defrule getNodes
        (declare (salience 500))
        ?p <- (Patient (s-nodes nil))
        =>
        (modify ?p (s-nodes (ask-question "Does he/she have swollen nodes? (y: yes, n:no): " y n)))
)

(defrule getCough
        (declare (salience 500))
        ?p <- (Patient (cough nil))
        =>
        (modify ?p (cough (ask-question "Does he/she have cough? (y: yes, n:no): " y n)))
)

(defrule getFatigue
        (declare (salience 500))
        ?p <- (Patient (fatigue nil))
        =>
        (modify ?p (fatigue (ask-question "Does he/she have fatigue? (y: yes, n:no): " y n)))
)

(defrule getSwallowing
        (declare (salience 500))
        ?p <- (Patient (swallowing nil))
        =>
        (modify ?p (swallowing (ask-question "Does he/she have swallowing? (y: yes, n:no): " y n)))
)

(defrule getSpleen
        (declare (salience 500))
        ?p <- (Patient (s-spleen nil))
        =>
        (modify ?p (s-spleen (ask-question "Does he/she have swollen spleen? (y: yes, n:no): " y n)))
)

(defrule getTonsils
        (declare (salience 500))
        ?p <- (Patient (s-tonsils nil))
        =>
        (modify ?p (s-tonsils (ask-question "Does he/she have swollen tonsils? (y: yes, n:no): " y n)))
        (printout t crlf)
)



;; RULES TO COMPUTE SCORES
(defrule feverHigh
        ?p <- (Patient (fever h)(fever_computed FALSE)(score-mono ?mono)(score-viral ?viral)
                (score-strep ?strep)(score-abscess ?abscess))
        =>
        (modify ?p (score-mono (+ ?mono 0.125))
                 (score-viral (+ ?viral 0.1))
                 (score-strep (+ ?strep 0.125))
                 (score-abscess (+ ?abscess 0.1))
                 (fever_computed TRUE))
        (printout t "High fever increases the risk of having:" crlf)
        (printout t "Mononucleosis (+0.125)" crlf)
        (printout t "Strep throat (+0.125" crlf)
        (printout t "There is also a lower risk of having viral pharyngitis | peritonsillar abscess" crlf)
)

(defrule feverMild
        ?p <- (Patient (fever m)(fever_computed FALSE)(score-mono ?mono)(score-viral ?viral)
                (score-strep ?strep)(score-abscess ?abscess))
        =>
        (modify ?p (score-mono (+ ?mono 0.1))
                 (score-viral (+ ?viral 0.125))
                 (score-strep (+ ?strep 0.1))
                 (score-abscess (+ ?abscess 0.125))
                 (fever_computed TRUE))
        (printout t "Mild fever increases the risk of having:" crlf)
        (printout t "Viral pharyngitis(+0.125)" crlf)
        (printout t "Peritonsillar abscess(+0.125" crlf)
        (printout t "There is also a lower risk of having mononucleosis  | strep throat" crlf)
)

(defrule feverNo
        ?p <- (Patient (fever n)(fever_computed FALSE)(score-cancer ?cancer)(score-body ?body))
        =>
        (modify ?p (score-cancer (+ ?cancer 0.125))
                 (score-body (+ ?body 0.125))
                 (fever_computed TRUE))
        (printout t "The lack of fever increases the risk of having:" crlf)
        (printout t "Pharyngeal cancer(+0.125)" crlf)
        (printout t "Foreign body(+0.125" crlf)
)

(defrule exudateYes
        ?p <- (Patient (exudate y)(exudate_computed FALSE)(score-mono ?mono)(score-cancer ?cancer)
                (score-strep ?strep))
        =>
        (modify ?p (score-mono (+ ?mono 0.125))
                 (score-strep (+ ?strep 0.25))
                 (score-cancer (+ ?cancer 0.125))
                 (exudate_computed TRUE))
        (printout t "The presence of exudate increases the risk of having:" crlf)
        (printout t "Mononucleosis(+0.125)" crlf)
        (printout t "Strep throat(+0.25)" crlf)
        (printout t "Pharyngeal cancer(+0.125)" crlf)
)

(defrule exudateNo
        ?p <- (Patient (exudate n)(exudate_computed FALSE)(score-viral ?viral)(score-body ?body)
                (score-abscess ?abscess))
        =>
        (modify ?p (score-viral (+ ?viral 0.125))
                 (score-abscess (+ ?abscess 0.0625))
                 (score-body (+ ?body 0.075))
                 (exudate_computed TRUE))
        (printout t "The absence of exudate increases the risk of having:" crlf)
        (printout t "Viral pharyngitis(+0.125)" crlf)
        (printout t "Peritonsillar abscess(+0.0625)" crlf)
        (printout t "Foreign body(+0.075)" crlf)
)

(defrule nodesYes
        ?p <- (Patient (s-nodes y)(s-nodes_computed FALSE)(score-mono ?mono)(score-cancer ?cancer)
                (score-strep ?strep)(score-viral ?viral)(score-abscess ?abscess))
        =>
        (modify ?p (score-mono (+ ?mono 0.125))
                 (score-strep (+ ?strep 0.125))
                 (score-cancer (+ ?cancer 0.15))
                 (score-viral (+ ?viral 0.094))
                 (score-abscess (+ ?abscess 0.125))
                 (s-nodes_computed TRUE))
        (printout t "The presence of swollen nodes increases the risk of having:" crlf)
        (printout t "Mononucleosis(+0.125)" crlf)
        (printout t "Strep throat(+0.125)" crlf)
        (printout t "Pharyngeal cancer(+0.15)" crlf)
        (printout t "Viral pharyngitis(+0.094)" crlf)
        (printout t "Peritonsillar abscess(+0.125)" crlf)
)

(defrule nodesNo
        ?p <- (Patient (s-nodes n)(exudate_computed FALSE)(score-body ?body))
        =>
        (modify ?p (score-body (+ ?body 0.075))
                 (s-nodes_computed TRUE))
        (printout t "The absence of swollen nodes increases the risk of having:" crlf)
        (printout t "Foreign body(+0.075)" crlf)
)

(defrule coughYes
        ?p <- (Patient (cough y)(cough_computed FALSE)(score-viral ?viral)
                (score-body ?body))
        =>
        (modify ?p (score-viral (+ ?viral 0.25))
                 (score-body (+ ?body 0.25))
                 (cough_computed TRUE))
        (printout t "Having cough increases the risk of having:" crlf)
        (printout t "Viral pharyngitis(+0.25)" crlf)
        (printout t "Foreign body(+0.25)" crlf)
)

(defrule coughNo
        ?p <- (Patient (cough n)(cough_computed FALSE)(score-abscess ?abscess)(score-mono ?mono)
                (score-strep ?strep)(score-cancer ?cancer))
        =>
        (modify ?p (score-mono (+ ?mono 0.062))
                (score-strep (+ ?strep 0.062))
                (score-cancer (+ ?cancer 0.1))
                (score-abscess (+ ?abscess 0.125))
                 (cough_computed TRUE))
        (printout t "Not having cough increases the risk of having:" crlf)
        (printout t "Mononucleosis(+0.062)" crlf)
        (printout t "Strep throat(+0.062)" crlf)
        (printout t "Pharyngeal cancer(+0.1)" crlf)
        (printout t "Peritonsillar abscess(+0.125)" crlf)
)


(defrule fatigueYes
        ?p <- (Patient (fatigue y)(fatigue_computed FALSE)(score-viral ?viral)
                (score-mono ?mono)(score-cancer ?cancer)(score-strep ?strep))
        =>
        (modify ?p (score-viral (+ ?viral 0.062))
                 (score-mono (+ ?mono 0.125))
                 (score-cancer (+ ?cancer 0.125))
                 (score-strep (+ ?strep 0.094))
                 (fatigue_computed TRUE))
        (printout t "Having fatigue increases the risk of having:" crlf)
        (printout t "Mononucleosis(+0.125)" crlf)
        (printout t "Strep throat(+0.094)" crlf)
        (printout t "Pharyngeal cancer(+0.125)" crlf)
        (printout t "Viral pharyngitis(+0.062)" crlf)
)

(defrule fatigueNo
        ?p <- (Patient (fatigue n)(fatigue_computed FALSE)(score-abscess ?abscess)
                (score-body ?body))
        =>
        (modify ?p (score-abscess (+ ?abscess 0.0625))
                (score-body (+ ?body 0.075))
                 (fatigue_computed TRUE))
        (printout t "The absence of fatigue increases the risk of having:" crlf)
        (printout t "Peritonsillar abscess(+0.0625)" crlf)
        (printout t "Foreign body(+0.075)" crlf)
)

(defrule swallowingYes
        ?p <- (Patient (swallowing y)(swallowing_computed FALSE)(score-viral ?viral)
                (score-mono ?mono)(score-cancer ?cancer)(score-strep ?strep)(score-body ?body)
                (score-abscess ?abscess))
        =>
        (modify ?p (score-viral (+ ?viral 0.125))
                 (score-mono (+ ?mono 0.094))
                 (score-cancer (+ ?cancer 0.15))
                 (score-strep (+ ?strep 0.125))
                 (score-abscess (+ ?abscess 0.25))
                 (score-body (+ ?body 0.25))
                 (swallowing_computed TRUE))
        (printout t "Having trouble swallowing increases the risk of having:" crlf)
        (printout t "Mononucleosis(+0.094)" crlf)
        (printout t "Strep throat(+0.125)" crlf)
        (printout t "Pharyngeal cancer(+0.15)" crlf)
        (printout t "Viral pharyngitis(+0.125)" crlf)
        (printout t "Foreign body(+0.25)" crlf)
        (printout t "Peritonsillar abscess(+0.25)" crlf)
)

(defrule spleenYes
        ?p <- (Patient (s-spleen y)(s-spleen_computed FALSE)
                (score-mono ?mono))
        =>
        (modify ?p (score-mono (+ ?mono 0.25))
                 (s-spleen_computed TRUE))
        (printout t "Having a swollen spleen increases the risk of having:" crlf)
        (printout t "Mononucleosis(+0.25)" crlf)
)

(defrule spleenNo
        ?p <- (Patient (s-spleen n)(s-spleen_computed FALSE)(score-abscess ?abscess)
                (score-body ?body)(score-strep ?strep)(score-cancer ?cancer)
                (score-viral ?viral))
        =>
        (modify ?p (score-abscess (+ ?abscess 0.125))
                (score-body (+ ?body 0.075))
                (score-viral (+ ?viral 0.094))
                (score-strep (+ ?strep 0.094 ))
                (score-cancer (+ ?cancer 0.1))
                (s-spleen_computed TRUE))
        (printout t "The absence of a swollen spleen increases the risk of having:" crlf)
        (printout t "Strep throat(+0.094)" crlf)
        (printout t "Pharyngeal cancer(+0.1)" crlf)
        (printout t "Viral pharyngitis(+0.094)" crlf)
        (printout t "Foreign body(+0.075)" crlf)
        (printout t "Peritonsillar abscess(+0.125)" crlf)
)

(defrule tonsilsYes
        ?p <- (Patient (s-tonsils y)(s-tonsils_computed FALSE)
                (score-mono ?mono)(score-abscess ?abscess)(score-strep ?strep))
        =>
        (modify ?p (score-mono (+ ?mono 0.094))
                 (score-abscess (+ ?abscess 0.125))
                 (score-strep (+ ?strep 0.125))
                 (s-tonsils_computed TRUE))
        (printout t "The presence of swollen tonsils increases the risk of having:" crlf)
        (printout t "Strep throat(+0.125)" crlf)
        (printout t "Peritonsillar abscess(+0.125)" crlf)
        (printout t "Mononucleosis(+0.094)" crlf)
)

(defrule tonsilsNo
        ?p <- (Patient (s-tonsils n)(s-tonsils_computed FALSE)(score-viral ?viral)
                (score-body ?body)(score-cancer ?cancer))
        =>
        (modify ?p (score-viral (+ ?viral 0.125))
                (score-body (+ ?body 0.075))
                (score-cancer (+ ?cancer 0.125))
                 (s-tonsils_computed TRUE))
        (printout t "The absence of swollen tonsils increases the risk of having:" crlf)
        (printout t "Viral pharyngitis(+0.125)" crlf)
        (printout t "Foreign body(+0.075)" crlf)
        (printout t "Pharyngeal cancer(+0.125)" crlf)
)


;;DECISION RULES

;; Ask if the doctor prefers the complete list of scores or the most probable diagnosis
(defrule askHighest 
        (declare (salience -250))
        ?p <- (Patient (decision_highest nil)(decision_computed FALSE))
        =>
        (modify ?p (decision_highest (ask-question "Do you want the complete list or the most probable diagnosis (c:complete/h:highest): "c h)))
)

(defrule monoHighest
        (declare (salience -500))
        ?p <- (Patient (name ?name)(decision_computed FALSE)(decision_highest h)(score-body ?body)
                (score-abscess ?abscess)(score-viral ?viral)(score-strep ?strep)
                (score-mono ?mono)(score-cancer ?cancer))
        (test (> ?mono ?strep))
        (test (> ?mono ?viral))
        (test (> ?mono ?abscess))
        (test (> ?mono ?cancer))
        (test (> ?mono ?body))
        =>
        (printout t crlf "Most probable diagnosis for " ?name ":" crlf)
        (printout t "Mononucleosis: " ?mono crlf)
        (modify ?p (decision_computed TRUE))
)

(defrule viralHighest
        (declare (salience -500))
        ?p <- (Patient (name ?name)(decision_computed FALSE)(decision_highest h)(score-body ?body)
                (score-abscess ?abscess)(score-viral ?viral)(score-strep ?strep)
                (score-mono ?mono)(score-cancer ?cancer))
        (test (> ?viral ?strep))
        (test (> ?viral ?mono))
        (test (> ?viral ?abscess))
        (test (> ?viral ?cancer))
        (test (> ?viral ?body))
        =>
        (printout t crlf "Most probable diagnosis for " ?name ":" crlf)
        (printout t "Viral pharyngitis: " ?viral crlf)
        (modify ?p (decision_computed TRUE))
)

(defrule strepHighest
        (declare (salience -500))
        ?p <- (Patient (name ?name)(decision_computed FALSE)(decision_highest h)(score-body ?body)
                (score-abscess ?abscess)(score-viral ?viral)(score-strep ?strep)
                (score-mono ?mono)(score-cancer ?cancer))
        (test (> ?strep ?viral))
        (test (> ?strep ?mono))
        (test (> ?strep ?abscess))
        (test (> ?strep ?cancer))
        (test (> ?strep ?body))
        =>
        (printout t crlf "Most probable diagnosis for " ?name ":" crlf)
        (printout t "Strep throat: " ?strep crlf)
        (modify ?p (decision_computed TRUE))
)

(defrule cancerHighest
        (declare (salience -500))
        ?p <- (Patient (name ?name)(decision_computed FALSE)(decision_highest h)(score-body ?body)
                (score-abscess ?abscess)(score-viral ?viral)(score-strep ?strep)
                (score-mono ?mono)(score-cancer ?cancer))
        (test (> ?cancer ?viral))
        (test (> ?cancer ?mono))
        (test (> ?cancer ?abscess))
        (test (> ?cancer ?strep))
        (test (> ?cancer ?body))
        =>
        (printout t crlf "Most probable diagnosis for " ?name ":" crlf)
        (printout t "Pharyngeal cancer: " ?cancer crlf)
        (modify ?p (decision_computed TRUE))
)

(defrule abscessHighest
        (declare (salience -500))
        ?p <- (Patient (name ?name)(decision_computed FALSE)(decision_highest h)(score-body ?body)
                (score-abscess ?abscess)(score-viral ?viral)(score-strep ?strep)
                (score-mono ?mono)(score-cancer ?cancer))
        (test (> ?abscess ?viral))
        (test (> ?abscess ?mono))
        (test (> ?abscess ?strep))
        (test (> ?abscess ?cancer))
        (test (> ?abscess ?body))
        =>
        (printout t crlf "Most probable diagnosis for " ?name ":" crlf)
        (printout t "Peritonsillar abscess: " ?abscess crlf)
        (modify ?p (decision_computed TRUE))
)

(defrule bodyHighest
        (declare (salience -500))
        ?p <- (Patient (name ?name)(decision_computed FALSE)(decision_highest h)(score-body ?body)
                (score-abscess ?abscess)(score-viral ?viral)(score-strep ?strep)
                (score-mono ?mono)(score-cancer ?cancer))
        (test (> ?body ?viral))
        (test (> ?body ?mono))
        (test (> ?body ?strep))
        (test (> ?body ?cancer))
        (test (> ?body ?abscess))
        =>
        (printout t crlf "Most probable diagnosis for " ?name ":" crlf)
        (printout t "Foreign body: " ?body crlf)
        (modify ?p (decision_computed TRUE))
)

(defrule decisionComplete
        (declare (salience -500))
        ?p <- (Patient (name ?name)(decision_highest c)(decision_computed FALSE)(score-body ?body)
                (score-abscess ?abscess)(score-viral ?viral)(score-strep ?strep)
                (score-mono ?mono)(score-cancer ?cancer))
        =>
        (printout t crlf "Possible diagnosis for " ?name ":" crlf)
        (printout t "Mononucleosis: " ?mono crlf)
        (printout t "Viral pharyngitis: " ?viral crlf)
        (printout t "Strep throat: " ?strep crlf)
        (printout t "Pharyngeal cancer: " ?cancer crlf)
        (printout t "Foreign body: " ?body crlf)
        (printout t "Peritonsillar abscess: " ?abscess crlf)
        (modify ?p (decision_computed TRUE))
)


;; ACCEPT MORE PATIENTS OR STOP THE PROGRAM
(defrule MorePatients
        (declare (salience -1000))
        ?p <- (Patient (decision_computed TRUE) (more_patients nil))
        =>
        (modify ?p (more_patients (ask-question "New patient? (y/n): " y n)))
        (printout t crlf))
        ;; must be YES to continue, asks the user if he wants to continue entering patients
        ;; if no, the rule below wont be fired and the execution will stop
        
(defrule NewPatient
        (declare (salience -1000))
        ?p <- (Patient (decision_computed TRUE) (more_patients y))
        =>
        (printout t "Entering a new patient: " crlf)    
        (assert (Patient )))

