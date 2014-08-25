require 'bundler/setup'
require 'sqlite3'
require 'lotus/model'
require 'lotus/model/adapters/sql_adapter'

connection_uri = "sqlite://test.db"

database = Sequel.connect(connection_uri)

database.create_table! :counts do
  primary_key :id
  String  :name
  Integer  :value
end
