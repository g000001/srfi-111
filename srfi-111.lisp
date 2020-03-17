;;;; srfi-111.lisp
(cl:in-package "https://github.com/g000001/srfi-111#internals")


(eval-when (:compile-toplevel :load-toplevel :execute)
  (defstruct (box (:constructor box (obj))
                  (:predicate box?)
                  (:print-object (lambda (obj stream)
                                   (format stream "#&~S" (unbox obj)))))
    obj))


(defmethod make-load-form ((self box) &optional env)
  (declare (ignore env))
  `(box ,(box-obj self)))


;; Accessor   
(declaim (inline unbox))
(defun unbox (obj)
  (Box-Obj obj))


;; Mutator
(declaim (inline set-box!))
(defun set-box! (box val)
  (setf (box-obj box) val))


;;; *EOF*
