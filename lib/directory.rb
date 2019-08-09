# All the students in an array
students = [
  ["Dr. Hannibal Lecter", :november],
  ["Darth Vader", :november],
  ["Nurse Ratched", :november],
  ["Michael Corleone", :november],
  ["Alex DeLarge", :november],
  ["The Wicked Witch of the West", :november],
  ["Terminator", :november],
  ["Freddy Krueger", :november],
  ["The Joker", :november],
  ["Joffrey Baratheon", :november],
  ["Norman Bates", :november]
]

# prints out the titles  
def print_header
  puts "The students of Villains Academy\n-------------"
end

# prints out all the students
def print(names)
  names.each do |student|
    puts "#{student[0]} (#{student[1]} cohort)"
  end
end

# print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#calling the methods
print_header
print(students)
print_footer(students)