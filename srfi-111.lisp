;;;; srfi-111.lisp
(cl:in-package :srfi-111.internal)

(cl:eval-when (:compile-toplevel :load-toplevel :execute)
  (cl:defstruct (box (:constructor box (obj))
                     (:predicate box?)
                     (:print-object (cl:lambda (obj stream)
                                      (cl:format stream "#&~S" (unbox obj)))))
    obj))


(cl:defmethod cl:make-load-form ((self box) cl:&optional env)
  (cl:declare (cl:ignore env))
  `(box ,(box-obj self)))

;; Accessor   
(define unbox #'box-obj)


;; Mutator
(define set-box! 
  (lambda (box val) (cl:setf (box-obj box) val)))


;;; *EOF*
