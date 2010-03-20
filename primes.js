(function(){
  var checkPrime, computePrimes, main, puts;
  puts = require('sys').puts;
  checkPrime = function checkPrime(candidate, primes) {
    var _a, _b, _c, prime;
    _a = primes;
    for (_b = 0, _c = _a.length; _b < _c; _b++) {
      prime = _a[_b];
      if (candidate % prime === 0) {
        return false;
      }
    }
    return true;
  };
  computePrimes = function computePrimes(limit, callback) {
    var _a, candidate, primes;
    primes = [2];
    callback(2);
    candidate = 3;
    _a = [];
    while (candidate < limit) {
      _a.push((function() {
        if (checkPrime(candidate, primes)) {
          primes.push(candidate);
          callback(candidate);
        }
        return candidate += 2;
      }).call(this));
    }
    return _a;
  };
  main = function main() {
    var _a, _b, _c, _d, _e, attempt;
    _a = []; _d = 1; _e = 10;
    for (_c = 0, attempt = _d; (_d <= _e ? attempt <= _e : attempt >= _e); (_d <= _e ? attempt += 1 : attempt -= 1), _c++) {
      _a.push((function() {
        puts("Attempt " + attempt + "...");
        return computePrimes(100000, function(prime) {
          return puts(prime);
        });
      }).call(this));
    }
    return _a;
  };
  main();
})();
