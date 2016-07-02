#lang eopl

; duple : Int * SchemeVal -> Listof(SchemeVal)
; usage: (duple n x) returns a length n list of x.
(define duple
  (lambda (n x)
    (if (zero? n)
        '()
        (cons x (duple (- n 1) x)))))
