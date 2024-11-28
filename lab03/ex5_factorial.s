.globl factorial

.data
n: .word 8

.text
# Don't worry about understanding the code in main
# You'll learn more about function calls in lecture soon
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    # Initialize result to 1
    addi t0, x0, 1       # t0 = 1

    # Copy n to t1 (counter)
    add t1, x0, a0       # t1 = a0

    # Check if n == 0
    beq t1, x0, end      # if n == 0, skip loop

loop:
    # Multiply result by counter
    mul t0, t0, t1       # t0 = t0 * t1

    # Decrement counter
    addi t1, t1, -1      # t1 = t1 - 1

    # Continue loop if t1 > 0
    bgt t1, x0, loop

end:
    # Move result to a0
    add a0, x0, t0       # a0 = t0

    # Return from function
    jr ra
