module ApplicationHelper

	def flash_message
	    messages = ""
	    [:notice, :info, :warning, :error].each {|type|
	      if flash[type]
	      	if flash[type] == flash[:error]
	      		"<div class='alert alert-error' role= 'alert'></div>"
	      	else
	      		"<div class='alert alert-success' role= 'alert'></div>"


	      	end
	        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
	      end
	    }
	    messages.html_safe

	end

	def formata_data(data)
		data&.strftime("%d/%m/%Y")
	end
	
end
