  class Bar
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :image
  validates_attachment_content_type :image , :content_type => /\Aimage\/.*\Z/

  field :name, type: String
  field :category, type: String
  field :location, type: String
  field :contact, type: String


 has_and_belongs_to_many :users

end
