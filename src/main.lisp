(uiop:define-package cl-noxpay
  (:use #:cl))
(in-package #:cl-noxpay)

;;(assoc "balance" (account *APIKEY*) :test 'string-equal)
;;(setf drakma:*header-stream* *standard-output*)

(defparameter *URLBASE* "https://api2.noxpay.io")

(defun test-auth (apikey)
  (drakma:http-request
   (format nil "~A/test-auth" *URLBASE*) 
   :additional-headers `(("api-key" ,@apikey))))

(defun account (apikey)
  (jonathan:parse
   (babel:octets-to-string 
    (nth-value 0 (drakma:http-request
		  (format nil "~A/account" *URLBASE*) 
		  :additional-headers `(("api-key" ,@apikey)))))
   :as :alist))

(defun create-pixin (apikey amount code)
  (jonathan:parse
   (babel:octets-to-string 
    (nth-value 0 
	       (drakma:http-request
		(format nil "~A/payment" *URLBASE*) 
		:additional-headers `(("api-key" ,@apikey))
		:method :post
		:content (jonathan:to-json 
			  (list :|method| "PIX"
				:|amount| amount
				:|code| code))
		:content-type "application/json"
		:external-format-in :utf8
		:external-format-out :utf8)))
   :as :alist))
    


(defun payment (apikey txid)
  (jonathan:parse
   (babel:octets-to-string
    (nth-value 0 (drakma:http-request
		  (format nil "~A/payment/~A" *URLBASE* txid) 
		  :additional-headers `(("api-key" ,@apikey)))))
   :as :alist))

;; NOX9D7DIY4IIGK07M2KWJN9OOBHSI3IV
