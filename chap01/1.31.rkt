#lang eopl

(define leaf
  (lambda (i)
    i))
(define interior-node
  (lambda (s bt1 bt2)
    (list s bt1 bt2)))
(define leaf?
  (lambda (bt)
    (integer? bt)))
(define lson
  (lambda (bt)
    (cadr bt)))
(define rson
  (lambda (bt)
    (caddr bt)))
(define contents-of
  (lambda (bt)
    (if (leaf? bt)
        bt
        (car bt))))
