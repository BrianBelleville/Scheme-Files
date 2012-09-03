;;; 4-1.scm
;;; some of the problems from section 4.1

;;;problem 4-1.scm
;;;left to right list-of-values
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((first-val (eval (first-operand exps) env)))
	(cons first-val (list-of-values (rest-operands exps) env)))))
;test procedures to make sure that works how I think it does
(define (list-values exps)
  (if (null? exps)
      '()
      (cons ((car exps)) (list-values (cdr exps)))))
(define (left-right exps)
  (if (null? exps)
      '()
      (let ((first ((car exps))))
	(cons first (left-right (cdr exps))))))
(define (right-left exps)
  (if (null? exps)
      '()
      (let ((rest (right-left (cdr exps))))
	(cons ((car exps)) rest))))
(define test
  (let ((x 0))
    (lambda ()
      (set! x (+ x 1))
      x)))


;;;excercise 4.3
(define (eval exp env)
  (define (type e)
    (car e))
  (cond ((self-evaluating? exp) exp)
	((variable? exp)
	 (lookup-variable-value exp env))
	((pair? exp)
	 (let ((proc (get 'eval (type exp))))
	   (if proc
	       (proc exp env)
	       (apply (eval (operator exp) env)
		      (list-of-values (operands exp) env)))))
	(else (error "unknown expression type -- eval" exp))))

;;;excercise 4.4
;;;implement and & or as special forms

;add the following clause to cond in eval
;((and? exp) (eval-and exp env))
;((or? exp) (eval-or exp env))

;implementation of eval-and and eval-or
(define (last-exp? exps env)
  (null? (cdr exps)))

(define (eval-and exp env)
  (define (eval-and-itr exp env)
    (cond ((null? exp) 'true)
	  ((last-exp? exp) (eval (car exp) env))
	  (else (let ((res (eval (car exp) env)))
		  (if (true? res)
		      (eval-and-itr (cdr exp) env)
		      res)))))
  (eval-and-iter (cdr exp) env))

(define (eval-or exp env)
  (define (eval-or-itr exp env)
    (cond ((null? exp) 'false)
	  ((last-exp? exp) (eval (car exp) env))
	  (else (let ((res (eval (car exp) env)))
		  (if (true? res)
		      res
		      (eval-or-itr (cdr exp) env))))))
  (eval-or-itr (cdr exp) env))

;implement as derived forms
(define (and-exps exp) (cdr exp))
(define (and->lambda exp) (expand-and (and-exps exp)))
(define (make-and-procedure exp) (list (and->lambda exp)))
(define (last-exp? exp) (null? (cdr exp)))
(define (make-a e n)
  (list (make-lambda '(x y)
	       (make-if 'x '(y) 'x)) e n))
(define (expand-and exp)
  (cond ((null? exp) (make-lambda () 'true))
	((last-exp? exp) (make-lambda () (car exp)))
	(else (make-lambda () (make-a (car exp)
				      (expand-and (cdr exp)))))))
;add this clause to eval:
;((and? exp) (eval (make-and-procedure exp) env))
;stuff from book:
(define (make-lambda parameters body)
  (list 'lambda  parameters body))
(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))


