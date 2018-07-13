class Message < Granite::Base
  adapter sqlite
  table_name messages

  # id : Int64 primary key is created for you
  field username : String
  field channel : String
  field message : String
end
