#lang racket


(define (for-range start end func)
  (map func (build-list (+ (- end start) 1) (lambda (i) (+ start i)))))


(for-range 1 5 (lambda (x) (* x x))) 
(for-range 3 7 (lambda (x) (+ x 10))) 



(define (for-range-2D x-start x-end y-start y-end func)
  (map (lambda (x)
         (map (lambda (y)
                (func x y))
              (build-list (+ (- y-end y-start) 1) (lambda (j) (+ y-start j)))))
       (build-list (+ (- x-end x-start) 1) (lambda (i) (+ x-start i)))))


(for-range-2D 1 3 1 2 (lambda (x y) (+ (* x 10) y)))
