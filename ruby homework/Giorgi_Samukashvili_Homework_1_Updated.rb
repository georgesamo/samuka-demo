#1. Create class Student

class Student
  attr_accessor :id, :name, :last_name

  #2. Set properties in initialize
  def initialize(id, name, last_name, age)
    @id = id
    @name = name
    @last_name = last_name
    @age = age
  end

  #3. Class method to check if age is odd
  def odd?
    @age.odd?
  end

  #4. Class method to check if name or last_name contains string input
  def name_check?(input)
    (/#{input}/.match(@name.downcase) || /#{input}/.match(@last_name.downcase)) ? true : false
  end

  #5. Class method to find student with ID from input
  def self.find_id(array, input)
    array.each { |student| "The Student with ID-#{student.id} is #{student.name} #{student.last_name}" if input.to_i == student.id}
  end

  # to_s method override for this class
  def to_s
    "Name: #{@name} #{@last_name} ID Number: #{@id} Age: #{@age}"
  end
end

# Array of size 3 filled with nils as default
students = Array.new(3)

s1 = Student.new(101,"John", "Doe", 20)
s2 = Student.new(102,"Jane", "Doe", 21)
s3 = Student.new(103,"Rick", "Sanchez", 22)
students << s1 << s2 << s3

# Remove nils from array
students.delete(nil)
p students
puts s1.odd?

puts "Enter name pattern in low caps: "
input_name = gets.chomp
puts s1.name_check?(input_name)

puts "Enter Student's ID: "
input_id = gets.chomp
puts Student.find_id(students, input_id)

#6. Create Array of Integers
def array_of_ints(i)
  (1 .. i).to_a
end
a = array_of_ints(10)   #Example
p a

#7. Sum Array elements
p a.inject(:+)   #Array example from task 6

#8. Print in terminal
a = "* "
b = " *"
4.times do |n|
  n.odd? ? (puts b * 3) : (puts a * 4)
end

#9. Print in terminal
c = "*"
d = " "
3.times do |n|
  n.odd? ? 3.downto(0).each { |i| puts (d * i + c) } : 0.upto(3).each  { |i| puts (d * i + c) }
end

#10. Print all even elements power 2, elements are from 1 to 50
(1 .. 50).each { |x| print "#{x ** 2} " if x.even? }
