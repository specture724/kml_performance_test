C:
	gcc -o test_kml_glibc test_kml_glibc.c -L/usr/local/kml/lib -lkm -lm
Fortran:
	gfortran -g -c kml_interfaces.f90
	gfortran -g -c test_kml_glibc.f90
	gfortran -g -o test_kml_glibc test_kml_glibc.o kml_interfaces.o -L/usr/local/kml/lib -lkm -lm
