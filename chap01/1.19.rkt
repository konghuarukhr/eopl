#lang eopl

; list-set : Listof(SchemeVal) * Int * SchemeVal -> Listof(SchemeVal)
; usage: (list-set lst n x) returns a listlike lst, 
; except that the n-th element, using zero-based indexing, is x.
(define list-set
  (lambda (lst n x)
    (if (zero? n)
        (cons x (cdr lst))
        (cons (car lst) (list-set (cdr lst) (- n 1) x)))))
