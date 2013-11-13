;************************************************************
; Test cases for HW #6, updated 11/11/2013, made by Jason Liu
;************************************************************

(load "hw6.scm")
(display "Test cases for Homework 6") (newline) (newline)

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
   ; (display output) (newline)
    (if (equal? function output)
        (begin (display "Your output is correct: ") (display function))
        (begin (display "Your output is wrong: ") function))
    (newline) (newline)))

(define elsetest
  (lambda (problem number function output symbol)
    (begin (begin (display "---- TEST ") (display number) (display " -----")))
    (newline)
    (display symbol) (newline)
    ; (display output) (newline)
    (if (equal? function output)
        (begin (display "Your output is correct: ") (display function))
        (begin (display "Your output is wrong: ") function))
    (newline) (newline)))

;;************************************************************
(testcase 1 1 (ram-read 4 ram-ex1) 
          '(0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0) '(ram-read 4 ram-ex1))

;;************************************************************
(testcase 2 1 (bits->int '(1 1 1 1 0 1 0 1 0 0 0 1)) 
          '3921 '(bits->int '(1 1 1 1 0 1 0 1 0 0 0 1)))

(testcase 2 2 (int->bits 583) 
          '(1 0 0 1 0 0 0 1 1 1) '(bits->int '(int->bits 583)))

;;************************************************************
(testcase 3 1 (cadr (config-cpu (incr-pc 5 config2))) 
          '(pc (0 0 0 0 0 0 0 0 1 1 0 1)) '(cadr (config-cpu (incr-pc 5 config2))))

(testcase 3 2 (cadr (config-cpu (incr-pc 5000 config2))) 
          '(pc (0 0 1 1 1 0 0 1 0 0 0 0)) '(cadr (config-cpu (incr-pc 5000 config2))))

;;************************************************************
(testcase 4 1 (config-cpu (add 3 config3)) 
          '((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 0 1 1 1)) (run-flag (1)) (aeb (0))) '(config-cpu (add 3 config3)))

(testcase 4 2 (config-cpu (sub 4 config4)) 
          '((acc (0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0)) (pc (0 0 0 0 0 0 0 0 0 0 0 0)) (run-flag (1)) (aeb (0))) '(config-cpu (sub 4 config4)))





(display 'done)
