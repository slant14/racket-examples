#lang racket

(define (attacks2? q1 q2)
  (define attack-checker
    (list
     (lambda (q1 q2) (= (first q1) (first q2)))
     (lambda (q1 q2) (= (second q1) (second q2)))
     (lambda (q1 q2) (= (abs (- (first q1) (first q2)))
                        (abs (- (second q1) (second q2)))))
     ))
  (ormap (lambda (f) (f q1 q2)) attack-checker))

(define (attacks? q1 q2)
  (or
   (= (first q1) (first q2))
   (= (second q1) (second q2))
   (= (abs (- (first q1) (first q2)))
                        (abs (- (second q1) (second q2))))))

(attacks? '(1 5) '(1 3))
(attacks? '(5 1) '(3 1))
(attacks? '(1 2) '(3 4))
(attacks? '(1 5) '(2 3))


(define (attacks-any? q qs)
  (ormap (lambda (other-q) (attacks? q other-q)) qs))




(define q1 '(1 1))
(define q2 '(3 2))
(define q3 '(6 4))
(define q4 '(5 7))
(define qs1 (list q1 q2 q3 q4))

(no-attacks? qs1)
