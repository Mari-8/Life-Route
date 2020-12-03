class UsersController < ApplicationController 

    get '/users/new' do 
        erb :'/users/new.html'
    end 

    post '/users' do 
        @user = User.new 
        @user.name = params[:name]
        @user.email = params[:email] 
        @user.password = params[:password]
        if @user.save 
            redirect '/login'
        else 
            erb :'users/new.html'
        end
    end 

   

    get '/home' do 
        "page that gives options for goals, routines, habits" 
    end 

end 