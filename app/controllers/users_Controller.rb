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

   
    get '/user/:id' do 
        @user = User.find_by_id(session[:user_id])
        erb :'users/home.html'
        
    end 

    get '/users/:id/edit' do 
        
    end 

    patch '/users/:id' do 
      
    end 

    delete '/users/:id' do 

    end 

end 