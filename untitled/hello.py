def get_integer_part(pre_decimal_string):
    # special case of negative 0 being a prefix "-0.6"
    if pre_decimal_string == "-0":
        return "-0"
    else:
        num = int(pre_decimal_string)
        return "{0:b}".format(num)


def get_decimal_part(post_decimal_string, string_builder, recurse):
    recurse += 1
    post_decimal_value = float("." + post_decimal_string)

    if post_decimal_value == 0 or recurse > 10:
        return string_builder
    else:
        temp_mult_str = str(post_decimal_value * 2)
        temp_mult_split = temp_mult_str.split(".")
        string_builder += temp_mult_split[0]
        return get_decimal_part(temp_mult_split[1], string_builder, recurse)


def print_binary(number_string):
    # handle case of no preceding 0 ".3" or
    if number_string[0] == ".":
        number_string = "0" + number_string

    # handle case of no preceding 0 and is negative
    if number_string[0:2] == "-.":
        number_string = "-0" + number_string[1:]

    if "." in number_string:
        str_split = number_string.split(".")
        print(get_integer_part(str_split[0]) + "." + str(get_decimal_part(str_split[1], "", 0)))
    else:
        print(get_integer_part(number_string))

test_values = "0 1234 -1234 12.4 0.6 -12.4 -0.6 -1234567890.123456789".split()
print(test_values)
for each in test_values:
    print_binary(each)

# special cases
print_binary("-.7")
print_binary(".67")

