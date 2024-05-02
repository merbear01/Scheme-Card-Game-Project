# Scheme Card Game Project
This repository contains all the Scheme code developed for our coursework project, focused on creating a versatile card game simulation using Scheme programming language. This project was part of the COMP1811 coursework at the University of Greenwich.

# Overview
The main objective of this project was to develop a functional card game for solitaire, employing fundamental programming concepts in Scheme, such as recursion and high-order programming. The game design incorporates custom functions to manage card operations and gameplay logic effectively.

# Scores for your cards follow these rules:
• If it’s a face card (the Jack, the Queen or the King), it counts as 0.5.
• Otherwise, the numeral-itself of the card, that is, 6 of Spades counts as 6, 2 of Hearts as 2.
For example:
• 5 of Hearts, Jack of Spades and Queen of Clubs sum to 6 since 6=5+0.5 + 0.5
• 2 of Diamonds, 5 of Hearts and King of Diamonds sum to 7.5, since 7.5 = 2 + 5 + 0.5
• 3 of Hearts, 2 of Diamonds and 5 of Diamonds sum to 10, since 10 = 3 + 2 + 5 
You win double of your bet if you get 7.5. You lose 20% of your bet if you get closer. You lose all the bet if your 
score exceeds 7.5.


# Features
1. Card Creation: Functions to create a full deck of solitaire cards, including numerical cards and face cards (Jack, Queen, King).
2. Gameplay Functions: Includes operations like card comparison, value assessment, and deck validation.
3. Utility Functions: Conversion of cards to strings for better visualization, and a function to calculate possible moves based on the game's rules.

# Prerequisites
Install a Scheme interpreter, such as DrRacket or Chicken Scheme.

Contact
Mercy Nwabueze-nwoji - mercynwoji@gmail.com
