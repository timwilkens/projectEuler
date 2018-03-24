import math

# We are asked to find the millionth lexicographic permutation
# of the digits 0 - 9.
#
# The strings starting with '0' will come first. How many of
# these do we have

# print("{} strings starting with 0".format(math.factorial(9)))

# 362880 strings starting with '0'
# Similarly we will have 362880 starting with '1',
# and with any other digit for that matter.
#
# This gives us a hint into how we might be able to approach this
# by doing a smarter search for digits

# We are seeking the millionth number with the first arrangement
# being labeled 0
desired_place = 999999
available_digits = range(10)
ordered_digits = []
places_consumed = 0
    
while len(available_digits) > 1:

    # How many trailing strings can we make by fixing
    # the first digit?
    place_value = len(available_digits) - 1

    # Every time we go on to the next available digit in this place
    # we pass this many numbers.
    p = math.factorial(place_value)

    for i in range(0,len(available_digits)):

        # Walk higher in the list until doing so takes us forward too many places.
        if i*p + places_consumed <= desired_place and (i+1)*p + places_consumed > desired_place:
            ordered_digits.append(available_digits.pop(i))
            places_consumed = places_consumed + i*p
            break

ordered_digits.append(available_digits.pop())
print(''.join([str(x) for x in ordered_digits]))
