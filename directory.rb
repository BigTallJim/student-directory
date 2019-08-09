#lets put all the students in an array
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

#prints out the titles  
puts "The students of Villains Academy"
puts "-------------"

#prints out all the students
students.each do |student|
  puts student
end

# finally, we print the total number of students
puts "Overall, we have #{students.count} great students"