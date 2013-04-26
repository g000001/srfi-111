(cl:in-package :srfi-111.internal)


(in-readtable :srfi-111)


(test stx-box?
  (is-false (box? (list 42)))
  (is-false (box? 42))
  (is-true (box? #&#&42)))


(test stx-unbox
  (let ((obj '#:foo))
    (is-true (eq? obj (unbox #&obj)))
    (signals (cl:error) 
      (unbox (list 0)))))


(test stx-set-box!
  (let ((b #&0))
    (set-box! b 42)
    (is (= 42 (unbox b)))
    (signals (cl:error) 
      (set-box! (list 0) 42))))


(test pair?
  (is-false (pair? #&42))
  (is-false (pair? 42))
  (is-true (pair? (list 42))))


;;; *EOF*
