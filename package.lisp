;;;; package.lisp

(cl:in-package cl-user)


(defpackage "https://github.com/g000001/srfi-111"
  (:use)
  (:export box box? unbox set-box! pair?))


(defpackage "https://github.com/g000001/srfi-111#internals"
  (:use 
   cl
   "https://github.com/g000001/srfi-111"
   named-readtables
   fiveam))


;;; *EOF*
