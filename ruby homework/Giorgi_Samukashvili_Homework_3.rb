# 1) Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] and print out each value
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array.each { |x| puts x }

# 2) Same as above, but only print out values greater than 5
array.each { |x| puts x if x > 5 }

# 3) Now, using the same array from #2, use the select method to extract all odd numbers into a new array.
array_of_odds = array.select { |x| x.odd? }
p array_of_odds

# 4) Append "11" to the end of the original array. Prepend "0" to the beginning
array.push(11)
array.unshift(0)
p array

# 5) Get rid of "11". And append a "3"
array.pop
array << 3
p array

# 6) Get rid of duplicates without specifically removing any one value
array.uniq!
p array

# 7) Use Ruby's Array method delete_if and String method start_with? to delete all of the words that begin with an "s" in the following array
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |n| n.start_with?("s")}
p arr
# Recreate the arr and get rid of all of the words that start with "s" or starts with "w"
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |n| n.start_with?("s", "w")}
p arr

# 8) Converting a String to an Array and back
fruit_string = "boulder, apple, banana, peach, cow"
fruit_array = fruit_string.split(", ")
fruit_array.pop
fruit_array.shift
p fruit_array
new_fruit_string = fruit_array.join(", ")
puts new_fruit_string

# 9) Yielding to a block. Write a method named with_these_numbers
def with_these_numbers(x, y)
    yield(x, y)
end

with_these_numbers(1, 4) do |first, second|
    puts first + second # Output: 5
end
  
with_these_numbers(3, 6) do |first, second|
    puts first * second # Output: 18
end
  
with_these_numbers(12, 3) do |first, second|
    puts first / second # Output: 4
end

# 10)
class Rectangle
    attr_reader :width, :height
  
    def width=(value)
        if value < 0
            raise "Width can't be negative!"
        end
        @width = value
    end
  
    def height=(value)
        if value < 0
            raise "Height can't be negative!"
        end
        @height = value
    end

    # Make Rectangle class method private
    private

    def area
        width * height
    end
end

# Create a subclass of Rectangle, named Square.
class Square < Rectangle

    # Square should override the width= method to set both the width and height to the given value when called
    def width=(value)
        if value < 0
            raise "Width can't be negative!"
        end 
        @width = @height = value
    end
    
    # It should do the same with the height= method
    def height=(value)
        if value < 0
            raise "Height can't be negative!"
        end 
        @height = @width = value
    end

    # Call private Rectangle class method from Square class public method s_area
    def s_area
        area
    end
end

# Testing via example
s = Square.new
s.width = 4
s.height = 5 # This will overwrite the width of 4 because width and heigth are the same
p s.s_area

# 11) Find the largest palindrome made from the product of two 3-digit numbers
max = 0
100.upto(999) do |a|
  a.upto(999) do |b|
    product = a * b
    max = [max, product].max if product.to_s == product.to_s.reverse
  end
end
puts "Largest palindrome is #{max}."

# 12) What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
p (1..20).inject(:lcm) # Ruby method .lcm (least common multiple)

# 13) There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc
start = Time.now  # Test the time needed for calculation
(1..500).each do |c|  # 500, რადგან სამკუთხედის ფორმულიდან გამომდინარე უდიდესი გვერდის სიგრძე უნდა იყოს დანარჩენი ორის ჯამზე ნაკლები, ამიტომ ჰიპოტენუზა 500-ზე დიდი ვერ იქნება
    (1..c).each do |b|
        (1..b).each do |a|
            if a + b + c == 1000 && a ** 2 + b ** 2 == c ** 2
                puts "#{a} + #{b} + #{c} = 1000"
                puts "The product of a,b,c is #{a * b * c}"
            end
        end
    end
end
finish = Time.now
puts "#{finish - start} seconds needed for calculation"