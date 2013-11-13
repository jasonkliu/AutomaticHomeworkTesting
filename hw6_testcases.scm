;************************************************************
; Test cases for HW #6, updated 11/13/2013, made by Jason Liu
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

;;************************************************************
(define cpu-ex3 '((acc (1 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1))
		  (pc (0 0 0 0 0 0 0 0 0 0 0 0))
		  (run-flag (1))
		  (aeb (0))))
(define config5 (list cpu-ex3 ram-ex1))

(testcase 5 1 '(output config5) 
          '(output = -15) '(output config5))
(display "Comment: The first line of the answer should be 'output = -15'") (newline) (newline)

;;************************************************************
(testcase 6 1 (config-cpu (jump 15 config1))
          '((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 1 1 1 1)) (run-flag (1)) (aeb (0))) '(config-cpu (jump 15 config1)))
(testcase 6 2 (config-cpu (jump 5000 config1))
          '((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 1 1 1 0 0 0 1 0 0 0)) (run-flag (1)) (aeb (0))) '(config-cpu (jump 5000 config1)))
(testcase 6 3 (config-cpu (skipzero (list '((acc (1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)) (pc (0 0 0 0 0 0 0 0 0 0 0 1)) (run-flag (0)) (aeb (1))) ram-ex1)))
          '((acc (1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)) (pc (0 0 0 0 0 0 0 0 0 0 1 1)) (run-flag (0)) (aeb (1))) '(config-cpu (skipzero (list '((acc (1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)) (pc (0 0 0 0 0 0 0 0 0 0 0 1)) (run-flag (0)) (aeb (1))) ram-ex1))))
(testcase 6 4 (config-cpu (skippos config5))
          '((acc (1 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 0 0 0 1)) (run-flag (1)) (aeb (0))) '(config-cpu (skippos config5)))
          
;;************************************************************
(testcase 7 1 (loadi 1 config3)
          '(((acc (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1)) (pc (0 0 0 0 0 0 0 0 0 1 1 1)) (run-flag (1)) (aeb (0)))
            ((0 (0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0))
             (5 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1)))) '(loadi 1 config3))

(testcase 7 2 (storei 0 config3)
          '(((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 0 1 1 1)) (run-flag (1)) (aeb (0)))
            ((0 (0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1))
             (5 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1)))) '(storei 0 config3))

;;************************************************************
(testcase 8 1 (next-config config3)
          '(((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 0 1 1 1)) (run-flag (0)) (aeb (0)))
            ((0 (0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0))
             (5 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1)))) '(next-config config3))

(testcase 8 2 (next-config config5)
          '(((acc (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0)) (pc (0 0 0 0 0 0 0 0 0 0 0 1)) (run-flag (1)) (aeb (0)))
            ((0 (0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0))
             (5 (1 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1)))) '(next-config config5))

(testcase 8 3 (next-config (next-config config5))
          '(((acc (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0)) (pc (0 0 0 0 0 0 0 0 0 0 1 0)) (run-flag (1)) (aeb (0)))
            ((0 (0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0))
             (5 (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0)))) '(next-config (next-config config5)))

(testcase 8 4 (next-config (next-config (next-config config5)))
          '(((acc (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0)) (pc (0 0 0 0 0 0 0 0 0 0 1 0)) (run-flag (0)) (aeb (0)))
            ((0 (0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0))
             (5 (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0)))) '(next-config (next-config (next-config config5))))

(testcase 8 5 (next-config (next-config (next-config (next-config config5))))
          '(((acc (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0)) (pc (0 0 0 0 0 0 0 0 0 0 1 0)) (run-flag (0)) (aeb (0)))
            ((0 (0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0))
             (5 (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0)))) '(next-config (next-config (next-config (next-config config5)))))

;;************************************************************
(testcase 9 1 (config-ram (salo '((add 30) (sub 49) (input) (output) (jump 22) (skipzero) (skippos) (skiperr) (loadi 99) (storei 103))))
          '((0 (0 0 1 1 0 0 0 0 0 0 0 1 1 1 1 0))
            (1 (0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 1))
            (2 (0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0))
            (3 (0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (4 (0 1 1 1 0 0 0 0 0 0 0 1 0 1 1 0))
            (5 (1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (6 (1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0))
            (7 (1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (8 (1 0 1 1 0 0 0 0 0 1 1 0 0 0 1 1))
            (9 (1 1 0 0 0 0 0 0 0 1 1 0 0 1 1 1))) '(config-ram (salo '((add 30) (sub 49) (input) (output) (jump 22) (skipzero) (skippos) (skiperr) (loadi 99) (storei 103)))))


;;************************************************************
(testcase 10 1 (simulate 4 config3)
          '((((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 0 1 1 1)) (run-flag (1)) (aeb (0)))
            ((0 (0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0))
             (5 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1))))
           (((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 0 1 1 1)) (run-flag (0)) (aeb (0)))
            ((0 (0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0))
             (5 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1))))) '(simulate 4 config3))

(testcase 10 2 (simulate 4 config1)
          '((((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 0 1 1 1)) (run-flag (1)) (aeb (0)))
            ((0 (0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0))
             (5 (1 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1))))
           (((acc (0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1)) (pc (0 0 0 0 0 0 0 0 0 1 1 1)) (run-flag (0)) (aeb (0)))
            ((0 (0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0))
             (1 (0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 1))
             (2 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (3 (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
             (4 (0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0))
             (5 (1 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1))))) '(simulate 4 config1))


(display 'done)
