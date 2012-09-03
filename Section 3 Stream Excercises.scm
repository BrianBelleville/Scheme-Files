;;; things from book to setup environment
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define (display-lines n s)
  (if (= n 0)
      'done
      (begin (display-line (stream-car s))
	     (display-lines (- n 1) (stream-cdr s)))))

(define (display-line x)
  (newline)
  (display x))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
	((stream-null? s2) s1)
	(else
	 (let ((s1car (stream-car s1))
	       (s2car (stream-car s2)))
	   (cond ((< s1car s2car)
		  (cons-stream s1car (merge (stream-cdr s1) s2)))
		 ((> s1car s2car)
		  (cons-stream s2car (merge s1 (stream-cdr s2))))
		 (else
		  (cons-stream s1car
			       (merge (stream-cdr s1)
				      (stream-cdr s2)))))))))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

;;; excercise 3.50
;;; 15 april 2012
(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
	(apply proc (map stream-car argstreams))
	(apply stream-map
	       (cons proc (map stream-cdr argstreams))))))

;;; excercise 3.55
;;; 15 april 2012
(define (partial-sums s)
  (define r (cons-stream (stream-car s)
			 (add-streams (stream-cdr s) r)))
  r)

;;;excercise 3.67
;;;23 april 2012
(define (pairs2 s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave3
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (stream-map (lambda (x) (list x (stream-car t)))
		(stream-cdr s))
    (pairs2 (stream-cdr s) (stream-cdr t)))))

(define (interleave3 s1 s2 s3)
  (if (stream-null? s1)
      (interleave s2 s3)
      (cons-stream (stream-car s1)
		   (interleave3 s2 s3 (stream-cdr s1)))))

;; stuff from book related to excercise 3.67
(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))
(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))










