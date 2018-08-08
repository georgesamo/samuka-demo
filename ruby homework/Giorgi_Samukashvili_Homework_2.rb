require "csv"

# 1. Create class Student
class Student
  attr_reader :name, :last_name, :gpa, :debt
  def initialize(name, last_name, gpa, debt)
    @name = name
    @last_name = last_name
    @gpa = Float(gpa)
    @debt = Integer(debt)
  end
end

# Create Student samples
s1 = Student.new("John", "Doe", 3, 100)
s2 = Student.new("Jane", "Doe", 2.5, 50)
s3 = Student.new("Rick", "Sanchez", 4, 60)
s4 = Student.new("Morty", "Smith", 0.1, 2250)

# 2. Create CSV file with sample data from Student class
CSV.open("students.csv", "w") do |csv|
  csv << ["Name", "Last Name", "GPA", "Debt"]   # Headers
  csv << [s1.name, s1.last_name, s1.gpa, s1.debt]
  csv << [s2.name, s2.last_name, s2.gpa, s2.debt]
  csv << [s3.name, s3.last_name, s3.gpa, s3.debt]
  csv << [s4.name, s4.last_name, s4.gpa, s4.debt]
end

# 3. Read CSV file and calculate debt for Students
data = CSV.read("students.csv", headers: true, converters: :all, header_converters: :symbol )   # Implement headers, convert headers to symbols, convert all variables to their types
data_array = data.map { |d| d.to_h}   # Array of Hashes of data from students.csv
p data_array
sum = data_array.inject(0) {|sum, hash| sum + hash[:debt]}   # Calculate values with key ":debt"
puts "The student debt sum is: #{sum}"
puts

# 4. Take student's name from terminal and find their debt
data_array.each do |students|
  if ARGV.first.to_s == students[:name]   # Type in students name in terminal and store it in ARGV.first
    puts "Student #{students[:name]} #{students[:last_name]}'s debt is #{students[:debt]}"
  end
end
ARGV.clear   # ARGV.clear-ს თუ წინ დავწერ, როგორც დავალებაში წერია, მის [0] ელემენტს ვეღარ წვდება პროგრამა და იქნებ შემოწმების შემდეგ ამიხსნათ ამ მეთოდის პრინციპი? :დ

# 5. Create CSV file with Student names
CSV.open("names.csv", "w") do |csv|
  csv << ["Names"]
  csv << [s1.name]
  csv << [s2.name]
  csv << [s3.name]
  csv << [s4.name]
end

# 6. Print gpa for all students with matching names from CSV files
CSV.foreach("names.csv", headers: true) do |names|   # Iterate all names from names.csv file
  data_array.each do |students|
    if names[0] == students[:name]    # Check if a name from names.csv file is in the students.csv file data
      puts "Student #{students[:name]} #{students[:last_name]} has GPA of #{students[:gpa]}"
    end
  end
end
