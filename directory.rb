# Villains Academy Directory
@students = []

@options = {
  "1" => ["input_students", "Input the students", "Students have been added"],
  "2" => ["show_students", "Show the students"],
  "3" => ["save_students", "Save the list to students.csv", "List of students saved"],
  "4" => ["load_students", "Load the list from students.csv", "List has been loaded"],
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
  puts "----- #{@options["1"][2]} -----"
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

def request_filename(action)
  # Request filename from user
  puts "Please enter the filename you would like to #{action}."
  filename = gets.chomp
  while !File.exists?(filename) do
    puts "Sorry, #{filename} doesn't exist."
    puts "Please type a filename, or type students.csv to #{action} the main file."
    filename = gets.chomp
  end
  filename
end

def save_students
  filename = request_filename("save to")
  # Open the file for writing
  file = File.open(filename, "w")
  # Iterate over the array of students
  @students.each do |student|
    file.puts [student[:name], student[:cohort]].join(",")
  end
  file.close
  puts "----- #{@options["3"][2]} -----"
end

def load_students(filename = "get user input")
  filename = request_filename("load from") if filename == "get user input"
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort.to_sym)
  end
  file.close
  puts "----- #{@options["4"][2]} -----"
end

def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
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