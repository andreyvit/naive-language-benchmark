import java.util.*;

public final class PrimesColl {
    
    private static boolean checkPrime(int candidate, List<Integer> primes) {
        for (int prime : primes) {
            if (candidate % prime == 0)
                return false;
        }
        return true;
    }
    
    private static void computePrimes(int limit) {
        List<Integer> primes = new ArrayList<Integer>();
        primes.add(2);
        System.out.println("2");
        
        for (int candidate = 3; candidate < limit; candidate += 2)
            if (checkPrime(candidate, primes)) {
                primes.add(candidate);
                System.out.println("" + candidate);
            }
    }
    
    public static void main(String[] args) {
        for (int attempt = 1; attempt <= 10; attempt++) {
            System.out.println("Attempt " + attempt + "...");
            computePrimes(100000);
        }
    }
    
}
