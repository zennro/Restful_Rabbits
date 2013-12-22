require 'bundler'
Bundler.require

set :database, "sqlite3:///rabbit.db"

class Rabbit < ActiveRecord::Base
        
end