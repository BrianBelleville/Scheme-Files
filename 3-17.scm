;;;this is excercise 3.17
;;;brian belleville
;;;4 april 2012


(define (count-pairs x)
  (define pair-list (list))
  (define (counted? y already-counted)
    (cond ((null? already-counted) #f)
	  ((equal? (car already-counted) y) #t)
	  (else (counted? y (cdr already-counted)))))
  (define (add-to-pair-list! x)
    (set! pair-list (cons x pair-list)))
  (define (count x)
    (if (not (pair? x))
	0
	(+ (count (car x))
	   (count (cdr x))
	   (if (counted? x pair-list)
	       0
	       (begin (add-to-pair-list! x)
		      1)))))
  (count x))




































