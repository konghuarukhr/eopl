#lang eopl

(define empty-env
  (lambda () '()))

(define extend-env
  (lambda (var val env)
    (cons (cons (list var) (list val)) env)))

(define extend-env*
  (lambda (vars vals env)
    (cons (cons vars vals) env)))

(define apply-env
  (lambda (env var)
    (cond
      ((null? env) (eopl:error 'apply-env "~s not found" var))
      ((lookup (caar env) (cdar env) var) => identify)
      (else (apply-env (cdr env) var)))))
(define lookup
  (lambda (key val var)
    (cond
      ((null? key) #f)
      ((eq? (car key) var) (car val))
      (else (lookup (cdr key) (cdr val) var)))))
(define identify
  (lambda (id)
    id))

(define env (extend-env* '(a b c) '(1 2 3)
                         (extend-env 'x 10
                                     (empty-env))))
(apply-env env 'a)
(apply-env env 'x)

