#lang eopl

; invert : Listof(2-list) -> Listof(2-list)
; usage: (invert lst) returns a list with each 2-list reversed.
(define invert
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (list (cadr (car lst)) (car (car lst)))
              (invert (cdr lst))))))
