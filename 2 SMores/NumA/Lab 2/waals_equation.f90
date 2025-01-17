program waals_equation
    implicit none
    doubleprecision R, a, b, true
    integer n, P, T, count
    doubleprecision x_o, x_n, tol, err, r1, r2
    doubleprecision step, func
    doubleprecision x_i, diff

    !INITIALIZE VARIABLES
    R = 0.082054    !atm/(mol*K)
    a = 1.360
    b = 0.03183
    P = 10          !atm
    T = 300         !K

    ! Do not know if this is that actual true value. This is just as exact as
    !!!! Fortran can get
    true = 2.4384037628086563

    !fortran can print out up to 16 decimal places so this will produce a
    !!!!value as exact as possible with fortran
    tol = 10.0**(-16)   !tolerance
    r1 = 0.0            !left solution range value
    r2 = 1.0            !right solution range value
    x_n = r1 + r2       !initial estimate

    count = 0


    !record basic function values from v = [2.0, 2.5]
    !    do n = 1, 200
    !        !function:
    !        !waals(x_n, R, a, b, P, T)
    !
    !        !!plot f(v)
    !        step = 0.5 + (n * 0.01)
    !        func = waals(step, R, a, b, P, T)
    !        write(*, *) n, step, func
    !        write(7, *) step, func
    !    end do

    !possible P and T values
    !P = 1, 10, 100
    !T = 300, 500, 700
    P = 100; T = 700
    !estimate the roots, maximum of 500 iterations
    estimate : do n = 1, 1000
        !function:
        !waals(x_n, R, a, b, P, T)

        x_o = x_n

        !!!bisection method
        !x_n = (r1 + r2) / 2

        !!!false position method
        x_n = (waals(r2, R, a, b, P, T) * r1) - (waals(r1, R, a, b, P, T) * r2)
        x_n = x_n / (waals(r2, R, a, b, P, T) - waals(r1, R, a, b, P, T))
        !false position with Ideal Gas Law
        x_i = (ideal(r2, R, P, T) * r1) - (ideal(r1, R, P, T) * r2)
        x_i = x_i / (ideal(r2, R, P, T) - ideal(r1, R, P, T))

        !calculate error and print
        err = abs(x_o - x_n) !error
        !write(*, *) n, err, x_n

        !calculate difference and print
        diff = abs(x_n - x_i)
        write(*, *) n, diff
        write(7, *) n, x_n
        write(8, *) n, x_i

        !!!!!!! Print all the things !!!!!!!
        !!plot error vs time
        !write(7, *) n, err  !bisection
        !write(8, *) n, err  !false pos

        !determine if error is small "enough"
        if(err < tol .and. n > 1) then
            write(*, *) "What I found: ", x_n
            !do not know the true value
            !write(*, *) "Actual value: ", true
            write(*, *) n, " iterations"
            exit
        end if

        if(waals(r1, R, a, b, P, T) * waals(x_n, R, a, b, P, T) < 0) then
            r2 = x_n
        end if
        if(waals(r1, R, a, b, P, T) * waals(x_n, R, a, b, P, T) > 0) then
            r1 = x_n
        end if
    end do estimate

    CALL SYSTEM('gnuplot script.sh')

contains

    !van der Waal's equation of state
    double precision FUNCTION waals(V, R, a, b, P, T)
        IMPLICIT NONE
        doubleprecision :: R, a, b, V
        integer :: P, T
        waals = P * V**3 - (b * P + R * T) * V**2 + a * V - a * b
    END FUNCTION waals

    !Ideal Gas Law
    double precision FUNCTION ideal(V, R, P, T)
        IMPLICIT NONE
        doubleprecision :: R, V
        integer :: P, T
        ideal = (R * T) / V
    END FUNCTION ideal

end program waals_equation