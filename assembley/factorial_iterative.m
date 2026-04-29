! This program calculates the factorial of a number using an iterative approach.

define(fn_r, 10)
define(fn_s, 4)
define(i_r, 11)
define(n_r, 12)

.global main
.global loop
.global end_loop

main:
    save    %sp, -96, %sp

    mov     5, %fn_r
    st      %fn_r, [%fp + fn_s]
    add     %fp, fn_s, %o0
    call    fac
    nop

    mov 1, %g1
    ta 0


.global fac
fac:
    ld      [%o0], %o3
    mov     1, %n_r
    mov     1, %i_r

loop:
    cmp     %i_r, %o3
    bg      end_loop
    nop

    mov     %n_r, %o0
    call    .mul
    mov     %i_r, %o1

    mov     %o0, %n_r

    ba      loop
    add     %i_r, 1, %i_r

end_loop:
    retl
    st      %n_r, [%o0]