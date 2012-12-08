Copyright (C) 2011 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Saturday October 15, 2011 at 8:30:48 PM
  Release 9.1 || Microcode 15.1 || Runtime 15.7 || Win32 1.8 || SF 4.41 || LIAR/i386 4.118 || Edwin 3.116

;You are in an interaction window of the Edwin editor.
;Type `C-h' for help, or `C-h t' for a tutorial.
;`C-h m' will describe some commands.
;`C-h' means: hold down the Ctrl key and type `h'.
;Package: (user)
(define nil ())
;Value: nil

nil
;Value: ()

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
;Value: enumerate-interval

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)(append (cdr list1) list2))))
;Value: append

(append (enumerate-interval 1 3)(enumerate-interval 5 10))
;Value 12: (1 2 3 5 6 7 8 9 10)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))
;Value: map

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
;Value: flatmap

(flatmap (lambda (i) (list i 9)) (enumerate-interval 1 5))
;Value 15: (1 9 2 9 3 9 4 9 5 9)

;Value 14: ((1 9) (2 9) (3 9) (4 9) (5 9))

;The procedure #[arity-dispatched-procedure 13] has been called with 0 arguments; it requires at least 1 argument.
;To continue, call RESTART with an option number:
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;The object -5, passed as the first argument to cdr, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 2) => Specify an argument to use in its place.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define empty-board nil)
;Value: empty-board

empty-board
;Value: ()

(list empty-board)
;Value 16: (())

(define (adjoin-position new-row k rest-of-queens)
  (append (list new-row) rest-of-queens))
;Value: adjoin-position

;Value: adjoin-position

;Value: adjoin-position

;Value: adjoin-position

(adjoin-position (list empty-board) 5 (list 1 3 2))
;Value 19: (1 3 2 ())

;Value 18: (1 3 2 4)

;Value 17: (1 3 2 . 4)

;The object 1 is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 8) => Specify a procedure to use in its place.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;The object 1 is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 7) => Specify a procedure to use in its place.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;The object 1 is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 6) => Specify a procedure to use in its place.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;The object 1 is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 5) => Specify a procedure to use in its place.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;The object 1 is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a procedure to use in its place.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (test k rest-of-queens board-size)
(map (lambda (new-row)
       (adjoin-position new-row k rest-of-queens))
     (enumerate-interval 1 board-size)))
;Value: test

;Value: test

(test 0 (list 5 1 6 0 3 7 4) 8)
;Value 21: ((5 1 6 0 3 7 4 1) (5 1 6 0 3 7 4 2) (5 1 6 0 3 7 4 3) (5 1 6 0 3 7 4 4) (5 1 6 0 3 7 4 5) (5 1 6 0 3 7 4 6) (5 1 6 0 3 7 4 7) (5 1 6 0 3 7 4 8))

;Value 20: ((5 1 6 0 3 7 4 . 1) (5 1 6 0 3 7 4 . 2) (5 1 6 0 3 7 4 . 3) (5 1 6 0 3 7 4 . 4) (5 1 6 0 3 7 4 . 5) (5 1 6 0 3 7 4 . 6) (5 1 6 0 3 7 4 . 7) (5 1 6 0 3 7 4 . 8))

;Unbound variable: i
;To continue, call RESTART with an option number:
; (RESTART 10) => Specify a value to use instead of i.
; (RESTART 9) => Define i to a given value.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))
;Value: filter

;Value: filter

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))
;Value: queens

;Value: queens

;Value: queens

(define (safe? k positions)
  #t)
;Value: safe?

(queens 3)
;Unbound variable: =k
;To continue, call RESTART with an option number:
; (RESTART 11) => Specify a value to use instead of =k.
; (RESTART 10) => Define =k to a given value.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(queens 3)
;Unbound variable: -k
;To continue, call RESTART with an option number:
; (RESTART 12) => Specify a value to use instead of -k.
; (RESTART 11) => Define -k to a given value.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(queens 3)
;Value 22: ((1 1 1) (2 1 1) (3 1 1) (1 2 1) (2 2 1) (3 2 1) (1 3 1) (2 3 1) (3 3 1) (1 1 2) (2 1 2) (3 1 2) (1 2 2) (2 2 2) (3 2 2) (1 3 2) (2 3 2) (3 3 2) (1 1 3) (2 1 3) (3 1 3) (1 2 3) (2 2 3) (3 2 3) (1 3 3) (2 3 3) (3 3 3))

(define (safe? k positions)
  (define (is-safe distance loc-new rest)
    (cond ((null? rest)
	   #t)
	  ((or (= loc-new (car rest)) (= loc-new (+ (car rest) distance)) (= loc-new (- (car rest) distance)))
	   #f)
	  (else
	   (is-safe (+ distance 1) loc-new (cdr rest)))))
  (is-safe 1 (car positions) (cdr positions)))
;Value: safe?

;Value: safe?

(safe? 4 (list 6 2 7 1 4 8 5 3))
;Value: #t

;Value: #t

;Value: #f

;Value: #f

;Value: #f

;Unbound variable: safe
;To continue, call RESTART with an option number:
; (RESTART 14) => Specify a value to use instead of safe.
; (RESTART 13) => Define safe to a given value.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): ?
;Start debugger? (y or n): ?
;Start debugger? (y or n): n

	   
(queens 3)
;Value: ()

(queens 4)
;Value 23: ((3 1 4 2) (2 4 1 3))

(queens 8)
;Value 24: ((4 2 7 3 6 8 5 1) (5 2 4 7 3 8 6 1) (3 5 2 8 6 4 7 1) (3 6 4 2 8 5 7 1) (5 7 1 3 8 6 4 2) (4 6 8 3 1 7 5 2) (3 6 8 1 4 7 5 2) (5 3 8 4 7 1 6 2) (5 7 4 1 3 8 6 2) (4 1 5 8 6 3 7 2) (3 6 4 1 8 5 7 2) (4 7 5 3 1 6 8 2) (6 4 2 8 5 7 1 3) (6 4 7 1 8 2 5 3) (1 7 4 6 8 2 5 3) (6 8 2 4 1 7 5 3) (6 2 7 1 4 8 5 3) (4 7 1 8 5 2 6 3) (5 8 4 1 7 2 6 3) (4 8 1 5 7 2 6 3) (2 7 5 8 1 4 6 3) (1 7 5 8 2 4 6 3) (2 5 7 4 1 8 6 3) (4 2 7 5 1 8 6 3) (5 7 1 4 2 8 6 3) (6 4 1 5 8 2 7 3) (5 1 4 6 8 2 7 3) (5 2 6 1 7 4 8 3) (6 3 7 2 8 5 1 4) (2 7 3 6 8 5 1 4) (7 3 1 6 8 5 2 4) (5 1 8 6 3 7 2 4) (1 5 8 6 3 7 2 4) (3 6 8 1 5 7 2 4) (6 3 1 7 5 8 2 4) (7 5 3 1 6 8 2 4) (7 3 8 2 5 1 6 4) (5 3 1 7 2 8 6 4) (2 5 7 1 3 8 6 4) (3 6 2 5 8 1 7 4) (6 1 5 2 8 3 7 4) (8 3 1 6 2 5 7 4) (2 8 6 1 3 5 7 4) (5 7 2 6 3 1 8 4) (3 6 2 7 5 1 8 4) (6 2 7 1 3 5 8 4) (3 7 2 8 6 4 1 5) (6 3 7 2 4 8 1 5) (4 2 7 3 6 8 1 5) (7 1 3 8 6 4 2 5) (1 6 8 3 7 4 2 5) (3 8 4 7 1 6 2 5) (6 3 7 4 1 8 2 5) (7 4 2 8 6 1 3 5) (4 6 8 2 7 1 3 5) (2 6 1 7 4 8 3 5) (2 4 6 8 3 1 7 5) (3 6 8 2 4 1 7 5) (6 3 1 8 4 2 7 5) (8 4 1 3 6 2 7 5) (4 8 1 3 6 2 7 5) (2 6 8 3 1 4 7 5) (7 2 6 3 1 4 8 5) (3 6 2 7 1 4 8 5) (4 7 3 8 2 5 1 6) (4 8 5 3 1 7 2 6) (3 5 8 4 1 7 2 6) (4 2 8 5 7 1 3 6) (5 7 2 4 8 1 3 6) (7 4 2 5 8 1 3 6) (8 2 4 1 7 5 3 6) (7 2 4 1 8 5 3 6) (5 1 8 4 2 7 3 6) (4 1 5 8 2 7 3 6) (5 2 8 1 4 7 3 6) (3 7 2 8 5 1 4 6) (3 1 7 5 8 2 4 6) (8 2 5 3 1 7 4 6) (3 5 2 8 1 7 4 6) (3 5 7 1 4 2 8 6) (5 2 4 6 8 3 1 7) (6 3 5 8 1 4 2 7) (5 8 4 1 3 6 2 7) (4 2 5 8 6 1 3 7) (4 6 1 5 2 8 3 7) (6 3 1 8 5 2 4 7) (5 3 1 6 8 2 4 7) (4 2 8 6 1 3 5 7) (6 3 5 7 1 4 2 8) (6 4 7 1 3 5 2 8) (4 7 5 2 6 1 3 8) (5 7 2 6 3 1 4 8))


