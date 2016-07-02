#lang eopl

; swapper : Symbol * Symbol * S-list -> S-list
; usage: (swapper s1 s2 slist) returns a list the same as slist, but
; with all occurrences of s1 replaced by s2 and all occurrences of s2 replaced by s1.
(define swapper
  (lambda (s1 s2 slist)
    (if (null? slist)
        '()
        (let ((fst (car slist)))
          (cons
           (if (symbol? fst)
               (cond
                 ((eqv? fst s1) s2)
                 ((eqv? fst s2) s1)
                 (else fst))
               (swapper s1 s2 fst))
           (swapper s1 s2 (cdr slist)))))))
