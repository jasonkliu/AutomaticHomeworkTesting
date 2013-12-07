AutomaticHomeworkTesting
========================

A method to check inputs and outputs for R5RS Scheme code via the Terminal.

Current requirements: Racket installed here: (directory is changeable)

    ~/../../Applications/Racket\ v5.3.6/bin/
    
Running the script: (currently working for hw6.scm, hw7.scm, hw8.scm)

Place the script in the same directory as the hw*.scm file. Then open the Terminal:

    chmod +x testcase.sh
    ./testcase.sh
    
To add new testcases, edit hw*_testcases.scm in this format.
(The last 'function is used to print the input of the function).

    (testcase problem# test# function output 'function)

For example, to make a test case for problem 2, number 3, with the function (+ 2 2):
    
    (testcase 2 3 (+ 2 2) '4 '(+ 2 2))
    
    ---- TEST 3 -----
    (+ 2 2)
    Your output is correct: 4

To clean up your Racket directory (delete hw6.scm, hw7.scm, hw8.scm, etc), run this:

    chmod +x cleanup.sh
    ./cleanup.sh
