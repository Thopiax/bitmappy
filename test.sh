echo "
----------------------RUNNING RUBOCOP (STYLE TESTS)-----------------------
"
rubocop -aD
echo "
------------------RUNNING RSPEC (FEATURE & UNIT TESTS)--------------------
"
rspec
