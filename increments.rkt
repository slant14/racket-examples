#lang racket

(define (increments start n)
  (define (to-binary-list num)
    (if (= num 0)
        '(0)
        (reverse (to-binary-list-helper num '()))))
  
  (define (to-binary-list-helper num ans)
    (if (= num 0)
        ans
        (to-binary-list-helper (quotient num 2)
                               (cons (remainder num 2) ans))))
  
  (define (format-binary binary-list)
    (apply string-append (map (lambda (bit) (if (= bit 0) "0" "1")) binary-list)))

  (define (generate-binaries start n)
    (map (lambda (i) (format-binary (to-binary-list (+ start i))))
         (range n)))
  
  (generate-binaries start n))


(increments 5 4)

