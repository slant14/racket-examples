#lang racket

(define (attacks-any? q qs)
  (ormap (lambda (other-q) (attacks? q other-q)) qs))

(define (add-queen-at arrangements column)
  (apply append
         (map (lambda (arrangement)
                (let ((safe-rows
                       (filter (lambda (row)
                                 (not (attacks-any? (list column row) arrangement)))
                               (range 1 9))))    
                  (map (lambda (row)
                         (cons (list column row) arrangement))
                       safe-rows)))
              arrangements)))


(define example-arrangements
  '(((2 3) (1 1) (3 6))))


(add-queen-at example-arrangements 4)
