class Model < ActiveRecord::Base
	mount_uploader :fileurl, FileurlUploader # Tells rails to use this uploader for this model.
   	validates :name, presence: true # Make sure the owner's name is present.
   	validates :fileurl, presence: true
   	validates :price, presence: true
   	validates :description, presence: true
end
