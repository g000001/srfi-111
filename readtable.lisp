;;;; readtable.lisp

(cl:in-package :srfi-111.internal)
(in-readtable :common-lisp)

(defreadtable :srfi-111
  (:merge :standard)
  (:dispatch-macro-char #\# #\&
                        (lambda (s c a)
                          (cl:declare (cl:ignore c a))
                          `(srfi-111:box ',(cl:read s cl:T cl:nil cl:T))))
  (:case :upcase))
