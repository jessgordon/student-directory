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
    puts "name:"
    name = gets.chomp
    break if name.empty?

    # Get their favourite hobby
    puts "hobby:"
    hobby = gets.chomp    
    # Add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby}
    puts "Now we have #{students.count} students"
  end
  # Return the array of students
  students
end  

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  while count < students.count do
    puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort). In their spare time they love to #{students[count][:hobby]}!"
    count += 1
  end
end

def print_footer(students) 
  puts "Overall, we have #{students.count} great students"
end

# Call methods to print student directory
students = input_students
print_header
print(students)
print_footer(students)