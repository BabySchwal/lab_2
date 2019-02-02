#!/bin/bash
# Authors : Sarah Schwallier
# Date: 1/31/2019

#Problem 1 Code:
#Make sure to document how you are solving each problem!

#Code needs: 
# 1. Accept an expression and file name from the user via prompt
	#So this should prompt the user to enter a file name and then read the file name that was given, just added and expression option to be safe, but I think that the expression that the lab wants is just the file name
echo "Enter a regular expression: "
read regExpression
echo "Enter a file name: "
read fileName

# 2. Feed user's regulare expression into grep and run with chosen file
	#Prints expression but not file name for some reason. Will need to fix this at home :C
echo "Regular Expression:, $regExpression"
echo "File Name, $fileName"
grep $regExpression $fileName

# 3. Need to add the following grep commands: :D
	# Count phone numbers in regex_practice.txt
		# Easy way to count something in a file, allPhone is the actual amount of all phone numbers in the file, the phone numbers are typed like 303-492-5151 so we need to ignore any number that does not follow this format and then count the amount. Since, grep prints lines matching a pattern I think I will need a way to not pront them so it is only asking me to count the phone numbers and not print them as well the Pattern: ###-###-####, [0-9] looks for one number
allPhone=`grep --count "^[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$" regex_practice.txt` 
echo "Number of phone numbers: $allPhone"

	# Count emails in regex_practice.txt
		#emails end in .com so ignore all lines of text that do not end in .com and then count them all up	
allEmail=`grep --count "[^@][^@]*\@[^@][^@]*\.[^@][^@]*$" regex_practice.txt` 
echo "Number of emails: $allEmail"

	# List 303 phone numbers and store in phone_results.txt
		#Via list of phone numbers found in allPhone we need to count the ones that begin in 303 and ignore the rest and store the numbers in a new file
grep "^303-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$" regex_practice.txt > phone_results.txt

#echo "Number of 303 Phone Numbers: $Phone303"

	# list all geocities.com and store in phone_results.txt
		# Via list of emails found in allEmail we need to count the ones that end in @geocities.com and ignore the list. Then they need to be sotred in a new file
grep "[^@][^@]*\@geocities\.com$" regex_practice.txt > email_results.txt

#echo "Number of @geocitites.com emails: $geoEmails"

	# List all lines that match the command line regular expression and store in command_results.txt
		# Print a command lines then store in a new file
grep "$1" regex_practice.txt > command_results.txt
#echo "Command Line Arguments: $NOTDONE"

