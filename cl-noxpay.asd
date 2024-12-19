(defsystem "cl-noxpay"
  :version "0.0.1"
  :author "Trumae da Ilha"
  :license "MIT"
  :depends-on (
               :drakma
               :jonathan
               )
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Noxpay payment solution client"
  :in-order-to ((test-op (test-op "cl-noxpay/tests"))))

(defsystem "cl-noxpay/tests"
  :author ""
  :license ""
  :depends-on ("cl-noxpay"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-noxpay"
  :perform (test-op (op c) (symbol-call :rove :run c)))
