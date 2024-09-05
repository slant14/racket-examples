#lang slideshow

(define on 1)
(define height 20)
(define width 20)

(define (render-bit bit)
  (if (= bit on)
      (filled-rectangle width height)
      (rectangle width height)))

(define (render-bits bits)
  (cond
    [(empty? bits) empty]  
    [(empty? (rest bits)) (render-bit (first bits))] 
    [else
     (hc-append (render-bit (first bits))  
                (render-bits (rest bits)))])) 
;; usage
(render-bits '(1 0 1 1 0 1 0 0 1))
