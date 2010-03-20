puts: require('sys').puts

checkPrime: (candidate, primes) ->
    for prime in primes
        return false if candidate % prime == 0
    return true

computePrimes: (limit, callback)->
    primes: [2]
    callback 2
    
    candidate: 3
    while candidate < limit
        if checkPrime(candidate, primes)
            primes.push candidate
            callback candidate
        candidate += 2

main: ->
    for attempt in [1..10]
        puts "Attempt $attempt..."
        computePrimes 100000, (prime) ->
            puts prime

main()
