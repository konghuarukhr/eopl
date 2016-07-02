#lang eopl

; product-helper : Symbol * Sos -> Listof(2-list)
; usage: (product-helper s sos) returns a list of 2-lists that every 2-list's car
; is s and cdr is the corresponding symbol in sos.
(define product-helper
  (lambda (s sos)
    (if (null? sos)
        '()
        (cons (list s (car sos)) (product-helper s (cdr sos))))))

; product : Sos * Sos -> Listof(2-list)
; usage: (product sos1 sos2) returns a list of 2-lists that represents the Cartesian
; product of sos1 and sos2.
(define product
  (lambda (sos1 sos2)
    (if (null? sos1)
        '()
        (let ((fst (car sos1)))
          (append
           (product-helper fst sos2)
           (product (cdr sos1) sos2))))))
