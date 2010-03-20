
.SUFFIXES: .java .class .js .coffee

.coffee.js:
	coffee -c $<
 
.java.class:
	javac $<

default: run

build: build-coffee build-java build-c
build-coffee: primes.js
build-java: PrimesColl.class PrimesArray.class
build-c: primes-c

primes-c : primes.c
	gcc -O3 -o primes-c primes.c

clean:
	-rm -f *.class *.o primes-c

run: run-v8 run-java run-ruby run-python run-c sum
run-java: run-java-coll run-java-array

run-v8:
	./run-bench node primes.js v8

run-java-array:
	./run-bench java PrimesArray java-array

run-java-coll:
	./run-bench java PrimesColl java-coll

run-ruby:	
	./run-bench ruby primes.rb

run-python:	
	./run-bench python primes.py
	
run-c:
	./run-bench ./primes-c dummy c
	
sum:
	rm benchmark.txt
	for i in bench-*.txt; do ./summarize.pl $$i >>benchmark.txt; done
	cat benchmark.txt

primes.js : primes.coffee

PrimesArray.class : PrimesArray.java

PrimesColl.class : PrimesColl.java
