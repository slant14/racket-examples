#lang racket


(define (my-remove-duplicates lst)
  (foldr (lambda (x acc)
           (if (null? (filter (lambda (y) (equal? x y)) acc))
               (cons x acc)
               acc))
         '()
         lst))


(define (my-remove-duplicates2 lst)
  (if (null? lst)
      '()  
      (cons (first lst)
            (my-remove-duplicates
             (filter (lambda (x) (not (equal? x (first lst)))) (rest lst))))))





(define (my-remove-duplicates-with lst predicate)
  (foldr (lambda (x acc)
           (if (null? (filter (lambda (y) (predicate x y)) acc))
               (cons x acc)
               acc))
         '()
         lst))


(define (my-equal x y) (= x y))



(my-remove-duplicates '(1 2 2 3 4 1 5 6 6 1 3 8))
(my-remove-duplicates2 '(1 2 2 3 4 1 5 6 6 1 3 8))
(my-remove-duplicates-with '(1 2 2 3 4 1 5 6 6 1 3 8) my-equal)
