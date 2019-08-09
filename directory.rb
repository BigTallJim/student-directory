# All the students in an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

# prints out the titles  
def print_header
  return "The students of Villains Academy\n-------------"
end

# prints out all the students
def print(names)
  output=""
  names.each do |student|
    output = output + student + "\n"
  end
  return output
end

# print the total number of students
def print_footer(names)
  return "Overall, we have #{names.count} great students"
end

#calling the methods
puts print_header
puts print(students)
puts print_footer(students)