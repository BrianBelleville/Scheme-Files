(define (make-table)
  (let ((table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) false)
	    ((equal? key (caar records)) (car records))
	    (else (assoc key (cdr records)))))
    (define (lookup key-list table)
      (let ((record (assoc (car key-list) (cdr table))))
	(if record
	    (cond ((null? (cdr key-list)) (cdr record))
		  (else (lookup (cdr key-list) record)))
	    false)))
    (define (insert! key-list value table)
      (if (pair? table)
	  (let ((record (assoc (car key-list) (cdr table))))
	    (if record
		(if (null? (cdr key-list))
		    (set-cdr! record value)
		    (insert! (cdr key-list) value record))
		(if (null? (cdr key-list))
		    (set-cdr! table
			      (cons (cons (car key-list) value)
				    (cdr table)))
		    (begin		
		      (set-cdr! table
				(cons (list (car key-list))
				      (cdr table)))
		      (insert! (cdr key-list) value (cadr table))))))
	  (begin
	    (set! table
		  (cons (list (car key-list
    (define (insert-interface! key-list value)
      (insert! key-list value table))
    (define (lookup-interface key-list)
      (lookup key-list table))
    (define (dispatch op)
      (cond ((eq? op 'insert!) insert-interface!)
	    ((eq? op 'lookup) lookup-interface)
	    (else (error "Undefined operation --make-table--" op))))
    dispatch))

(define (insert! key-list value table)
  ((table 'insert!) key-list value))
(define (lookup key-list table)
  ((table 'lookup) key-list))
			  
; if value found is not a table, but must extend it into a table
; if reach the end of the key list-how to return - return the value of table passed?




