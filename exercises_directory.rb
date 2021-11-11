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
    name = gets.delete!("\n")
    break if name.empty?

    # Get their cohort
    puts "Cohort:"
    cohort = gets.delete!("\n")
    # Error checking for cohort
    if cohort.empty? || (cohort.downcase != "november" && cohort.downcase != "september")
      puts "You entered: #{cohort}"
      puts "Please enter a valid cohort month, otherwise default of november will be used:"
      cohort = gets.delete!("\n")
      cohort = "november" if cohort.empty? || (cohort.downcase != "november" && cohort.downcase != "september")
    end

    # Get their favourite hobby
    puts "Hobby:"
    hobby = gets.delete!("\n")    
    # Add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobby: hobby}
    (students.count == 1) ? (puts "Now we have #{students.count} student") : (puts "Now we have #{students.count} students")
  end
  # Return the array of students
  students
end  

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  # Initialise array
  array_of_cohorts = []
  # Consolidate all cohorts within the array of cohorts
  students.each do |student|
    array_of_cohorts.push(student[:cohort]) if !(array_of_cohorts.include?(student[:cohort]))
  end
  # Print out all students per cohort
  array_of_cohorts.each do |cohort|
    students.each do |student|
      if cohort == student[:cohort]
        puts "#{student[:name]} (#{cohort} cohort). They also love #{student[:hobby]} in their spare time!".center(100)
      end
    end
    puts ""
  end
end

def print_footer(students) 
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(100)
  else
    puts "Overall, we have #{students.count} great students".center(100)
  end
end

# Call methods to print student directory
students = input_students
if students != []
  print_header
  print(students)
  print_footer(students)
end