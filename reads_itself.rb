myCode = File.read(__FILE__)
# This also does the job:
# myCode = File.read($0)
#
# __FILE__ is a special variable which contains the full 
# file path of the currently executing file. 
#
# $0 is the name of the file used to start the program.

# Will I be printed?

def hmmm
  question = "What about me, will I be printed?"
end

puts myCode