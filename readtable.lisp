;;;; readtable.lisp

(cl:in-package "https://github.com/g000001/srfi-111#internals")


(in-readtable :common-lisp)


(defreadtable :srfi-111
  (:merge :standard)
  (:dispatch-macro-char #\# #\&
                        (lambda (s c a)
                          (cl:declare (cl:ignore c a))
                          (box (cl:read s cl:T cl:nil cl:T))))
  (:case :upcase))


;;; *EOF*
