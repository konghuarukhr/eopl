#lang eopl

(define subst
  (lambda (new old slist)
    (map
     (lambda (sexp)
       (if (symbol? sexp)
           (if (eqv? sexp old) new sexp)
           (subst new old sexp)))
     slist)))
