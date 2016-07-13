#lang eopl

(define empty-env
  (lambda () '()))

(define extend-env
  (lambda (var val env)
    (cons (cons var val) env)))

(define apply-env
  (lambda (env var)
    (cond
      ((eq? env '()) (eopl:error 'apply-env "~s not found" var))
      ((eq? var (caar env)) (cdar env))
      (else (apply-env (cdr env) var)))))

(define env (extend-env 'a 1
                        (extend-env 'b 2
                                    (extend-env 'a 3
                                                (empty-env)))))

(define empty-env?
  (lambda (env)
    (eq? env '())))
(define has-binding?
  (lambda (env var)
    (cond
      ((eq? env '()) #f)
      ((eq? var (caar env)) #t)
      (else (has-binding? (cdr env) var)))))
(define extend-env*
  (lambda (vars vals env)
    (if (null? vars)
        env
        (extend-env (car vars) (car vals)
                    (extend-env* (cdr vars) (cdr vals) env)))))
(apply-env env 'a)
(apply-env env 'b)
;(apply-env env 'c)
(extend-env* '(a) '(10) env)