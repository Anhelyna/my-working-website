;simple banking system 

; account number generator (counter)
; generates unique account numbers
(define make-counter
  (lambda()
    (let ((n 0))
      (lambda()
      (set! n(+ n 1))
        n))))

(define count (make-counter))

;first bank deposit for the account
(define toster 100)

; account constructor
; creates a bank account 
(define make-account
  (lambda (n name)
    (let ((bal n)
          (acc-number (string-append "A" (number->string (count)))))
      (lambda msg
        (case (car msg)

          ((get-name)
           (display "Account name is - ")
           name)

          ((get-account-number)
           acc-number)
          
          ((deposit)
             (set! bal (+ bal (cadr msg)))
             (display "Your balance is: ")
             bal)
          
          ((withdraw)
           (if (>= bal (cadr msg))
                (begin
                 (set! bal (- bal (cadr msg)))
                 (display "After withdraw your balance is: ")
                 (display bal)
                 )
               (begin
                 (display "Sorry! The amount you want to withdraw is bigger than your balance")
                 )))          
          ((get-ballance)
            bal)
          ((log-out)
           (begin
           (display "Good Buy, ")
            (display name)
          (display" ! ")
          (newline)
          (display"If you would like to interact with the bank please log-in!")
          )))))))

; string  for collecting the first names to access the get-ballance part
(define news '())

; string for colecting the names and passwords
(define newn '())

; collect all the names and passwordsw into a list and names into other list
(define make-collector
       (lambda (name password)
      (let ((acc (make-account toster name)))
        (set! newn (cons (cons name  password) newn ))
        (set! news (cons acc news))
            acc))) 

;total balance of all accounts in the bank + helper function
(define mr
  (lambda (l acc)
    (if (null? l)
          acc
          (mr (cdr l) (+ acc ((car l) 'get-ballance))))
             ))
(define sum-ballance
  (lambda ()
  (mr news 0)))

; this part respond for the admin 
(define make-admin
  (lambda ()
    (lambda msg
      (case (car msg)
        ((new-account)
         (begin
           (display "Enter a name for the account: ")
           (let((name (read)))
             (display "Enter a password for the account: ")
             (let((password (read)))
               (make-collector name password)))))
        ((sum-ballance)
         (begin
           (display "Balance of all accounts in the bank is - ")
           (display (sum-ballance))
           (newline)))))))

; admin credentials, we can define more admins here
(define admin (make-admin))
(make-collector 'admin 'pass)

; other accounts predefined for use
; we can register more users and get the administrator to count their balance
; but to use their accounts we need to define them first
(define anh(make-collector 'anh 'kik))
(define joe(make-collector 'joe '222))

; pretended log-in code for the registered users to log-in
(define log-in
(lambda ()
    (display "Please enter your name: ")
    (let ((name (read)))
      (display "Please enter your password: ")
      (let ((pass (read)))
        (let ((record (assoc name newn)))
          (if record
              (if (eqv? (cdr record) pass)
                  (begin
                    (if (eqv? (car record) 'admin)
                        
                        (display "Welcome admin, you can creat new-account and see sum-ballance of all accounts in the bank!")
                                     
                        (display "You successfully logged in! Now you can get-balance, deposit, withdraw, get-name, and get-account-number.")
                                       
                    ))  
                  (begin
                    (display "Wrong password.")
                    (newline)
                    #f))
              (begin
                (display "User not found.")
                (newline)
                #f)))))))


 ; start message
(define bank
  (begin
  (display "Hello, Welcome to simple banking system")
  (newline)
  (display "To interact with the bank, please log-in")
  (newline)
  (log-in))
  )
















