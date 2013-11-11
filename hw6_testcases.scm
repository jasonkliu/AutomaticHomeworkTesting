;************************************************************
; Test cases for HW #6, last updated 11/11/2013
;************************************************************

(load "hw6.scm")

;************************************************************
(display "------------PROBLEM 1---------------") (newline)

; Template for new test case
(display "----- TEST 1 -----") (newline)
(display " (ram-read 4 ram-ex1) ") (newline)
(if (equal? (ram-read 4 ram-ex1) '(0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0))
    (begin (display "Your output is correct: ") '(0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0)) 
    (begin (display "Your output is wrong: ")(ram-read 4 ram-ex1)))
(newline)

;************************************************************
(display "------------PROBLEM 2---------------") (newline)

(display "----- TEST 1 -----") (newline)
(display " (bits->int '(1 1 1 1 0 1 0 1 0 0 0 1)) ") (newline)
(if (equal? (bits->int '(1 1 1 1 0 1 0 1 0 0 0 1)) '3921)
    (begin (display "Your output is correct: ") '3921)
    (begin (display "Your output is wrong: ")(bits->int '(1 1 1 1 0 1 0 1 0 0 0 1)))) 

(display "----- TEST 2 -----") (newline)
(display " (int->bits 583) ") (newline)
(if (equal? (int->bits 583) '(1 0 0 1 0 0 0 1 1 1))
    (begin (display "Your output is correct: ") '(1 0 0 1 0 0 0 1 1 1))
    (begin (display "Your output is wrong: ")(int->bits 583)))

;************************************************************
(display "------------PROBLEM 3---------------") (newline)

(display "----- TEST 1 -----") (newline)
(display " (incr-pc 5 config2) ") (newline)
(if (equal? (cadr (config-cpu (incr-pc 5 config2))) '(pc (0 0 0 0 0 0 0 0 1 1 0 1)))
    (begin (display "Your output is correct: ") '(pc (0 0 0 0 0 0 0 0 1 1 0 1)))
    (begin (display "Your output is wrong: ")(cadr (config-cpu (incr-pc 5 config2)))))

(display "----- TEST 2 -----") (newline)
(display " (incr-pc 5000 config2) ") (newline)
(if (equal? (cadr (config-cpu (incr-pc 5000 config2))) '(pc (0 0 1 1 1 0 0 1 0 0 0 0)))
    (begin (display "Your output is correct: ") '(pc (0 0 1 1 1 0 0 1 0 0 0 0)))
    (begin (display "Your output is wrong: ")(cadr (config-cpu (incr-pc 5 config2)))))

;************************************************************


(newline) (display 'done)