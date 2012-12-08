(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (make-joint new-password)
   (acc new-password))
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  ((eq? m 'make-joint) make-joint)
	  (else (error "Unkown request -- MAKE-ACCOUNT"
		       m))))
  (define (acc password) 
    (lambda (pword op)
    (if (eq? pword password)(dispatch op)
	(lambda (val) "Incorect Password"))))
  (acc password))

(define (make-joint account old-password new-password)
  ((account old-password 'make-joint) new-password))









