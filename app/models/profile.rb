class Profile < ActiveRecord::Base

# attr_accessor :content_type, :original_filename, :image_data
before_validation :set_image


# before_save :decode_base64_image

has_attached_file :image

validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


def set_image
    StringIO.open(Base64.decode64(image_json)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "file.jpg"
      data.content_type = "image/jpeg"
      self.image = data
    end
  end

# protected
#
#   def decode_base64_image
#    if image_data && content_type && original_filename
#      decoded_data = Base64.decode64(image_data)
#
#      data = StringIO.new(decoded_data)
#      data.class_eval do
#        attr_accessor :content_type, :original_filename
#      end
#
#      data.content_type = content_type
#      data.original_filename = File.basename(original_filename)
#
#      self.image = data
#    end
#   end
has_one :user
end
