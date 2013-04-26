;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :srfi-111
  (:use)
  (:export :box :box? :unbox :set-box! :pair?))


(defpackage :srfi-111.internal
  (:use :srfi-111 :rnrs :named-readtables :fiveam)
  (:shadow :pair?)
  (:import-from :cl :error))

