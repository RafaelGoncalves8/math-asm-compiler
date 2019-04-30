mov r3, #3200
mov r0, #2
str r0, [r3], #4
mov r0, #4
str r0, [r3], #4
ldr r2, [r3, #-4]!
ldr r1, [r3, #-4]!
add r0, r1, r2
str r0, [r3], #4
mov r0, #1
str r0, [r3], #4
ldr r2, [r3, #-4]!
ldr r1, [r3, #-4]!
sub r0, r1, r2
str r0, [r3], #4
