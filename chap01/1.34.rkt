#lang eopl

(define path
  (lambda (n bst)
    (if (null? bst)
        '()
        (let ((cur (car bst))
              (l (cadr bst))
              (r (caddr bst)))
          (cond
            ((> n cur) (cons 'right (path n r)))
            ((< n cur) (cons 'left (path n l)))
            (else '()))))))
