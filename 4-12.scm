;;; problem 4.12

;stuff from the book
(define (enclosing-environment env) (cdr env))
(define (first-frame env) (car env))
(define the-empty-environment '())

(define (make-frame variables values)
  (cons variables values))
(define (frame-variables frame) (car frame))
(define (frame-values frame) (cdr frame))
(define (add-binding-to-frame! var val frame)
  (set-car! frame (cons var (car frame)))
  (set-cdr! frame (cons val (cdr frame))))
  
(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
      (cons (make-frame vars vals) base-env)
      (if (< (length vars) (length vals))
          (error "Too many arguments supplied" vars vals)
          (error "Too few arguments supplied" vars vals))))

;answer
(define (find-in-frame frame var)
  (define (scan vars vals)
    (cond ((null? vars) #f)
	  ((eq? (car vars) var) (cons vars vals))
	  (else (scan (cdr vars) (cdr vals)))))
  (scan (frame-variables frame)
	(frame-values frame)))

(define (find-in-env env var)
  (define (scan-envs env)
    (cond  ((eq? the-empty-environment env) #f)
	   ((find-in-frame (first-frame env) var))
	   (else (scan-envs (enclosing-environment env)))))
  (scan-envs env))
  
(define (set-first-value! frame value)
  (set-car! (frame-values frame) value))
(define (first-value frame)
  (car (frame-values frame)))

(define (lookup-variable-value var env)
  (let ((frame-loc (find-in-env env var)))
    (if frame-loc
	(first-value frame-loc)
	(error "Unbound Variable" var))))
(define (set-variable-value! var val env)
  (let ((frame-loc (find-in-env env var)))
    (if frame-loc
	(set-first-value! frame-loc val)
	(error "Unbound variable" var))))

(define (define-variable! var val env)
  (let ((frame-loc (find-in-frame (first-frame env) var)))
    (if frame-loc
	(set-first-value! frame-loc val)
	(add-binding-to-frame! var val (first-frame env)))))





