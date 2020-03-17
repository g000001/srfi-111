(cl:in-package "https://github.com/g000001/srfi-111#internals")


(in-readtable :srfi-111)


(test stx-box?
  (is-false (box? (list 42)))
  (is-false (box? 42))
  (is-true (box? '#&#&42)))


(test stx-unbox
  (is-true (eq? 42 (unbox '#&42)))
  (signals (cl:error) 
    (unbox (list 0))))


(test stx-set-box!
  (let ((b #&0))
    (set-box! b 42)
    (is (= 42 (unbox b)))
    (signals (cl:error) 
      (set-box! (list 0) 42))))


;;; *EOF*
