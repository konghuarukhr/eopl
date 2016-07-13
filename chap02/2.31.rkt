#lang eopl

(define-datatype prefix-exp prefix-exp?
  (const-exp
   (num integer?))
  (diff-exp
   (operand1 prefix-exp?)
   (operand2 prefix-exp?)))

(define parse-expression-inner
  (lambda (datum)
    (if (and (list? datum) (not (null? datum)))
        (cond
          ((integer? (car datum)) (cons (const-exp (car datum)) (cdr datum)))
          ((eqv? '- (car datum))
           (let ((left (parse-expression-inner (cdr datum))))
             (let ((right (parse-expression-inner (cdr left))))
               (cons (diff-exp (car left) (car right)) (cdr right)))))
          (else (eopl:error 'parse-expression-inner "SYNTAX ERROR: ~s" datum)))
        (eopl:error 'parse-expression-inner "SYNTAX ERROR: ~s" datum))))

(define parse-expression
  (lambda (datum)
    (car (parse-expression-inner datum))))

(parse-expression-inner '(- - 1 2 3))
(parse-expression-inner '(- - 3 2 - 4 - 12 7))

(equal?
 (parse-expression '(- - 3 2 - 4 - 12 7))
 (diff-exp
  (diff-exp
   (const-exp 3)
   (const-exp 2))
  (diff-exp
   (const-exp 4)
   (diff-exp
    (const-exp 12)
    (const-exp 7)))))