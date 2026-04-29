! This program implements the Shell Sort algorithm to sort an array of integers.
define(n_s, -84)
define(i_r, l0)
define(gap_r, l1)
define(j_r, l2)
define(temp_r, l3)
define(size_r, l4)

.global main
main:
    save %sp, -176, %sp

.global forloop
.global testloop
.global mainloop
.global init_done
.global outer_loop
.global inner_loop
.global outer_inc
.global next_gap
. global done

    ba testloop
    mov 20, %i_r

forloop:
    mov %i_r, %o0
    sll %j_r, 2, %o1
    add %fp, %o1, %o1
    st %o0, [%o1 + nums_s]

    sub %i_r, 1, %i_r

testloop:
    cmp %i_r, %g0
    bge,a forloop
    add %j_r, 1, %j_r

    ba init_done
    mov 20, %size_r

init_done:
   
    mov %size_r, %o0
    call .div
    mov 2, %o1
    mov %o0 %gap_r


mainloop:
    cmp %gap_r, %g0
    ble,a done
    mov 1, %g1

    mov %gap_r, %i_r

outer_loop:
    cmp %i_r, %size_r
    bge,a next_gap
    mov %gap_r, %o0

    sub %i_r, %gap_r, %j_r

inner_loop:
    cmp %j_r, %g0
    bl outer_inc
    nop

    sll %j_r, 2, %o0
    add %fp, %o0, %o0
    ld [%o0 + nums_s], %o2

    add %j_r, %gap_r, %o1
    sll %o1, 2, %o1
    add %fp, %o1, %o1
    ld [%o1 + nums_s], %o3

    cmp %o2, %o3
    ble outer_inc
    nop

    st %o3, [%o0 + nums_s]
    st %o2, [%o1 + nums_s]

    sub %j_r, %gap_r, %j_r
    ba inner_loop
    nop

outer_inc:
    add %i_r, 1, %i_r
    ba outer_loop
    nop

next_gap:
    call .div
    mov 2, %o1
    mov %o0, %gap_r
    ba mainloop
    cmp %gap_r, %g0
    

done:
    ta 0