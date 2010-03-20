
#include <stdio.h>
#include <stdlib.h>

int check_prime(int candidate, int *primes, int prime_count) {
    int *end = primes + prime_count;
    int *prime;
    for (prime = primes; prime < end; ++prime)
        if (candidate % *prime == 0)
            return 0;
    return 1;
}

int compute_primes(limit) {
    int *primes = (int*) malloc(limit * sizeof(int));
    int prime_count = 1;
    int candidate;
    
    primes[0] = 2;
    printf("2\n");

    for (candidate = 3; candidate < limit; candidate += 2)
        if (check_prime(candidate, primes, prime_count)) {
            primes[prime_count++] = candidate;
            printf("%d\n", candidate);
        }
    
    free(primes);
}

int main() {
    int attempt;
    for (attempt = 1; attempt <= 10; ++attempt) {
        printf("Attempt %d...\n", attempt);
        compute_primes(100000);
    }
    return 0;
}
