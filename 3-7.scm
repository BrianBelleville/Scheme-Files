(define (make-account balance password)
  (define pword-list (list password))
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (add-password new-password)
    (set! pword-list (cons new-password pword-list))
    (display pword-list))
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  ((eq? m 'add-password) add-password)
	  (else (error "Unkown request -- MAKE-ACCOUNT"
		       m))))
  (define (password-match? guess password-list)
    (cond ((eq? '()  password-list) #f)
	  ((eq? guess (car password-list)) #t)
	  (else (password-match? guess (cdr password-list)))))
  (lambda (pword op)
    (if (password-match? pword pword-list)(dispatch op)
	(lambda (val) "Incorect Password"))))

(define (make-joint account old-password new-password)
  ((account old-password 'add-password) new-password)
  account)









