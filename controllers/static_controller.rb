class StaticController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	# enable cookies
	helpers Sinatra::Cookies

	# sets root as the parent-directory of the current file
	set :root, File.join(File.dirname(__FILE__), '..')

	# sets the view directory correctly
	set :views, Proc.new { File.join(root, "views") }

  # index
	get "/" do
		unless cookies[:visited]
			@message = true
			response.set_cookie(:visited, value: 1, expires: Time.now + (60 * 20))
		end

		erb :'static/homepage'
	end

end
