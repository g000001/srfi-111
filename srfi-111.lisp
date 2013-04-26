;;;; srfi-111.lisp
(cl:in-package :srfi-111.internal)


;; Unique object in the cdr of a pair flags it as a box.
(cl:defconstant %box-flag (if (cl:boundp '%box-flag)
                              (cl:symbol-value '%box-flag)
                              (string-copy "box flag")))


;; Predicate
(define (box? x) (and (rnrs:pair? x) (eq? (cdr x) %box-flag)))


;; Constructor
(define (box x) (cons x %box-flag))


;; Accessor
(define (unbox x)
  (if (box? x)
    (car x)
    (error "Attempt to unbox non-box")))
    

;; Mutator
(define (set-box! x y)
  (if (box? x)
    (set-car! x y)
    (error "Attempt to mutate non-box")))


(define (pair? x)
  (and (rnrs:pair? x) (not (box? x))))


;;; *EOF*
