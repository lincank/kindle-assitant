require 'active_record'
require 'nokogiri'
require_relative 'app/models/book'
require_relative 'app/models/word'
require_relative 'app/models/lookup'

def db_config
  db_configuration_file = File.join(File.expand_path('..', __FILE__), 'db', 'config.yml')
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_config["default"])

# no more than 7 days
timestamp = 7.days.ago.to_i * 1000

# only export English words
# lookups = Lookup.joins(:word).where('"WORDS"."LANG" = ? ', "en").where("lookups.timestamp > ?", timestamp)
lookups = Lookup.where("timestamp > ?", timestamp)

builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
  xml.wordbook {
    lookups.each do |l|
      xml.item {
        xml.word l.word.try(:word)
        xml.trans { xml.cdata l.usage }
        xml.tags l.book.try(:title)
      }
    end
  }
end

File.open("wordbook.xml", 'w+') { |file| file.write(builder.to_xml) }
