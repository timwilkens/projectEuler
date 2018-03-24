
current_index = 2
f_n_1 = 1
f_n = 1

while len(str(f_n)) < 1000:
    current_index = current_index + 1
    f_n_plus_1 = f_n + f_n_1
    f_n_1 = f_n
    f_n = f_n_plus_1

print(current_index)
