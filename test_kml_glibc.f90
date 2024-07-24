! test_kml_glibc.f90
program test_kml_glibc
    use kml_interfaces
    use, intrinsic :: iso_c_binding, only: c_float, c_double
    implicit none

    ! Declare variables
    real(c_float) :: base, exponent, result_kml_pow, result_glibc_pow
    real(c_float) :: angle, result_kml_cos, result_glibc_cos
    integer :: i, num_tests
    real(c_double) :: start_time, end_time, time_kml_pow, time_glibc_pow
    real(c_double) :: time_kml_cos, time_glibc_cos

    ! Random number generator
    call random_seed()

    ! Initialize variables
    num_tests = 100000000

    ! KML pow test
    call cpu_time(start_time)
    do i = 1, num_tests
        call random_number(base)
        call random_number(exponent)
        base = base * 10.0_c_float
        exponent = exponent * 10.0_c_float
        result_kml_pow = powf(base, exponent)
    end do
    call cpu_time(end_time)
    time_kml_pow = end_time - start_time

    ! GLIBC pow test
    call cpu_time(start_time)
    do i = 1, num_tests
        call random_number(base)
        call random_number(exponent)
        base = base * 10.0_c_float
        exponent = exponent * 10.0_c_float
        result_glibc_pow = base**exponent
    end do
    call cpu_time(end_time)
    time_glibc_pow = end_time - start_time

    ! KML cos test
    call cpu_time(start_time)
    do i = 1, num_tests
        call random_number(angle)
        angle = angle * 2.0_c_float * 3.14159265358979323846_c_float ! 0 to 2*pi
        result_kml_cos = cosf(angle)
    end do
    call cpu_time(end_time)
    time_kml_cos = end_time - start_time

    ! GLIBC cos test
    call cpu_time(start_time)
    do i = 1, num_tests
        call random_number(angle)
        angle = angle * 2.0_c_float * 3.14159265358979323846_c_float ! 0 to 2*pi
        result_glibc_cos = cos(angle)
    end do
    call cpu_time(end_time)
    time_glibc_cos = end_time - start_time

    ! Print results
    print *, 'Timing (seconds):'
    print *, 'KML pow: ', time_kml_pow
    print *, 'GLIBC pow: ', time_glibc_pow
    print *, 'KML cos: ', time_kml_cos
    print *, 'GLIBC cos: ', time_glibc_cos

end program test_kml_glibc

