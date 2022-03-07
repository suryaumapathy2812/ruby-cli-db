# frozen_string_literal: true
require_relative './common.table'
require_relative './../model/user.model'
require_relative '../config/connect_db'

class UserTable < CommonTableAction

  def initialize()
    super(:users, create_column_hash, User)
  end

  def create_column_hash
    _columns = {
      :id => :text,
      :name => :text
    }
  end


end