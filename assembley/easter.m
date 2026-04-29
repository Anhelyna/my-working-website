! This program calculates the earliest date of Easter 
! for a given range of years.

define(g_r, i2)
define(c_r, l1)
define(y_r, l2)
define(x_r, l3)
define(z_r, i3)
define(d_r, o5)
define(e_r, i5)
define(n_r, l7)
define(i_r, o4)
define(m_r, l0)
define(dn_r, i1)
define(ff_r, o3)
define(em_r, l4)
define(ed_r, l5)
define(ey_r, l6)

.global main

main:
    save %sp, -96, %sp

.global bigloop
.global bigtest
.global calc
.global update_early

    mov 4, %m_r
    mov 31, %n_r

    mov 4, %em_r
    mov 31, %ed_r
    mov 2000, %y_r ! initial year


bigloop:

! check for the early date
    cmp %m_r, %em_r
    bl update_early
    nop

    cmp %m_r, %em_r
    bg calc
    nop

    cmp %n_r, %ed_r
    bl update_early
    nop



update_early:
    mov %n_r, %ed_r
    mov %m_r, %em_r
    mov %y_r, %ey_r

calc:
add %y_r, 1, %y_r
! g
    mov 44, %ff_r

    clr %g_r
    mov %y_r, %o0
    call .rem
    mov 19, %o1
    mov %o0, %g_r
    add %g_r, 1, %g_r

! c
    clr %c_r
    mov %y_r, %o0
    call .div
    mov 100, %o1
    mov %o0, %c_r
    add %c_r, 1, %c_r

! x
    clr %x_r
    mov 3, %o0
    call .mul
    mov %c_r, %o1
    call .div
    mov 4, %o1
    sub %o0, 12, %x_r

! z
    clr %z_r
    mov 8, %o0
    call .mul
    mov %c_r, %o1
    add %o0, 5, %z_r
    mov %z_r, %o0
    call .div
    mov 25, %o1
    sub %o0, 5, %z_r

! d
    clr %d_r
    mov 5, %o0
    call .mul
    mov %y_r, %o1
    call .div
    mov 4, %o1
    sub %o0, %x_r, %d_r
    sub %d_r, 10, %d_r

!e
    clr %e_r
    mov 11, %o0
    call .mul
    mov %g_r, %o1
    add %o0, 20, %e_r
    add %e_r, %z_r, %e_r
    sub %e_r, %x_r, %e_r
    mov %e_r, %o0
    call .rem
    mov 30, %o1
    mov %o0, %e_r

.global loop
loop:
    cmp %e_r, 25
    bne loopExit
    cmp %g_r, 11
    ble loopExit
    cmp %e_r, 24
    bne loopExit
    add %e_r, 1, %e_r

.global loopExit
loopExit:
    clr %n_r
    sub %ff_r, %e_r, %n_r

.global nextN
    cmp %n_r, 21
    bge nextN
    nop
    add %n_r, 30, %n_r

nextN:
    mov %d_r, %dn_r
    add %dn_r, %n_r, %dn_r
    mov %dn_r, %o0
    call .rem
    mov 7, %o1
    add %n_r, 7, %n_r
    sub %n_r, %o0, %n_r


    cmp %n_r, 31
    ble, a bigtest
    mov 3, %m_r
    mov 4, %m_r
    sub %n_r, 31, %n_r


bigtest:
    cmp %y_r, 2030 !end year
    bl bigloop
    nop

    mov 1, %g1
    ta 0