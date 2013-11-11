#lang R5RS

(define (go)
   'yep-it-works)

(display 'hi)

;(open-input-file "new.scm")
(display 'done)
(load "new.scm")
(go)
