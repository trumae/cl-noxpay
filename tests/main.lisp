(defpackage cl-noxpay/tests/main
  (:use :cl
        :cl-noxpay
        :rove))
(in-package :cl-noxpay/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-noxpay)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
