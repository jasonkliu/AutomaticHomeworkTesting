Instructions 
============

Administrator script: readline.sh

A script to automatically test files using RSpec/Capybara.

To run it, you need a testfile, which is a list of links to Github repos.

    https://github.com/username/repository
    https://github.com/username/repository
    https://github.com/username/repository

You also need a `rspec` file (non-hidden) and a `spec/` directory for tests.

Running the script && redirect to stdout

    chmod +x readline.sh
    ./readline.sh < testfile > stdout  # quick mode
    OR
    ./readline.sh                      # interactive mode

The script will create many folders in your
current directory, so it will ask if you want to
create a new directory to store all of the files (in interactive mode).

A short summary of the script:

* Check for `git/ruby/rspec/capybara`
* Read in file line by line, and `mkdir -p` if necessary
* Use a little bit of `sed` magic to `git clone` the repo
* Copy in `.rspec` and `spec/` and run the tests
* Check for style guidelines (currently, only 80 char limit)
* Clean up directories / keep them for future reference

=========================================================

Alternate script: selftest.sh
Drop this in your repository directory, run these commands:
    
    chmod +x selftest.sh
    ./selftest.sh                      

