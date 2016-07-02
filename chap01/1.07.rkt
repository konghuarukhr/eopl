#lang eopl

(define nth-element
  (lambda (lst n)
    (letrec ((report-list-too-short
              (lambda ()
                (eopl:error 'nth-element
                            "~s does not have ~s elements.~%" lst (+ n 1))))
             (nth-element-inner
              (lambda (lst n)
                (if (null? lst)
                    (report-list-too-short)
                    (if (zero? n)
                        (car lst)
                        (nth-element-inner (cdr lst) (- n 1)))))))
      (nth-element-inner lst n))))
