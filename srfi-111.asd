;;;; srfi-111.asd -*- Mode: Lisp;-*- 

(cl:in-package asdf)


(defsystem srfi-111
  :version "20200318"
  :description "Srfi 111 For CL: Boxes"
  :long-description "Srfi 111 For CL: Boxes
https://srfi.schemers.org/srfi-111"
  :author "CHIBA Masaomi"
  :maintainer "CHIBA Masaomi"
  :serial t
  :depends-on (fiveam
               named-readtables
               rnrs-compat)
  :components ((:file "package")
               (:file "readtable")
               (:file "srfi-111")
               (:file "test")
               (:file "test-syntax")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-111))))
  (let ((name "https://github.com/g000001/srfi-111")
        (nickname :srfi-111))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


(defmethod perform ((o test-op) (c (eql (find-system :srfi-111))))
  (let ((*package*
         (find-package
          "https://github.com/g000001/srfi-111#internals")))
    (eval
     (read-from-string
      "
      (or (let ((result (run 'srfi-111)))
            (explain! result)
            (results-status result))
          (error \"test-op failed\") )"))))


;;; *EOF*
