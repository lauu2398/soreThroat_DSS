
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
        (slot decision_computed (default FALSE))
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
)

(defrule feverNo
        ?p <- (Patient (fever n)(fever_computed FALSE)(score-cancer ?cancer)(score-body ?body))
        =>
        (modify ?p (score-cancer (+ ?cancer 0.125))
                 (score-body (+ ?body 0.125))
                 (fever_computed TRUE))
)

(defrule exudateYes
        ?p <- (Patient (exudate y)(exudate_computed FALSE)(score-mono ?mono)(score-cancer ?cancer)
                (score-strep ?strep))
        =>
        (modify ?p (score-mono (+ ?mono 0.125))
                 (score-strep (+ ?strep 0.25))
                 (score-cancer (+ ?cancer 0.125))
                 (exudate_computed TRUE))
)

(defrule exudateNo
        ?p <- (Patient (exudate n)(exudate_computed FALSE)(score-viral ?viral)(score-body ?body)
                (score-abscess ?abscess))
        =>
        (modify ?p (score-viral (+ ?viral 0.125))
                 (score-abscess (+ ?abscess 0.0625))
                 (score-body (+ ?body 0.075))
                 (exudate_computed TRUE))
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
)

(defrule nodesNo
        ?p <- (Patient (s-nodes n)(exudate_computed FALSE)(score-body ?body))
        =>
        (modify ?p (score-body (+ ?body 0.075))
                 (s-nodes_computed TRUE))
)

(defrule coughYes
        ?p <- (Patient (cough y)(cough_computed FALSE)(score-viral ?viral)
                (score-body ?body))
        =>
        (modify ?p (score-viral (+ ?viral 0.25))
                 (score-body (+ ?body 0.25))
                 (cough_computed TRUE))
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
)

(defrule fatigueNo
        ?p <- (Patient (fatigue n)(fatigue_computed FALSE)(score-abscess ?abscess)
                (score-body ?body))
        =>
        (modify ?p (score-abscess (+ ?abscess 0.0625))
                (score-body (+ ?body 0.075))
                 (fatigue_computed TRUE))
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
)

(defrule spleenYes
        ?p <- (Patient (s-spleen y)(s-spleen_computed FALSE)
                (score-mono ?mono))
        =>
        (modify ?p (score-mono (+ ?mono 0.25))
                 (s-spleen_computed TRUE))
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
)

(defrule tonsilsYes
        ?p <- (Patient (s-tonsils y)(s-tonsils_computed FALSE)
                (score-mono ?mono)(score-abscess ?abscess)(score-strep ?strep))
        =>
        (modify ?p (score-mono (+ ?mono 0.094))
                 (score-abscess (+ ?abscess 0.125))
                 (score-strep (+ ?strep 0.125))
                 (s-tonsils_computed TRUE))
)

(defrule tonsilsNo
        ?p <- (Patient (s-tonsils n)(s-tonsils_computed FALSE)(score-viral ?viral)
                (score-body ?body)(score-cancer ?cancer))
        =>
        (modify ?p (score-viral (+ ?viral 0.125))
                (score-body (+ ?body 0.075))
                (score-cancer (+ ?cancer 0.125))
                 (s-tonsils_computed TRUE))
)


;;DECISION RULES

;; Ask if the doctor prefers the complete list of scores or the most probable diagnosis


(defrule decisionComplete
        (declare (salience -500))
        ?p <- (Patient (name ?name)(decision_computed FALSE)(score-body ?body)
                (score-abscess ?abscess)(score-viral ?viral)(score-strep ?strep)
                (score-mono ?mono)(score-cancer ?cancer))
        =>
        (modify ?p (decision_computed TRUE))
)

