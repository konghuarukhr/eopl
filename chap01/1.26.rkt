#lang eopl

; up : List -> List
; usage: (up lst) removes a pair of parentheses from each top-level element of lst.
(define up
  (lambda (lst)
    (if (null? lst)
        '()
        (let ((fst (car lst)))
          (if (symbol? fst)
              (cons fst (up (cdr lst)))
              (append fst (up (cdr lst))))))))
