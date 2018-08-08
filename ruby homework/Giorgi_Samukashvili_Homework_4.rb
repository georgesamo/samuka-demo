arr1 = [1, 2, 3, 4, 5]  # Array of integers.
arr2 = []  # Empty array.
arr3 = [7]  # Array with one element.

# 1. Create method array_sum, which will have argument array of integers and returns the sum of its elements.
def array_sum(array)
    array.inject(0, :+)
end
puts array_sum(arr1)  # Sum for array of integers.
puts array_sum(arr2)  # Sum for empty array (0).

# 2. Create method array_2_sum which will have argument array of integers and returns the sum of its two largest elements.
def array_2_sum(array)
    array.max(2).inject(0, :+)  # Sum for max 2 elements.
end
puts array_2_sum(arr1)
puts array_2_sum(arr3)  # Returns only one element.

# 3. Create method array_sum_to_n? which will have two arguments array of integers and integer - n, and returns true if any two elements sum in array is equal to n.
def array_sum_to_n?(array, n)
    array.combination(2).any?{ |x, y| x + y == n }  # For any combination of two elements their sum must be equal to n.
end
p array_sum_to_n?(arr1, 9)  # Returns true because 4 + 5 = 9

# 4. Create method hash_has_key?, which will have argument hash and key, and returns true if hash contains key.
def hash_has_key?(hash, key)
    hash.key?(key)  # Determines if hash has key with the argument of key.
end
h = { name: "John", lastname: "Doe" }
puts hash_has_key?(h, :name)

# 5. Create hash with string value elements and convert values to integer.
h1 = { one: "1", two: "2", three: "3" }
p h1  # Before conversion.
h1.each { |key, value| h1[key] = value.to_i }  # Convert hash values to integers.
p h1  # After conversion.

# 6. Create method array_to_hash, which will convert array to hash and indexes of array will be the keys of hash and values will be array elements.
def array_to_hash(array)
    array.map.each_with_index { |x, i| [i, x] }.to_h  # For each value and index create array that has the index,value couple as values and convert it to hash.
end
p array_to_hash(arr1)

# 7. Largest series product.
def largest_series_product(string, n)  # Function takes the string and integer n.
    numbers_array = string.chars.map { |numbers| numbers.to_i }  # Create the array of numbers from string.
    numbers_array.each_cons(n).map { |numbers| numbers.inject(:*) }.max  # For the array elements after each consecutive n number of series count their product and pick the largest product.
end
puts largest_series_product("1027839564", 5)

# 8. Isogram
def is_isogram?(string)
    string.chars == string.chars.uniq  # Returns true if all chars from string are unique.
end
puts is_isogram?("background")