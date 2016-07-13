#lang eopl

;; constructor
(define empty-stack
  (lambda () '()))

;; constructor
(define push
  (lambda (stack x)
    (cons x stack)))

;; constructor
(define pop
  (lambda (stack)
    (cdr stack)))

;; observer
(define top
  (lambda (stack)
    (car stack)))

;; observer
(define empty-stack?
  (lambda (stack)
    (equal? stack '())))
