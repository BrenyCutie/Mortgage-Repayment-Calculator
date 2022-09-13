#lang racket
;;Brendan Quinn 21315205
;;Mortgage Payments
;;Calculate how many payments (Monthly/Yearly) that must be paid in order to complete a mortgage payment.

;;Check Inputs
;;(Check Mortgage 


;;Mortgage Amount
(define Mortgage 200000);;this can be a input value
(define MortgageChecker 9999999999999999999999999999999);test for "Check" (malformed Data)


;;Interest
(define MonthlyInterest 1.002);;Monthly interrest rate
(define YearlyInterest  1.02426576795);;Yearly Interest Rate
(define AngloIrishBankInterest 9.9999999);;Test for "Check" (malformed Data)

;;Repayments
(define MonthlyPayments 800);;Monthly Repayments
(define YearlyPayments 9600);;Yearly Repayments
(define StudentPayments 2) ;;Test for "Check" (malformed Data)



;;HOW IT WORKS 
;; x = Mortgage y = Interest  z = Payment (NOTE: If amount of monthly payments wanted, let x = Mortgage y = MonthlyInterest z = MonthlyPayments)
;; x = Mortgage y = Interest  z = Payment (NOTE: If amount of yearly payments wanted, let x = Mortgage y = YearlyInterest z = YearlyPayments)


;;Check Is a Checker to see if its possible to pay the Mortgage with a certain interest rate and fixed regular payments (Use this if unsure just to sav eyour memory)

(define Check (lambda (x y z)                    
                (if (<  (- (* x y) z) x)           ;;Interest is added to the mortgage at the start of the month. Payment is subtracted from this value. 
                    #t                                  ;;True if it is possible to complet mortgage ( Amount 1 < Mortgage)
                    #f)))                               ;;False if impossible to complete mortgage   ( Amount 1 > Mortgage)

                    

;;Count will count how many months it will take to repay the Mortgage with a certain interest rate and fixed regular payments (Suggested to use "Check" first)

(define Count (lambda ( x y z)                          
         (if ( <= ( - (* x y) z) 0)                      ;;Interest is added to the mortgage at the start of the month. Payment is subtracted from this value. See if this is <= 0.
               1                                         ;;If <= 0 Print 1 (Takes One Month/Year to pay the Mortgage) 
               (+( Count( - (* x y) z)y z)1))))          ;;Else add one every recursive sequence until Mortgage <= 0. (This adds to the amount of payments neccesary for Morgage to be <= 0)

;;HOW TO USE CHECK
;;(Check Mortgage YearlyInterest YearlyPayments)
;;(Check Mortgage MonthlyInterest MonthlyPayments)
;;(Check x y z)

;;HOW TO USE COUNT
;;(Count Mortgage MonthlyInterest MonthlyPayments)
;;(Count Mortgage YearlyInterest YearlyPayments)
;;(Count x y z)












