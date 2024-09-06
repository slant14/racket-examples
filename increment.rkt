#lang racket


(define (reverse lst)
  (define (reverse-helper lst ans)
    (cond
      [(null? lst) ans]
      [else (reverse-helper (rest lst) (cons (car lst) ans))]))
  (reverse-helper lst '()))

(define (increment binary)
  (define (increment-helper bits carry)
    (cond
      [(null? bits) 
       (if carry
           (cons 1 '())  
           '())]
      [(= (car bits) 0)
       (cons (if carry 1 0) (increment-helper (rest bits) #f))]
      [(= (car bits) 1)
       (cons (if carry 0 1) (increment-helper (rest bits) #t))]))  
  (reverse (increment-helper (reverse binary) #t)))

(increment '(0 0 1))
