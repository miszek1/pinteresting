
require 'paperclip/media_type_spoof_detector'

module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end

class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :large => "1000x1000", :medium => "500x500>", :thumb => "300x300>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


end