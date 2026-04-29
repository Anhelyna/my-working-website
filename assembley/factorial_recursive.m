! This program calculates the factorial of a number using a recursive approach.

.global main

main:
    save    %sp, -96, %sp

    mov     5, %l0
    st      %l0, [%sp + 68]
    ld      [%sp + 68], %o0
    call    factorial
    mov     %l0, %o1

    mov     1, %g1
    ta      0


.global factorial
.global end

factorial:
    save    %sp, -96, %sp

    st      %i0, [%sp + 68]
    mov     %i1, %l0

    cmp     %l0, 1
    ble     end
    nop

    sub     %l0, 1, %l0

    mov     %l0, %o0
    call    .mul
    mov     %i0, %o1

    call    factorial
    mov     %l0, %o1

end:
    mov     %i0, %o0
    ret
    restore