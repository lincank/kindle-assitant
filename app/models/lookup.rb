
class Lookup < ActiveRecord::Base
  self.table_name  = 'LOOKUPS'
  self.primary_key = "id"

  belongs_to :book, foreign_key: "book_key"
  belongs_to :word, foreign_key: "word_key"

end
