;************************************************************
; Test cases for HW #6, updated 11/11/2013, made by Jason Liu
;************************************************************

(load "hw6.scm")
(display "Test cases for Homework 6") (newline) (newline)

;************************************************************
(display "------------PROBLEM 1---------------") (newline)

; Template for new test case
(display "----- TEST 1 -----") (newline)
(display " (ram-read 4 ram-ex1) ") (newline)
(if (equal? (ram-read 4 ram-ex1) '(0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0))
    (begin (display "Your output is correct: ") (display '(0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0)))
    (begin (display "Your output is wrong: ")(ram-read 4 ram-ex1)))
(newline) (newline)

;************************************************************
(display "------------PROBLEM 2---------------") (newline)

(display "----- TEST 1 -----") (newline)
(display " (bits->int '(1 1 1 1 0 1 0 1 0 0 0 1)) ") (newline)
(if (equal? (bits->int '(1 1 1 1 0 1 0 1 0 0 0 1)) '3921)
    (begin (display "Your output is correct: ") (display '3921))
    (begin (display "Your output is wrong: ")(bits->int '(1 1 1 1 0 1 0 1 0 0 0 1)))) 
(newline) (newline)

(display "----- TEST 2 -----") (newline)
(display " (int->bits 583) ") (newline)
(if (equal? (int->bits 583) '(1 0 0 1 0 0 0 1 1 1))
    (begin (display "Your output is correct: ") (display '(1 0 0 1 0 0 0 1 1 1)))
    (begin (display "Your output is wrong: ")(int->bits 583)))
(newline) (newline)

;************************************************************
(display "------------PROBLEM 3---------------") (newline)

(display "----- TEST 1 -----") (newline)
(display " (incr-pc 5 config2) ") (newline)
(if (equal? (cadr (config-cpu (incr-pc 5 config2))) '(pc (0 0 0 0 0 0 0 0 1 1 0 1)))
    (begin (display "Your output is correct: ") (display '(pc (0 0 0 0 0 0 0 0 1 1 0 1))))
    (begin (display "Your output is wrong: ")(cadr (config-cpu (incr-pc 5 config2)))))
(newline) (newline)

(display "----- TEST 2 -----") (newline)
(display " (incr-pc 5000 config2) ") (newline)
(if (equal? (cadr (config-cpu (incr-pc 5000 config2))) '(pc (0 0 1 1 1 0 0 1 0 0 0 0)))
    (begin (display "Your output is correct: ") (display '(pc (0 0 1 1 1 0 0 1 0 0 0 0))))
    (begin (display "Your output is wrong: ")(cadr (config-cpu (incr-pc 5 config2)))))
(newline) (newline)

;************************************************************
(display "------------PROBLEM 4---------------") (newline)

; not sure if these are correct

(display "----- TEST 1 -----") (newline)
(display " (config-cpu (add 3 config3) ") (newline)
(if (equal? (config-cpu (add 3 config3)) '((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 0 1 1 1)) (run-flag (1)) (aeb (0))))
    (begin (display "Your output is correct: ") (display '((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 0 1 1 1)) (run-flag (1)) (aeb (0)))))
    (begin (display "Your output is wrong: ") (config-cpu (add 3 config3))))
(newline) (newline)

(display "----- TEST 2 -----") (newline)
(display " (config-cpu (sub 4 config4)) ") (newline)
(if (equal? (config-cpu (sub 4 config4)) '((acc (0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0)) (pc (0 0 0 0 0 0 0 0 0 0 0 0)) (run-flag (1)) (aeb (0))))
    (begin (display "Your output is correct: ") (display '((acc (0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0)) (pc (0 0 0 0 0 0 0 0 0 0 0 0)) (run-flag (1)) (aeb (0)))))
    (begin (display "Your output is wrong: ") (config-cpu (sub 4 config4))))
(newline) (newline)

(display 'done)
