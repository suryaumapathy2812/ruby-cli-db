require   './prompt/table.prompt'
# require_relative './prompt/user.prompt'

def start_prompt

  puts "Welcome to CourseManagementSystem CLI"
  puts "Choose from the Options below"
  puts "1. Tables"
  _option = gets.chomp.to_i

  case _option
  when 1
    puts "Opening CMS tables"
    table_prompt
  end

end

start_prompt