#lang eopl

; down : Listof(SchemeVal) -> Listof(SchemeVal)
; usage: (down lst) wraps parentheses around each top-level element of lst.
(define down
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (list (car lst))
              (down (cdr lst))))))
