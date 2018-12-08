
class Book < ActiveRecord::Base
  # establish_connection :"mssql_development"
  self.table_name  = 'BOOK_INFO'
  self.primary_key = "id"
  has_many :lookups, foreign_key: "book_key"
  # belongs_to :word, foreign_key: "word_key"

end
