#lang eopl

(define sort/predicate
  (lambda (pred loi)
    (if (null? loi)
        '()
        (sort-helper/predicate pred (car loi) (sort/predicate pred (cdr loi))))))

(define sort-helper/predicate
  (lambda (pred i loi)
    (if (null? loi)
        (list i)
        (if (pred i (car loi))
            (cons i loi)
            (cons (car loi) (sort-helper/predicate pred i (cdr loi)))))))
