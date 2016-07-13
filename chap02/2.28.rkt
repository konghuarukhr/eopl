#lang eopl

(define-datatype lc-exp lc-exp?
  (var-exp (var symbol?))
  (lambda-exp (bound-var symbol?) (body lc-exp?))
  (app-exp (rator lc-exp?) (rand lc-exp?)))

(define unparse-lc-exp
  (lambda (exp)
    (cases lc-exp exp
      (var-exp (var)
               (symbol->string var))
      (lambda-exp (bound-var body)
                  (string-append "(lambda ("
                                 (symbol->string bound-var)
                                 ") "
                                 (unparse-lc-exp body)
                                 ")"))
      (app-exp (rator rand)
               (string-append "("
                              (unparse-lc-exp rator)
                              " "
                              (unparse-lc-exp rand)
                              ")")))))

(define unparse-lc-exp-orig
  (lambda (exp)
    (cases lc-exp exp
      (var-exp (var) var)
      (lambda-exp (bound-var body)
                  (list 'lambda (list bound-var)
                        (unparse-lc-exp-orig body)))
      (app-exp (rator rand)
               (list
                (unparse-lc-exp-orig rator) (unparse-lc-exp-orig rand))))))

(define space-separated-string-append
  (lambda strs
    (cond
      ((null? strs) "")
      ((= 1 (length strs)) (car strs))
      (else (string-append (car strs)
                           " "
                           (apply space-separated-string-append (cdr strs)))))))

(define sexp->string
  (lambda (sexp)
    (cond
      ((symbol? sexp) (symbol->string sexp))
      ((null? sexp) "()")
      (else (string-append "("
                           (apply space-separated-string-append (map sexp->string sexp))
                           ")")))))


(space-separated-string-append)
(space-separated-string-append "a")
(space-separated-string-append "a" "b")
(sexp->string '(a (b (c d e) () (()))))

(unparse-lc-exp-orig (app-exp (lambda-exp 'a (app-exp (var-exp 'a) (var-exp 'b))) (var-exp 'c)))
(sexp->string (unparse-lc-exp-orig (app-exp (lambda-exp 'a (app-exp (var-exp 'a) (var-exp 'b))) (var-exp 'c))))
(unparse-lc-exp (app-exp (lambda-exp 'a (app-exp (var-exp 'a) (var-exp 'b))) (var-exp 'c)))

