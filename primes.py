
def checkPrime(candidate, primes):
    for prime in primes:
        if candidate % prime == 0:
            return False
    return True

def computePrimes(limit):
    primes = [2]
    print 2

    candidate = 3
    while candidate < limit:
        if checkPrime(candidate, primes):
            primes.append(candidate)
            print candidate
        candidate += 2

def main():
  for attempt in range(1, 11):
    print "Attempt %d..." % attempt
    computePrimes(100000)

main()
