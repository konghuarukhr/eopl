#lang eopl

(define sort
  (lambda (loi)
    (if (null? loi)
        '()
        (sort-helper (car loi) (sort (cdr loi))))))

(define sort-helper
  (lambda (i loi)
    (if (null? loi)
        (list i)
        (if (<= i (car loi))
            (cons i loi)
            (cons (car loi) (sort-helper i (cdr loi)))))))
