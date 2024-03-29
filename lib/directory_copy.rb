# COPY for Excercises in Step 8

start_letter = "J"
filter_letter = false
filter_length = false
name_length = 12

# All the students in an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :january},
  {name: "Darth Vader", cohort: :february},
  {name: "Nurse Ratched", cohort: :march},
  {name: "Michael Corleone", cohort: :april},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :april},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :april}
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
  cohort_merge = "(" + student[:cohort].to_s + " cohort)"
  index_string = (index+1).to_s + "."
  puts "#{index_string.to_s.center(3)} #{student[:name].center(30)} #{cohort_merge.center(20)}, Hobbies:#{student[:hobbies].to_s.center(30)}, COB:#{student[:cob].to_s.center(10)}, Height:#{student[:height].to_s.center(6)}"
end

# print the total number of students
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
  if students.length > 1
    puts "Overall, we have #{students.count} great students"
  else
    puts "Overall, we have 1 lonely student"
  end
end

def input_students(students)
  puts "Please enter the names of the students, cohort, hobbies, country of birth and height comma delimited"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  # get the first name
  name = gets.chomp
  name_array = name.split(",")

  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    if name_array.length == 5
      student_name = name_array[0].strip
      valid_cohort = [:january,:november,:december]
      cohort = name_array[1].strip.to_sym
      
      if !valid_cohort.include?(cohort)
        cohort = :november
      end
      
      hobbies = name_array[2].strip
      cob = name_array[3].strip
      height = name_array[4].strip
      
      students.push({name: student_name, cohort: cohort, hobbies: hobbies, cob: cob, height: height})
      
      if students.length > 1
        puts "Now we have #{students.count} students"
      else
        puts "Now we have 1 lonely student"
      end
    else
      puts "Invalid input, please try again"
    end
    name = gets.chomp
    name_array = name.split(",")
  end
  #return the array of students
  students
end

def unique_cohort(students)
  students.map{|student| student[:cohort]}.uniq
end

def print_in_cohort_order(students, filter_letter, filter_length, start_letter, name_length, unique_cohort)
  unique_cohort.each do |cohort|
    cohort_map = students.select{|student| student[:cohort] == cohort}
    print(cohort_map, filter_letter, filter_length, start_letter, name_length) 
  end
end

#calling the methods
students = input_students(students)
unique_cohort = unique_cohort(students)
print_header
print_in_cohort_order(students, filter_letter, filter_length, start_letter, name_length, unique_cohort)
print_footer(students)