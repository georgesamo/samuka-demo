# 1.
h = { true => 'wow'}
a = ['wow']
b = a.dup
puts h[ a === b ]

# 2.
puts "Enter n:"
n = gets.chomp.to_i
puts "Enter m:"
m = gets.chomp.to_i
string1 = Array.new(n)
string2 = Array.new(m)
string1.each_with_index do |x, i|
  puts "Enter string value for string 1:"
  string1[i] = x = gets.chomp
end
string2.each_with_index do |x, i|
  puts "Enter string value for string 2:"
  string2[i] = x = gets.chomp
end
p string1.concat(string2)

# 3.
puts "Enter n:"
n = gets.chomp.to_i
puts "Enter m:"
m = gets.chomp.to_i
string1 = Array.new(n)
string2 = Array.new(m)
string1.each_with_index do |x, i|
  puts "Enter string value for string 1:"
  string1[i] = x = gets.chomp
end
string2.each_with_index do |x, i|
  puts "Enter string value for string 2:"
  string2[i] = x = gets.chomp
end
concatenated_string = string2.each_index do |i|
  string2[i] += string1[i] if string1[i] != nil
end
p concatenated_string

# 4.
puts "Enter n:"
n = gets.chomp.to_i
array_of_strings = Array.new(n)
array_of_strings.each_with_index do |x, i|
  x = Array.new(2)
  puts "Enter string value for array of strings:"
  x.each_with_index do |value, index|
    x[index] = value = gets.chomp
  end
  array_of_strings[i] = x
end
p array_of_strings
p array_of_strings.flatten.delete_if { |value| value.include?('a') }

# 5. warning-ს აგდებს მაგრამ მუშაობს ???
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

class Fixnum
  alias_method :plus, :+
  alias_method :mod, :%
  def *(n)
    self.mod(n)
  end

  def +(n)
    self.plus(2 * n)
  end
end
puts a + b * c

# 6. ???
def calc(n)
  lambda do
    if 1
      n + 1
    elsif 2
      n * 2
    elsif 3
      n * 3 + 3
    end
  end
end
a = calc(10)
puts a.call 1
puts a.call 2
puts a.call 3

# 7.
n = gets.chomp.to_i
m = gets.chomp.to_i
def power_of(a, b)
  yield a ** b
end
power_of(n, m)

# 8.
class Fixnum
  def +(other)
    self * other
  end
end
puts 2 + 3

# 9.
class Person
  def initialize(name, last_name, person_id)
    @name = name
    @last_name = last_name
    @person_id = person_id
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def last_name
    @last_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def person_id
    @person_id
  end

  def person_id=(person_id)
    @person_id = person_id
  end
end

class Student < Person
  def initialize(name, last_name, person_id, gpa, school_name, school_city)
    super(name, last_name, person_id)
    @gpa = gpa
    @school_name = school_name
    @school_city = school_city
  end

  def gpa
    @gpa
  end

  def gpa=(gpa)
    @gpa = gpa
  end

  def school_name
    @school_name
  end

  def school_name=(school_name)
    @school_name = school_name
  end

  def school_city
    @school_city
  end

  def school_city=(school_city)
    @school_city = school_city
  end

  private

  def calculate_gpa(gpa)
    gpa *= 1.1
    gpa
  end
end

p = Person.new("John", "Doe", 101)
p.name="Jane"
p p.name

s = Student.new("John", "Doe", 102, 3.5, "Liberty High", "New Orleans")
s.gpa=4
p s.gpa

# 10.
puts "Enter n:"
n = gets.chomp.to_i
array_of_ints = Array.new(n)
array_of_ints.each_with_index do |x, i|
  puts "Enter integer into array:"
  array_of_ints[i] = x = gets.chomp.to_i
end
p array_of_ints.select{ |x| x.even? }.inject(:+)