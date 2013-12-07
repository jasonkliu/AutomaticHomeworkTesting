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

(define g1 (make-ttt-game))
(testcase 1 1 (g1) 'ill-formed-command '(g1))
(testcase 1 2 (g1 'hi-there!) 'ill-formed-command '(g1 'hi-there!))
(testcase 1 3 (g1 'board) '((- - -) (- - -) (- - -)) '(g1 'board))
(testcase 1 4 (g1 'play 'x 2 2) '((- - -) (- x -) (- - -)) '(g1 'play 'x 2 2))
(testcase 1 5 (g1 'play 'x 1 1) 'out-of-turn '(g1 'play 'x 1 1))
(testcase 1 6 (g1 'play 'o 2 2) 'square-filled '(g1 'play 'o 2 2))
(testcase 1 7 (g1 'play 'o 3 3) '((- - -) (- x -) (- - o)) '(g1 'play 'o 3 3))
(testcase 1 8 (g1 'play 'x 0 0) 'ill-formed-command '(g1 'play 'x 0 0))
(testcase 1 9 (g1 'play 1 2) 'ill-formed-command '(g1 'play 1 2))
(testcase 1 10 (g1 'play 'x 1 2) '((- x -) (- x -) (- - o)) '(g1 'play 'x 1 2))
(testcase 1 11 (g1 'play 'o 1 3) '((- x o) (- x -) (- - o)) '(g1 'play 'o 1 3))
(testcase 1 12 (g1 'play 'x 3 2) 'x-won '(g1 'play 'x 3 2))
(testcase 1 13 (g1 'play 'o 2 3) 'game-over '(g1 'play 'o 2 3))

(display "---------------------NEXT TEST CASE---------------")(newline)(newline)

(define g2 (make-ttt-game)) 
(testcase 1 14 (g2 'play 'o 2 3) '((- - -) (- - o) (- - -)) '(g2 'play 'o 2 3))
(testcase 1 15 (g1 'board) '((- x o) (- x -) (- x o)) '(g1 'board))
(testcase 1 16 (g1 'reset) '((- - -) (- - -) (- - -)) '(g1 'reset))
(testcase 1 17 (g2 'board) '((- - -) (- - o) (- - -)) ' (g2 'board))

(display "---------------------NEXT TEST CASE---------------")(newline)(newline)

(define g6 (make-ttt-game))
(testcase 1 20 (g6 'play 'o 3 1) '((- - -) (- - -) (o - -)) '(g6 'play 'o 3 1)) 
(testcase 1 21 (g6 'play 'x 3 2) '((- - -) (- - -) (o x -)) '(g6 'play 'x 3 2)) 
(testcase 1 22 (g6 'play 'x 3 1) 'out-of-turn '(g6 'play 'x 3 1)) 
(testcase 1 23 (g6 'play 'x 3 3) 'out-of-turn '(g6 'play 'x 3 3)) 
(testcase 1 24 (g6 'play 'x 3 1) 'out-of-turn '(g6 'play 'x 3 1)) 
(testcase 1 25 (g6 'play 'o 2 2) '((- - -) (- o -) (o x -)) '(g6 'play 'o 2 2)) 
(testcase 1 26 (g6 'play 'x 1 2) '((- x -) (- o -) (o x -)) '(g6 'play 'x 1 2)) 
(testcase 1 27 (g6 'play 'o 3 2) 'square-filled '(g6 'play 'o 3 2)) 
(testcase 1 28 (g6 'play 'x 1 3) 'out-of-turn '(g6 'play 'x 1 3)) 
(testcase 1 29 (g6 'play 'o 1 1) '((o x -) (- o -) (o x -)) '(g6 'play 'o 1 1)) 
(testcase 1 30 (g6 'play 'o 3 2) 'out-of-turn '(g6 'play 'o 3 2)) 
(testcase 1 31 (g6 'play 'o 3 1) 'out-of-turn '(g6 'play 'o 3 1)) 
(testcase 1 32 (g6 'play 'x 2 3) '((o x -) (- o x) (o x -)) '(g6 'play 'x 2 3)) 
(testcase 1 33 (g6 'play 'o 2 1) 'o-won '(g6 'play 'o 2 1))

(display "---------------------NEXT TEST CASE---------------")(newline)(newline)

(define g9 (make-ttt-game))
(testcase 1 40 (g9 'play 'o 3 1) '((- - -) (- - -) (o - -)) '(g9 'play 'o 3 1)) 
(testcase 1 41 (g9 'play 'x 3 2) '((- - -) (- - -) (o x -)) '(g9 'play 'x 3 2)) 
(testcase 1 42 (g9 'play 'x 3 1) 'out-of-turn '(g9 'play 'x 3 1)) 
(testcase 1 43 (g9 'play 'x 3 3) 'out-of-turn '(g9 'play 'x 3 3)) 
(testcase 1 44 (g9 'play 'x 3 1) 'out-of-turn '(g9 'play 'x 3 1)) 
(testcase 1 45 (g9 'play 'o 2 2) '((- - -) (- o -) (o x -)) '(g9 'play 'o 2 2)) 
(testcase 1 46 (g9 'play 'x 1 2) '((- x -) (- o -) (o x -)) '(g9 'play 'x 1 2)) 
(testcase 1 47 (g9 'play 'o 3 2) 'square-filled '(g9 'play 'o 3 2)) 
(testcase 1 48 (g9 'play 'x 1 3) 'out-of-turn '(g9 'play 'x 1 3)) 
(testcase 1 49 (g9 'play 'o 1 1) '((o x -) (- o -) (o x -)) '(g9 'play 'o 1 1)) 
(testcase 1 50 (g9 'play 'o 3 2) 'out-of-turn '(g9 'play 'o 3 2)) 
(testcase 1 51 (g9 'play 'o 3 1) 'out-of-turn '(g9 'play 'o 3 1)) 
(testcase 1 52 (g9 'play 'o 2 1) 'out-of-turn '(g9 'play 'o 2 1)) 
(testcase 1 53 (g9 'play 'o 3 3) 'out-of-turn '(g9 'play 'o 3 3)) 
(testcase 1 54 (g9 'play 'o 3 1) 'out-of-turn '(g9 'play 'o 3 1)) 
(testcase 1 55 (g9 'play 'x 1 3) '((o x x) (- o -) (o x -)) '(g9 'play 'x 1 3)) 
(testcase 1 56 (g9 'play 'x 2 3) 'out-of-turn '(g9 'play 'x 2 3)) 
(testcase 1 57 (g9 'play 'o 3 2) 'square-filled '(g9 'play 'o 3 2)) 
(testcase 1 58 (g9 'play 'o 3 1) 'square-filled '(g9 'play 'o 3 1)) 
(testcase 1 59 (g9 'play 'x 3 2) 'out-of-turn '(g9 'play 'x 3 2)) 
(testcase 1 60 (g9 'play 'o 3 3) 'o-won '(g9 'play 'o 3 3)) 


;;************************************************************

(define q1 (make-queue))
(testcase 4 1 (q1 'empty?) #t '(q1 'empty?))
(testcase 4 2 (q1 'putq! 'a) 'a '(q1 'putq! 'a))
(testcase 4 3 (q1 'putq! 'b) 'b '(q1 'putq! 'b))
(testcase 4 4 (q1 'length) '2 '(q1 'length))
(testcase 4 5 (q1 'getq) 'a '(q1 'getq))

(define q2 (make-queue)) 
(testcase 4 6 (q2 'putq! 'g) 'g '(q2 'putq! 'g))
(testcase 4 7 (q2 'putq! 'h) 'h '(q2 'putq! 'h))
(testcase 4 8 (q2 'putq! 'i) 'i '(q2 'putq! 'i))
(testcase 4 9 (q2 'getq) 'g '(q2 'getq))
(testcase 4 10 (q2 'delq!) 'g '(q2 'delq!))
(testcase 4 11 (q2 'getq) 'h '(q2 'getq))
(testcase 4 12 (q1 'getq) 'a '(q1 'getq))
(testcase 4 13 (q1 'hi) 'error '(q1 'hi))

;;************************************************************

(display 'done)
