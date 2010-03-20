import java.util.*;

public final class PrimesArray {
    
    private static boolean checkPrime(int candidate, int[] primes, int primeCount) {
        for (int i = 0; i < primeCount; i++) {
            if (candidate % primes[i] == 0)
                return false;
        }
        return true;
    }
    
    private static void computePrimes(int limit) {
        int[] primes = new int[limit];
        primes[0] = 2;
        int primeCount = 1;
        System.out.println("2");
        
        for (int candidate = 3; candidate < limit; candidate += 2)
            if (checkPrime(candidate, primes, primeCount)) {
                primes[primeCount++] = candidate;
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
