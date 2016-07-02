#lang eopl

(define g-helper
  (lambda (lst)
    (if (null? lst)
        '()
        (cons
         (cons (+ 1 (caar lst)) (cdar lst))
         (g-helper (cdr lst))))))
(define g
  (lambda (lst1 lst2)
    (cons lst1 (g-helper lst2))))
