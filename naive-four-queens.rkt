(define (generate-combinations n start end)
  (if (= n 0)
      '(())
      (apply append
             (for-range start end
                        (lambda (i)
                          (map (lambda (rest)
                                 (cons i rest))
                               (generate-combinations (- n 1) start end)))))))


(define (naive-four-queens)
  (define columns '(1 2 3 4))  
  (define all-rows (generate-combinations 4 1 5))
  (define solutions
    (filter no-attacks?
            (map (lambda (rows)
                   (map list columns rows))
                 all-rows)))
  solutions)


(naive-four-queens)
