;************************************************************
; Test cases for HW #7, updated 11/19/2013, made by Jason Liu
;************************************************************

(load "hw7.scm")
(display "Test cases for Homework 7") (newline) (newline)

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

; Some problems have random results and cannot be easily tested.

;;************************************************************
(testcase 1 1 (ok-symbol? '5) #f '(ok-symbol? '5))

(testcase 1 2 (ok-symbol? 'asdf) #t '(ok-symbol? 'asdf))

;;************************************************************
(testcase 2 0 (reg-exp? exp0) #t '(reg-exp? exp0))
(testcase 2 1 (reg-exp? exp1) #t '(reg-exp? exp1))
(testcase 2 2 (reg-exp? exp2) #t '(reg-exp? exp2))
(testcase 2 3 (reg-exp? exp3) #t '(reg-exp? exp3))
(testcase 2 4 (reg-exp? exp4) #t '(reg-exp? exp4))
(testcase 2 5 (reg-exp? exp5) #t '(reg-exp? exp5))
(testcase 2 6 (reg-exp? exp6) #t '(reg-exp? exp6))
(testcase 2 7 (reg-exp? exp7) #t '(reg-exp? exp7))
(testcase 2 8 (reg-exp? exp8) #t '(reg-exp? exp8))
(testcase 2 9 (reg-exp? exp9) #t '(reg-exp? exp9))
(testcase 2 00 (reg-exp? exp-chase) #t '(reg-exp? exp-chase))

(testcase 2 10 (reg-exp-type exp0) 'conc '(reg-exp-type exp0))
(testcase 2 11 (reg-exp-type exp1) 'conc '(reg-exp-type exp1))
(testcase 2 12 (reg-exp-type exp2) 'union '(reg-exp-type exp2))
(testcase 2 13 (reg-exp-type exp3) 'star '(reg-exp-type exp3))
(testcase 2 14 (reg-exp-type exp4) 'star '(reg-exp-type exp4))
(testcase 2 15 (reg-exp-type exp5) 'conc '(reg-exp-type exp5))
(testcase 2 16 (reg-exp-type exp6) 'conc '(reg-exp-type exp6))
(testcase 2 17 (reg-exp-type exp7) 'conc '(reg-exp-type exp7))
(testcase 2 18 (reg-exp-type exp8) 'conc '(reg-exp-type exp8))
(testcase 2 19 (reg-exp-type exp9) 'conc '(reg-exp-type exp9))
(testcase 2 20 (reg-exp-type exp-chase) 'conc '(reg-exp-type exp-chase))
(testcase 2 21 (map reg-exp-type exp-chase) '(symbol union symbol symbol union star)
          '(map reg-exp-type exp-chase))

;;************************************************************
(testcase 4 1 (reverse-exp exp5) '(r (+: (u: d a)) c) '(reverse-exp exp5))

(testcase 4 2 (reverse-exp exp7) '((u: tale story) long (+: (u: quite very)) a) '(reverse-exp exp7))

;;************************************************************


(display 'done)
