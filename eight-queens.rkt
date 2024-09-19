(define (all-pairs lst)
  (if (null? lst)
      '()
      (append (map (lambda (x) (list (first lst) x)) (rest lst))
              (all-pairs (rest lst)))))


(define (valid-arrangement? positions)
  (not (ormap (lambda (pair)
                (attacks? (first pair) (second pair)))
              (all-pairs positions))))


(define (eight-queens)
  (define columns '(1 2 3 4 5 6 7 8))  ; Columns from 1 to 8
  (for/first ([rows (in-permutations columns)]
              #:when (let ((positions (map list columns rows)))
                       (valid-arrangement? positions)))
    (map list columns rows)))


(define solution (eight-queens))


(display "One solution to the Eight Queens puzzle:")
(newline)
(display solution)
(newline)

(define (print-board arrangement)
  (define board-size 8)
  (define queen-positions
    (make-hash (map (lambda (q) (cons (first q) (second q))) arrangement)))
  (for ([row (range 1 (+ board-size 1))])
    (for ([col (range 1 (+ board-size 1))])
      (if (= (hash-ref queen-positions col #f) row)
          (display "Q ")
          (display ". ")))
    (newline))
  (newline))


(print-board solution)
