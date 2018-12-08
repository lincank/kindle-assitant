
class Book < ActiveRecord::Base
  # establish_connection :"mssql_development"
  self.table_name  = 'BOOK_INFO'
  self.primary_key = "id"
  # has_many :shipment_orders, class_name: "Wms::ShipmentOrder", foreign_key: "fShopID"
  has_many :lookups, foreign_key: "book_key"
  # belongs_to :word, foreign_key: "word_key"

  # def self.sync_shop_info
  #   shops = self.all
  #   new_shops = []
  #   shops.each do |shop|
  #     new_shops.push ::Shop.new(fShopID: shop.fShopID, fStorerID: shop.fStorerID, fShopName: shop.fShopName)
  #   end
  #   ::Shop.transaction do 
  #     ::Shop.import new_shops
  #   end
  # end
end
