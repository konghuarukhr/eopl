#lang eopl

;;; n = 1: (one)
;;; n != 1: (diff diff-tree diff-tree)

;;; <n> = (diff <n> (diff <0> <0>)) = (diff <n> (diff <0> (diff <0> <0>)))

(define zero (lambda () '(diff (one) (one))))
(define one (lambda () '(one)))
(define is-zero? (lambda (n) (= 0 (value-of n))))
(define successor
  (lambda (n)
    (list 'diff
          n
          (list 'diff (zero) (one)))))
(define predecessor
  (lambda (n)
    (list 'diff
          n
          (one))))
(define value-of
  (lambda (n)
    (if (equal? n '(one))
        1
        (- (value-of (cadr n)) (value-of (caddr n))))))
(define diff-tree-plus
  (lambda (x y)
    (let ((c (cadr y)) (d (caddr y)))
      (list 'diff x (list 'diff d c)))))
