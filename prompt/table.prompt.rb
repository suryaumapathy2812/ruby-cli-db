require_relative './user.prompt'

def table_prompt

  puts "Choose the table you want to work with"
  puts "1. User"
  puts "2. Batch"
  puts "Enter Your Choice"
  _table =gets.chomp.to_i

  case _table
  when 1
    puts "Opening User table options"
    user_prompt
  end


end