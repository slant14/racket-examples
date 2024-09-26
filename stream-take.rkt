#lang racket
(require racket/stream)

(define numbers (stream-cons 1 (stream-cons 2 (stream-cons 3 (stream-cons 4 empty-stream)))))

(stream-first numbers)
(stream-first(stream-rest numbers))
(stream->list numbers)



(define (stream-take n s)
  (cond
    [(stream-empty? s) empty-stream]
    [(<= n 0) empty-stream]
    [else
     (stream-cons (stream-first s) (stream-take (- n 1) (stream-rest s)))]
    ))

(define nums (stream-cons 1 (stream-cons 2 (stream-cons 3 (stream-cons 4 empty-stream)))))

(define (natural-stream n)
  (stream-cons n (natural-stream (+ 1 n))))

(stream->list (stream-take 50 (natural-stream 0)))

(define appended-stream (stream-append (stream-take 10 (natural-stream 0)) nums))
(stream->list appended-stream)
