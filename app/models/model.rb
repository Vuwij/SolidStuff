class Model < ActiveRecord::Base
	mount_uploader :fileurl, FileurlUploader # Tells rails to use this uploader for this model.
   	validates :name, presence: true # Make sure the owner's name is present.
   	validates :fileurl, presence: true
   	validates :price, presence: true
   	validates :description, presence: true

   	def paypal_url(return_url)
   		values = {
   			business: 'jiashen.wang-facilitator@mail.utoronto.ca',
   			cmd: '_xclick',
   			upload: 1,
   			return: return_url,
   			invoice: id,
   			amount: self.price,
   			item_name: self.name,
   			item_number: self.id,
   			quantity: '1'
   		}

   		"https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
   	end
end
