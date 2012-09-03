(define (memoize fn)
  (let ((cache (make-hash-table)))
    (lambda args
      (hash-table-ref cache args (lambda ()
				   (let ((val (apply fn args)))
				     (hash-table-set! cache args val)
				     val))))))
(define memo-fib 
  (memoize (lambda (n)
	     (cond ((= n 0) 0)
		   ((= n 1) 1)
		   (else (+ (memo-fib (- n 1))
			    (memo-fib (- n 2))))))))

(define fib-rec
  (lambda (n)
	     (cond ((= n 0) 0)
		   ((= n 1) 1)
		   (else (+ (fib-rec (- n 1))
			    (fib-rec (- n 2)))))))

(define fib-iter
  (lambda (n)
    (letrec ((iter (lambda (cur prev count)
		     (if (= count 0)
			 prev
			 (iter (+ cur prev) cur (- count 1))))))
      (iter 1 0 n))))

(define fib-iter-imperative
  (lambda (n)
    (letrec ((cur 1)
	     (prev 0)
	     (iter (lambda ()
		     (cond ((= n 0) prev)
			   ((= n 1) cur)
			   (else (let ((temp cur))
				   (set! cur (+ cur prev))
				   (set! prev temp)
				   (set! n (- n 1))
				   (iter)))))))
      (iter))))
