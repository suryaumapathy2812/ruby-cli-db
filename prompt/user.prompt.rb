require_relative './../migration/user.table'


def create_user(columns)
  puts "Fill in the Details to create user"
  _user_input = {}
  puts columns.to_s
  columns.each do |key, value|
    if key != :id
      puts "#{key} :"
      _user_input[key] = gets.chomp
    end
  end
  _user_input
end

def  print_user(_users, columns)
  _users.each do |user|
    puts user["name"]
    columns.each do |key,val|
        puts "#{key} : #{user[key]}"
    end
  end
end

def user_prompt

  puts "Choose your option"
  puts "1. Create table"
  puts "2. Drop table"
  puts "3. List Users"
  puts "4. Create Users"
  puts "5. Find By ID"
  puts "6. Find By"

  _action = gets.chomp.to_i
  connect_db

  user_table = UserTable.new

  case _action
  when 1
    user_table.create

  when 2
    user_table.drop

  when 3
    _users = user_table.all
    print_user(_users, user_table.columns)

  when 4
    _user = create_user(user_table.columns)
    user_table.insert_one(_user)

  when 5
    puts "Enter User ID"
    _id = gets.chomp.to_i
    user_table.find({ id: _id})

  when 6
    puts "Enter the field name you want to find by"
    key = gets.chomp.to_s
    puts "Enter the Value"
    value = gets.chomp
    user_table.find( {"#{key}":value} )

  end

end

