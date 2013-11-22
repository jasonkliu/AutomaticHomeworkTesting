;************************************************************
; Test cases for HW #8, updated 11/22/2013, made by Jason Liu
;************************************************************

(load "hw8.scm")
(display "Test cases for Homework 8") (newline) (newline)

(define testcase ; begin and newline don't work well with if statements
  (lambda (problem number function output symbol)
    (if (equal? number 1) 
        ; if it's the first problem in the series
        (firsttest problem number function output symbol)
        ; else
        (elsetest problem number function output symbol))))

(define firsttest
  (lambda (problem number function output symbol)
    (begin (display "------------PROBLEM ") (display problem) (display "---------------"))
    (newline)
    (begin (begin (display "---- TEST ") (display number) (display " -----")))
    (newline)
    (display symbol) (newline)
   ; (display function) (newline)
    (if (equal? function output)
        (begin (display "Your output is correct: ") (display function))
        (begin (display "Your output is wrong: ") (display function)))
    (newline) (newline)))

(define elsetest
  (lambda (problem number function output symbol)
    (begin (begin (display "---- TEST ") (display number) (display " -----")))
    (newline)
    (display symbol) (newline)
   ; (display function) (newline)
    (if (equal? function output)
        (begin (display "Your output is correct: ") (display function))
        (begin (display "Your output is wrong: ") (display function)))
    (newline) (newline)))

;;************************************************************

(testcase 1 1 (ok-symbol? '5) #f '(ok-symbol? '5))

;;************************************************************


(display 'done)
