class Bar
  include Mongoid::Document
  field :name, type: String
  field :category, type: String
  field :location, type: String
  field :contact, type: String

 has_and_belongs_to_many :users

end
