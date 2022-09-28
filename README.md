# Loan Repayment Table
The program accepts values for loan amount, yearly interest rate, and monthly payment amount from the terminal, and computes and displays on the terminal screen a loan repayment table. <br>

![image](https://user-images.githubusercontent.com/104295321/192698043-979ed094-2d20-4603-a4a5-a70115bf8f2e.png)

<b>Explanation of features</b><br>
We have included 5 static text boxes which are the Loan Amount, Yearly Interest Rate, Monthly Payment, Total Repayment and Interest Sum. The blank boxes besides it are text boxes to input and output the figures. For example, the edit text boxes beside Loan Amount, Yearly Interest Rate and Monthly Payment allow the users to input amounts in it. While the other two boxes, beside Total Repayment and Interest Sum, we input some formulas to the coding so when the user clicks on calculate, it will automatically pop up an amount. Not only that, we have two push buttons. ‘Calculate’ is to calculate the amounts input by user and the result will show in the table below, whereas ‘Clear’ is to enhance the usability of the user if they want to re-enter or to produce a new result.

Although the user can input the amounts in the text boxes, not every amount is acceptable by the system with some coding keyed. First, if we enter a negative value in the Loan Amount section, an error dialog box will pop up stating that the negative number is not accepted and the user needs to insert the amount again. Same concept applies to the amount entered when it is not more than 5000. For Yearly Interest Rate, the minimum rate is 1.5%, so we include a warning dialog box if the user keyed is less than 1.5. If so, it will state that ‘rate must be at least 1.5%’. Lastly, monthly payment can’t be paying less than the interest, thus if the amount inputted is lesser a question dialog box will pop up. The dialog box should display and prompt for new monthly payment for users to key in. Once done, they can click on the ‘Yes’ button and continue with the process.

As for the Total Repayment and Interest Sum which we included in, is to let the user have an insight of how much they had to pay off and sum of interest paid. This also will show them and let them think whether it is worth taking up the loan. As an additional and creative add-ons, we created a menu bar. The menu bar we created has 2 options, which are ‘Print’ and ‘Close’. Users can choose ‘Print’ to print the receipt if they want to, otherwise they can just close the calculator.   

