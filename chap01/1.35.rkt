#lang eopl

(define number-leaves-helper
  (lambda (bt n)
    (if (leaf? bt)
        (cons (leaf n) n)
        (let ((l (number-leaves-helper (lson bt) n)))
          (let ((r (number-leaves-helper (rson bt) (+ 1 (cdr l)))))
            (cons (list (contents-of bt) (car l) (car r)) (cdr r)))))))
(define number-leaves
  (lambda (bt)
    (car (number-leaves-helper bt 0))))
