# frozen_string_literal: true

require 'active_record'

def connect_db
  begin
  ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    host: 'host',
    username: 'username',
    password: 'password',
    database: 'database_name'
  )
  rescue
    puts "Failed to connect to Database"
  end
end
