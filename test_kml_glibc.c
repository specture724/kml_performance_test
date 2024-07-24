#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "km.h" // Include the KML library header

#define NUM_TESTS 100000000

// Function to generate random float between 0 and 1
float random_float() {
    return (float) rand() / (float) RAND_MAX;
}

int main() {
    // Variables for the base, exponent, and angle
    float base, exponent, angle;
    float result_kml_pow, result_glibc_pow;
    float result_kml_cos, result_glibc_cos;

    // Variables for measuring time
    clock_t start_time, end_time;
    double time_kml_pow, time_glibc_pow;
    double time_kml_cos, time_glibc_cos;

    // Seed the random number generator
    srand(time(NULL));

    // KML pow test
    start_time = clock();
    for (int i = 0; i < NUM_TESTS; i++) {
        base = random_float() * 10.0f;
        exponent = random_float() * 10.0f;
        result_kml_pow = powf(base, exponent); // KML powf
    }
    end_time = clock();
    time_kml_pow = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;

    // GLIBC pow test
    start_time = clock();
    for (int i = 0; i < NUM_TESTS; i++) {
        base = random_float() * 10.0f;
        exponent = random_float() * 10.0f;
        result_glibc_pow = pow(base, exponent); // GLIBC powf
    }
    end_time = clock();
    time_glibc_pow = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;

    // KML cos test
    start_time = clock();
    for (int i = 0; i < NUM_TESTS; i++) {
        angle = random_float() * 2.0f * (float) M_PI; // 0 to 2*pi
        result_kml_cos = cosf(angle); // KML cosf
    }
    end_time = clock();
    time_kml_cos = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;

    // GLIBC cos test
    start_time = clock();
    for (int i = 0; i < NUM_TESTS; i++) {
        angle = random_float() * 2.0f * (float) M_PI; // 0 to 2*pi
        result_glibc_cos = cos(angle); // GLIBC cosf
    }
    end_time = clock();
    time_glibc_cos = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;

    // Print results
    printf("Timing (seconds):\n");
    printf("KML pow: %f\n", time_kml_pow);
    printf("GLIBC pow: %f\n", time_glibc_pow);
    printf("KML cos: %f\n", time_kml_cos);
    printf("GLIBC cos: %f\n", time_glibc_cos);

    return 0;
}

