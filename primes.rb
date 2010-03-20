
def checkPrime candidate, primes
  for prime in primes
    return false if candidate % prime == 0
  end
  return true
end

def computePrimes limit
  primes = [2]
  yield 2
  
  candidate = 3
  while candidate < limit
    if checkPrime(candidate, primes)
      primes.push candidate
      yield candidate
    end
    candidate += 2
  end
end

def main
  for attempt in 1..10
    puts "Attempt #{attempt}..."
    computePrimes 100000 do |prime|
      puts prime
    end
  end
end

main
