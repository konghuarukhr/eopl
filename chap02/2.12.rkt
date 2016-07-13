#lang eopl

(define empty-stack
  (lambda ()
    (lambda (action)
      (case action
        [(orig-stack) (eopl:error "original")]
        [(empty-stack?) #t]
        [(top) (eopl:error 'top "empty stack")]
        [else (eopl:error "unknow action")]))))

(define push
  (lambda (stack x)
    (lambda (action)
      (case action
        [(orig-stack) stack]
        [(empty-stack?) #f]
        [(top) x]
        [else (eopl:error "unknow action")]))))

(define pop
  (lambda (stack)
    (lambda (action)
      ((stack 'orig-stack) action))))

(define top
  (lambda (stack)
    (stack 'top)))

(define empty-stack?
  (lambda (stack)
    (stack 'empty-stack?)))
