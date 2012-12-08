(define f
  (let ((d 1))
    (lambda (x)
      (if (= x 0)
	  (begin (set! d 0)
		 d)
	  d))))
