# why rspec found no tests

fail <<-MESSAGE
    You are running `rspec` in the wrong directory.
    If you are trying to run the drills tests, do this:
    ; cd drills
    ; rspec
    If you are trying to run the program tests, do this:
    ; cd program
    ; rspec
MESSAGE
