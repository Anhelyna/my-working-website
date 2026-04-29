! This program calculates the binomial coefficient C(n, k) using a recursive approach.
.global main
main:
    save    %sp, -96, %sp
    mov     10, %o0
    call    binomial
    mov     5, %o1
    mov     %o0, %l0

    mov 1, %g1
    ta 0

.global binomial
.global end
.global one

binomial:
    save    %sp, -96, %sp

    cmp     %i1, 0
    bl      end
    cmp     %i1, %i0
    bg      end
    cmp     %i0, 1
    bl      end

    cmp     %i0, 1
    be      one

    sub     %i0, 1, %o0
    call    binomial
    mov     %i1, %o1

    mov     %o0, %l0

    sub     %i0, 1, %o0
    call    binomial
    sub     %i1, 1, %o1

    add     %o0, %l0, %i0
    ret
    restore

one:
    mov     1, %i0
    ret
    restore

end:
    mov     0, %i0
    ret
    restore