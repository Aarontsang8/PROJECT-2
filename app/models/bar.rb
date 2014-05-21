  class Bar
  include Mongoid::Paperclip
  include Mongoid::Document
    # Include this after_commit so that paperclip doesn't freak out
   def self.after_commit(*args, &block)
     args.each do |arg|
     case arg[:on]
       when :destroy
         after_destroy &block
       end
     end
   end

  field :name, type: String
  field :category, type: String
  field :location, type: String
  field :contact, type: String


 has_and_belongs_to_many :users
 has_mongoid_attached_file :image,
 	:styles => {
      :thumb => "100x100#",   # Centrally cropped
      :small  => "150x150>"   # Only squish if it's larger than this
      }  

 validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
