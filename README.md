Benchmark of V8, Sun JVM, Ruby, Python and C
============================================

Problem used: computation of prime numbers. Prime numbers are stored in an array, each prime check is a  function call.

To run:

    make run
    
My results are (2.1 GHz Intel Core 2 Duo running OS X 10.5):

             c:    2.3 ±0.0
    java-array:    4.6 ±0.5
     java-coll:   35.6 ±6.6
        python:  147.6 ±1.9
          ruby:  385.1 ±10.2
            v8:    8.4 ±1.3
