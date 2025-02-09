CECS 460 Group Assignment 1: BRAM Basics
By: Bronson Garel, Andrew Nguyen, Kenneth Vuong, and Kyle Wyckoff

Description:
This project utilizes the Zybo-Z7 SOC to understand how to create and instantiate block ram (BRAM) in conjunction with buttons and switches. The function of the assignment is to create BRAM that contains 10 elements of 4 bit numbers.
With this BRAM array, we instantiate our 4 on board switches as inputs as well as a button to be our "submit" button.  The objective is to use the switches to guess the current value of the BRAM starting at index 0.  After inputting
a guess using the switches, you press the button in order to submit your answer, if the number matches, the on board RGB LED will turn green, if it doesn't match, it will turn red. After submission, the BRAM index will update and we 
will compare our next guess with the next index of BRAM and repeat the same steps. Once index 9 of the BRAM has been reached and guessed, the BRAM index will reset back to 0 and repeat the process all over again.

This project uses Vivado 2020.2 (but also works for any version of vivado) and is coded in Verilog.
The SOC used was the Zybo-Z7 SOC.

Below is an image of our simulation screenshot we created.  The bottom variable shows our BRAM, while the inputs change to iterate through every possible guess to compare with the given BRAM index.
![image](https://github.com/user-attachments/assets/1d2cb07c-0fe6-4703-bb51-b3c9861cc971)


