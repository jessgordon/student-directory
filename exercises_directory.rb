# Villains Academy Directory

# Asking user for list of students
def input_students
  puts "Please enter the details of each student (name, hobby)"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # While the name is not empty, repeat this code
  while true do
    # Get a name from the user
    puts "Name:"
    name = gets.chomp
    break if name.empty?

    # Get their cohort
    puts "Cohort:"
    cohort = gets.chomp
    # Error checking for cohort
    if cohort.empty? || (cohort.downcase != "november" && cohort.downcase != "september")
      puts "You entered: #{cohort}"
      puts "Please enter a valid cohort month, otherwise default of november will be used:"
      cohort = gets.chomp
      cohort = "november" if cohort.empty? || (cohort.downcase != "november" && cohort.downcase != "september")
    end

    # Get their favourite hobby
    puts "Hobby:"
    hobby = gets.chomp    
    # Add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobby: hobby}
    puts "Now we have #{students.count} students"
  end
  # Return the array of students
  students
end  

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  count = 0
  while count < students.count do
    puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort). In their spare time they love to #{students[count][:hobby]}!".center(100)
    count += 1
  end
end

def print_footer(students) 
  puts "Overall, we have #{students.count} great students".center(100)
end

# Call methods to print student directory
students = input_students
print_header
print(students)
print_footer(students)