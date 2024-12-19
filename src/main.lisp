(uiop:define-package cl-noxpay
  (:use #:cl))
(in-package #:cl-noxpay)

(defparameter *URLBASE* "https://api2.noxpay.io")

(defun test-auth (apikey)
  (drakma:http-request
   (format nil "~A/test-auth" *URLBASE*) 
   :additional-headers `(("api-key" ,@apikey))))
