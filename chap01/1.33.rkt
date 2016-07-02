#lang eopl

(define mark-leaves-with-red-depth-helper
  (lambda (bt n)
    (if (leaf? bt)
        (leaf n)
        (if (eqv? 'red (contents-of bt))
            (list (contents-of bt)
                  (mark-leaves-with-red-depth-helper (lson bt) (+ n 1))
                  (mark-leaves-with-red-depth-helper (rson bt) (+ n 1)))
            (list (contents-of bt)
                  (mark-leaves-with-red-depth-helper (lson bt) n)
                  (mark-leaves-with-red-depth-helper (rson bt) n))))))
(define mark-leaves-with-red-depth
  (lambda (bt)
    (mark-leaves-with-red-depth-helper bt 0)))
