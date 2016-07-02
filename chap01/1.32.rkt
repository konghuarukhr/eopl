#lang eopl

(define double-tree
  (lambda (bt)
    (if (leaf? bt)
        (leaf (* 2 (contents-of bt)))
        (list (contents-of bt) (double-tree (lson bt)) (double-tree (rson bt))))))
