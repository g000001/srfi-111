;;;; srfi-111.asd -*- Mode: Lisp;-*- 

(cl:in-package :asdf)


(defsystem :srfi-111
  :serial t
  :depends-on (:fiveam
               :named-readtables
               :rnrs-compat)
  :components ((:file "package")
               #+:named-readtables (:file "readtable")
               (:file "srfi-111")
               (:file "test")
               #+:named-readtables (:file "test-syntax")))


(defmethod perform ((o test-op) (c (eql (find-system :srfi-111))))
  (load-system :srfi-111)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :srfi-111.internal :srfi-111))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))

