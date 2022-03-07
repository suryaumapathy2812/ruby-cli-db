# frozen_string_literal: true

class CommonTableAction
  attr_accessor :table_name, :columns, :model

  def initialize(table_name, columns, model)
    @table_name = table_name
    @columns = columns
    @model = model
  end

  def create
    puts @table_name
    begin
      connect_db
      ActiveRecord::Migration.create_table(@table_name) do |t|
        @columns.each_key do |key|
          if key != :id
            puts " :name => #{@columns[key]} "
            t.column key, @columns[key]
          end
        end
      end
    rescue error
      puts 'Failed to create User Table'
      puts error
    end
  end

  def drop
    puts @table_name
    connect_db
    ActiveRecord::Migration.drop_table(@table_name)
  rescue StandardError
    puts 'Failed to Drop User table'
  end

  #=========================================================================================

  def all
    @model.all
  end

  def find(option)
    puts option
    puts "46"
    args = option.keys
    len = args.length
    case len
    when 1
      puts args
      # find_by_id(1)
      return find_by(option)
    when 0
      puts '0 args'
      return puts @model.all
    end
  end

  def insert_one(user_obj )
    @model.create!(user_obj )
  end



  private
  def find_by_id(_id)
    puts "Matches are"
    @model.where("id = '#{_id}'")
  end


  def find_by(_option)
    # _query = @model.where(_option)
    _query = ""
    puts _option.class
    _keys = _option.keys
    _len  = _option.length
    _keys.each_with_index do |key, index|
      puts key
      puts index
      if( index > 0 && index < _len)
        _query = _query + " AND "
      end
      _query = _query + " #{key} = #{_option[key]} "
    end
    puts _query
    @model.where(_query)
  end

end



