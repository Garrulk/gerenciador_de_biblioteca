module ApplicationHelper

	def flash_message
	    messages = ""
	    [:notice, :info, :warning, :error].each {|type|
	      if flash[type]
	        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
	      end
	    }
	    messages.html_safe

	end

	def formata_data(data)
		data&.strftime("%d/%m/%Y")
	end
	
end
