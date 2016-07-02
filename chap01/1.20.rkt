#lang eopl

; count-occurrences : Symbol * S-list -> Int
; usage: (count-occurrences s slist) returns the number of occurrences of s in slist.
(define count-occurrences
  (lambda (s slist)
    (if (null? slist)
        0
        (let ((fst (car slist)))
          (+
           (if (symbol? fst)
               (if (eqv? fst s) 1 0)
               (count-occurrences s fst))
           (count-occurrences s (cdr slist)))))))
