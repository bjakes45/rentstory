module ApplicationHelper
	def background_picker
		n = 1 #rand(1..3)
		if n == 1
			'image-background'
		elsif n == 2
			'image-background2'
		else
			'image-background3'
		end			
		
	end
end
