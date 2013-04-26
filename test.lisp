(cl:in-package :srfi-111.internal)

(def-suite srfi-111)

(in-suite srfi-111)


(test box?
  (is-true (box? (box 42)))
  (is-false (box? (list 42)))
  (is-false (box? 42))
  (is-true (box? (box (box 42)))))


(test unbox
  (let ((obj '#:foo))
    (is-true (eq? obj (unbox (box obj))))
    (signals (cl:error) 
      (unbox (list 0)))))


(test set-box!
  (let ((b (box 0)))
    (set-box! b 42)
    (is (= 42 (unbox b)))
    (signals (cl:error) 
      (set-box! (list 0) 42))))


(test pair?
  (is-false (pair? (box 42)))
  (is-false (pair? 42))
  (is-true (pair? (list 42))))


;;; *EOF*
