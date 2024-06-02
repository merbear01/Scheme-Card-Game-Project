;; Spades, clubs, Hearts, Diamonds
;; Coding cards
(require racket/list)  ;; shuffle

;; F1 - The cards
;; Invariant representation
;; a pair of letter
(define (card? val)
  (if (equal? card? val) #t
  (and
   (pair? val)
   (list? (member (car val) '(1 2 3 4 5 6 7 #\J #\K #\Q)))
   (list? (member (cdr val) '(#\D #\S #\H #\C))
          ))))

(define (suite card)
   (cdr card))

(define (numeral card)
   (car card))

(define (face? card)

(if (or (equal? (car card) #\J) (equal? (car card) #\Q) (equal? (car card) #\K))
 
                                    #t

                                    #f))

(define (card->string val)
  (string-append
   (if
     (face? val) (string (numeral val))
      (number->string (numeral val)))
   (string (cdr val)
           )))


;;(require racket/trace)
(define (value card)
  (if (number? (car card))
      (and (>= (car card) 1) (<= (car card) 7) number? (car card))
           (if (char? (car card))
               (or (equal? (car card) #\S) (equal? (car card) #\H) (equal? (car card) #\C) (equal? (car card) #\D) 0.5))))

;; 3 .- The deck.

;;Using the function card? above, declare a function deck? Which, provided a list of values, returns #t if it is 
;;a valid deck or #f otherwise
(define (deck? val)
  (if (null? val)#t 
  (and (or (card? (car val))) (card? (car (cdr val))))))

(define (valueOf round) 
  (if (null? round) 0
         (+ (value (car round)) (valueOf (cdr round)))))
;;(trace valueOf)

;; hard
(define (do-suite val) (list (cons 1 val) (cons 2 val)
                             (cons 3 val) (cons 4 val)
                             (cons 5 val) (cons 5 val)
                             (cons 7 val) (cons #\K val)
                             (cons #\Q val) (cons #\J val)))
          
;; how to generate a deck.
(define deck (list (cons 1 #\H) (cons 2 #\H)
                   (cons 3 #\H) (cons 4 #\H)
                   (cons 5 #\H) (cons 6 #\H)
                   (cons 7 #\H) (cons #\J #\H)
                   (cons #\Q #\H) (cons #\K #\H)
                   (cons 1 #\S) (cons 2 #\S)
                   (cons 3 #\S) (cons 4 #\S)
                   (cons 5 #\S) (cons 6 #\S)
                   (cons 7 #\S) (cons #\J #\S)
                   (cons #\Q #\S) (cons #\K #\S)
                   (cons 1 #\C) (cons 2 #\C)
                   (cons 3 #\C) (cons 4 #\C)
                   (cons 5 #\C) (cons 6 #\C)
                   (cons 7 #\C) (cons #\J #\C)
                   (cons #\Q #\C) (cons #\K #\C)
                   (cons 1 #\D) (cons 2 #\D)
                   (cons 3 #\D) (cons 4 #\D)
                   (cons 5 #\D) (cons 6 #\D)
                   (cons 7 #\D) (cons #\J #\D)
                   (cons #\Q #\D) (cons #\K #\D)))

(define (deck->strings deck)
  (map card->string deck))


;;(define (playS deck hand strategy)
;;F3 - Probabilities.

(define (probability comp num deck)
  (cond
    [(empty? deck) 0]
    [(comp (value (car deck)) num)
     (+ 1 (probability comp num (rest deck)))]
    [else
     (probability comp num (rest deck))]))

(define cheat #f)

;; F4.- Game.
;; DO NO CHANGE THE  FUNCTIONS BELOW THIS LINE
;; -----------------------------------------------------
;; -----------------------------------------------------
;; -----------------------------------------------------
;; -----------------------------------------------------
;; -----------------------------------------------------
(define (show-statistics deck hand)
  (let
    ([toCheck (- 7.5 (valueOf hand))])
    (display
     (format
      "P(>7.5):~a/~a\nP(<7.5):~a/~a\nP(=7.5):~a/~a\nHAND:~a~nVALUE:~a\nDECK:~a...\n"
      (probability > toCheck deck)
      (length deck)
      (probability < toCheck deck)
      (length deck)
      (probability = toCheck deck)
      (length deck)                     
      (deck->strings hand)
      (valueOf hand)
      (if cheat (deck->strings (take deck
                                   (max 0 
                                    (min 4 (length deck) )))) "****")
      )
     )))
  
;; Human interaction.
(define (play deck hand)
  (begin      
      (show-statistics deck hand)
      ;; Control
      (cond
      [(= (valueOf hand) 7.5) (display "WIN")]
      [(> (valueOf hand) 7.5) (display "LOST")]
      [(empty? deck) (display "NO CARDS LEFT") ]
      [(let
           ([ command (read)])
           (cond
             [(equal? command 'accept)
               (play (rest deck) (cons (first deck) hand))]
             [(equal? command 'pass)
               (play (drop deck 1) hand)]
             [(equal? command 'end) (void)]
             [else (play deck hand)]))])))