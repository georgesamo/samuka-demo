require 'csv'

# 1. Create class Person.
class Person
  attr_reader :name

  # 1. Person has name, last_name and person_id.
  def initialize(person_id, name, last_name)
    @person_id = person_id
    @name = name
    @last_name = last_name
  end

  # 2. Create find_person method which will have name parameter and will return amount of persons with matching name.
  # 7. Use self and class variable for find_person and find_by_salary. 11. Use ObjectSpace. IMPORTANT - ObjectSpace-ის გამოყენებისას კლასის ცვლადი აღარ დამჭირდა.
  def self.find_person(name)
    amount = 0
    ObjectSpace.each_object(self){ |person| amount += 1 if name == person.name && person.instance_of?(Person) }  # Instance_of? to avoid duplication from Employee.
    amount
  end
end

# 8. Create helper module.
module Helper

  #9. In helper module create net_salary method, method will have salary parameter and will return 20% subtracted value.
  def net_salary(salary)
    salary *= 0.8
    salary
  end
end

# 1. Create class Employee the subclass of Person.
class Employee < Person
  attr_reader :salary

  #10. Use mixin to use net_salary method in Employee class.
  include Helper

  # 1. Employee has position title and salary as well as Person instance variables in super.
  def initialize(person_id, name, last_name, title, salary)
    super(person_id, name, last_name)
    @title = title
    @salary = salary
  end

  # 3. Create find_by_salary which will have salary parameter and return amount of employees with equal salary.
  # 7. Use self and class variable for find_person and find_by_salary. 11. Use ObjectSpace. აქაც კლასის ცვლადი აღარ დამჭირვებია.
  def self.find_by_salary(salary)
    amount = 0
    ObjectSpace.each_object(self){ |employee| amount += 1 if salary == employee.salary.to_i }
    amount
  end

  # 6. Get sum of all employees salaries that are less than provided number from terminal.
  def self.employee_salary_sum(input)
    sum = 0
    ObjectSpace.each_object(self){ |employee| sum += employee.salary.to_i if employee.salary.to_i < input}
    sum
  end
end

# Create csv file for persons.
CSV.open("person.csv", "wb") do |csv|
  csv << ["Person ID", "Name", "Last Name"]
  csv << ['0101', "John", "Doe"]
  csv << ['0102', "John", "Wick"]
  csv << ['0103', "Jane", "Doe"]
end

# Create csv file for employees.
CSV.open("employee.csv", "wb") do |csv|
  csv << ["Person ID", "Name", "Last Name", "Title", "Salary"]
  csv << ['0101', "John", "Doe", "Manager", '2000']
  csv << ['0102', "John", "Wick", "Back-End Developer", '1000']
  csv << ['0103', "Jane", "Doe", "Front-End Developer", '1000']
  csv << ['0104', "Morty", "Smith", "Janitor", '500']
end

#4. fill Person from csv file.
CSV.foreach("person.csv", headers: true) do |person|
  Person.new(person[0], person[1], person[2])
end

#5. fill Employee from csv file.
CSV.foreach("employee.csv", headers: true) do |employee|
  Employee.new(employee[0], employee[1], employee[2], employee[3], employee[4])
end

puts "The amount of people named John - #{Person.find_person("John")}"
puts "The amount of Employees with the salary of 1000 - #{Employee.find_by_salary(1000)}"
puts "The sum of all employees salaries less than #{ARGV[0].to_i} is #{Employee.employee_salary_sum(ARGV[0].to_i)}"

e = Employee.new('0105', "Rick", "Sanchez", "Senior Scientist", '3210')
puts "The net salary for this employee is - #{e.net_salary(e.salary.to_i)}"
