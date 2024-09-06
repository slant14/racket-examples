#lang racket


(define (count-ones bits)
  (define (count-ones-explicit bits ans)
    (if (null? bits)  
        ans
        (count-ones-explicit (rest bits)  
                            (if (= (car bits) 1) 
                                (+ ans 1)         
                                ans))))            
  (count-ones-explicit bits 0))  


(count-ones '(1 0 1 1 0 1 1 1 0))  
