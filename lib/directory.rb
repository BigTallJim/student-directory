require 'csv'

@students = []  # An empty array which is accessable in all the methods

# prints out the titles  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# prints out all the students
def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# print the total number of students
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# adds students to the list
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_students(name, :november)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
  #return the array of students
  @students
end

# Menu loop until user exits
def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    selection = STDIN.gets.chomp
    # 3. do what the user has asked
    process(selection)
  end
end

# prints out the menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

# prints out the list of students, which header and footer
def show_students
  print_header
  print_students_list  
  print_footer
end

#save the student to a csv file  
def save_students(filename = "students.csv")
  # open the file
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
  puts "#{@students.length} student(s) saved to #{filename}"
end

# checks to see if input file can be loaded  
def try_load_students
  filename = ARGV.first
  
  if filename.nil?
    load_students()
  else
    load_students(filename)
  end
end

# loads from the input file
def load_students(filename = "students.csv")
  #open the file
  if File.exists?(filename)
    student_file = CSV.read(filename)
    student_file.each do |line|
        name, cohort = line
        add_students(name, cohort.to_sym)
    end
    puts "#{student_file.count} student(s) loaded from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end

# adds student hash to the array
def add_students(name, cohort)
  @students << {name: name, cohort: cohort}
end

# prompt for input file name
def get_filename
  puts "What file would you like to choose?"
  return gets.chomp
end

# check input and redirect as required
def process(selection)
  puts "\e[H\e[2J"
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students(get_filename)
    when "4"
      load_students(get_filename)
    when "9"
        exit
    else
      puts "I don't know what you meant, try again"
  end
end

# Mainline
try_load_students
interactive_menu
