# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# The values are produced by taking the corners
# of nested squares of side length 2*n + 1

# We also have a recursive relationship where
# the first square (really a single cell)
# is a value of 1 and and square of side length
# 2*n + 1 starts with the ending value of the
# previous square plus 2*n

# e.g.
# s0 => 1
# e0 => 1

# s1 => e0 + 2*1 = e0 + 2 = 3
# e1 => s1 + 3*(2*1) = 3 + 6 = 9
 
# s2 => e1 + 2*2 = 9 + 4 = 13
# e2 => s2 + 3*(2*2) = 13 + 12 = 25

diagonal_sum = 1
square_num = 1
previous_end = 1

# Iterate until we include all squares up to the one with side length 1001
while square_num*2 + 1 <= 1001:
    start = previous_end + 2*square_num
    # Add up all the corner elements
    for n in range(0,4):
        diagonal_sum = diagonal_sum + start + n*2*square_num
    previous_end = start + 3*2*square_num
    square_num = square_num + 1

print(diagonal_sum)
