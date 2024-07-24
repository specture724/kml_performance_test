! kml_interfaces.f90
module kml_interfaces
    use, intrinsic :: iso_c_binding, only: c_float
    implicit none

    interface
        function powf(x, y) bind(c, name="powf")
            import :: c_float
            real(c_float) :: powf
            real(c_float), value :: x, y
        end function powf

        function cosf(x) bind(c, name="cosf")
            import :: c_float
            real(c_float) :: cosf
            real(c_float), value :: x
        end function cosf
    end interface
end module kml_interfaces
