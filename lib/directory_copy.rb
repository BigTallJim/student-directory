# COPY for Excercises in Step 8

start_letter = "J"
filter_letter = false
filter_length = false
name_length = 12

# All the students in an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

# prints out the titles  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# prints out all the students

def print(students, filter_letter, filter_length, start_letter, name_length)
  index_count = 0
  while index_count < students.length
    student = students[index_count]
    case
      when filter_letter && filter_length
        if student[:name].slice(0) == start_letter && student[:name].length >= name_length
          print_line(student, index_count)
        end
      when filter_letter && !filter_length
        if student[:name].slice(0) == start_letter
          print_line(student, index_count)
        end
      when !filter_letter && filter_length
        if student[:name].length >= name_length
          print_line(student, index_count)
        end
      else
        print_line(student, index_count)
    end
    index_count += 1
  end
end

#prints out the details line
def print_line(student, index)
  puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
end

# print the total number of students
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students(students)
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  #students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students.push({name: name, cohort: :november})
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  #return the array of students
  students
end

#calling the methods
students = input_students(students)
print_header
print(students, filter_letter, filter_length, start_letter, name_length)
print_footer(students)