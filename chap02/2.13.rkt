#lang eopl

(define make-env
  (lambda (apply-env empty-env? has-binding?)
    (list apply-env empty-env? has-binding?)))

(define get-apply-env
  (lambda (env) (car env)))

(define get-empty-env?
  (lambda (env) (cadr env)))

(define get-has-binding?
  (lambda (env) (caddr env)))

(define empty-env
  (lambda ()
    (make-env
     (lambda (search-var) (eopl:error "no binding"))
     (lambda () #t)
     (lambda (search-var) #f))))

(define extend-env
  (lambda (var val env)
    (make-env
     (lambda (search-var)
       (if (eq? search-var var)
           val
           (apply-env env search-var)))
     (lambda () #f)
     (lambda (search-var)
       (if (eq? search-var var)
           #t
           (has-binding? env search-var))))))

(define apply-env
  (lambda (env search-var)
    ((get-apply-env env) search-var)))

(define empty-env?
  (lambda (env)
    ((get-empty-env? env))))

(define has-binding?
  (lambda (env search-var)
    ((get-has-binding? env) search-var)))

(define env (extend-env 'a 1 (extend-env 'b 2 (extend-env 'c 3 (extend-env 'a 4 (empty-env))))))