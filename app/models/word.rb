
class Word < ActiveRecord::Base
  self.table_name  = 'WORDS'
  self.primary_key = "id"

  has_many :lookups, foreign_key: "word_key"
  # belongs_to :word, foreign_key: "word_key"

end
