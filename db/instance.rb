require 'singleton'
require 'sequel'

class Database
  include Singleton

  def initialize
    @db = Sequel.sqlite
  end

  def connection
    @db
  end
end

DB = Database.instance.connection
