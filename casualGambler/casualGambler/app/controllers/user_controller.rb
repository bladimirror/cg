class UserController < ApplicationController
	def signUp
		render "/user/signUp"
	end

	def new_user
	    puts "Validating form data..."
	    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
	    puts "Creating User ID..."
	    range = [*'0'..'9',*'A'..'Z',*'a'..'z']
	    @usernum_unique = (0...12).map{ range.sample }.join

	    puts "Adding new user to database..."
        @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], usernum: @usernum_unique)

    	render "/layouts/index"
    end
end
