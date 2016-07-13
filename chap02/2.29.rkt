#lang eopl

(define list-of
  (lambda (pred)
    (lambda (lst)
      (if (null? lst) #t
          (and (pred (car lst)) (list-of (cdr lst)))))))

(define-datatype lc-exp lc-exp?
  (var-exp (var symbol?))
  (lambda-exp (bound-vars (list-of symbol?)) (body lc-exp?))
  (app-exp (rator lc-exp?) (rands (list-of lc-exp?))))

(define parse-expression
  (lambda (datum)
    (cond
      ((symbol? datum) (var-exp datum))
      ((eqv? 'lambda (car datum)) (lambda-exp (cadr datum) (parse-expression (caddr datum))))
      (else (app-exp (parse-expression (car datum)) (map parse-expression (cdr datum)))))))

(parse-expression '((lambda (a b c) (+ a b c)) x y z))