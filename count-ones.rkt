#lang racket


(define (count-ones-helper bits ans)
  (cond
    [(empty? bits) ans]  
    [(= (first bits) 1) (count-ones-helper (rest bits) (+ 1 ans))]  
    [else (count-ones-helper (rest bits) ans)]))  


(define (count-ones bits)
  (count-ones-helper bits 0))  


(count-ones '(1 0 1 1 0))  
