# Villains Academy Directory
@students = []

@options = {
  "1" => ["input_students", "Input the students"],
  "2" => ["show_students", "Show the students"],
  "3" => ["save_students", "Save the list to students.csv"],
  "4" => ["load_students", "Load the list from students.csv"],
  "9" => ["exit", "Exit"]
}

def add_student(name, cohort)
  @students << {name: name, cohort: cohort}
end

# Asking user for list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Get the first name
  name = STDIN.gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    add_student(name, :november)
    puts "Now we have #{@students.count} students"
    # Get another name from the user
    name = STDIN.gets.chomp
  end
end  

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer 
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  @options.each do |key, value|
    puts "#{key}. #{value[1]}"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end 

def save_students
  # Open the file for writing
  file = File.open("students.csv", "w")
  # Iterate over the array of students
  @students.each do |student|
    file.puts [student[:name], student[:cohort]].join(",")
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort.to_sym)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def process_user_selection(selection)
  if @options.key?(selection)
    self.send(@options[selection][0])
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process_user_selection(STDIN.gets.chomp)
  end
end

# Call the interactive menu at the start of the program
try_load_students
interactive_menu