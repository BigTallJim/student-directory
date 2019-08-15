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

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list  
  print_footer
end

#save the student to a csv file  
def save_students(filename = "students.csv")
  # open the file
  file = File.open(filename, "w")
  # process the rows
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "#{@students.length} student(s) saved to #{filename}"
end
  
def try_load_students
  filename = ARGV.first
  
  if filename.nil?
    load_students()
  else
    load_students(filename)
  end
end

def load_students(filename = "students.csv")
  #open the file
  student_count = 0
  if File.exists?(filename)
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_students(name, cohort.to_sym)
      student_count += 1
    end
    file.close
    puts "#{student_count} student(s) loaded from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort}
end

def get_filename
  puts "What file would you like to choose?"
  return gets.chomp
end

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

#calling the methods
try_load_students
interactive_menu
