(define (an-integer-between low high)
  (require (<= low high))
  (amb low (an-integer-between (+ 1 low) high)))

(define (triples)
  (let ((k (an-integer-starting-from 1)))
    (let ((i (an-integer-between 1 k)))
      (let ((j (an-integer-between i k)))
	(list i j k)))))
(define (a-pythagorean-triple)
  (let ((t (triples)))
    (let ((i (car t))
	  (j (car (cdr t)))
	  (k (car (cdr (cdr t)))))
      (require (= (+ (* i i) (* j j)) (* k k)))
      (list i j k))))

(define (require pred)
  (if (not pred)
      (amb)))
(define (an-integer-starting-from n)
  (amb n (an-integer-starting-from (+ n 1))))

try-again
