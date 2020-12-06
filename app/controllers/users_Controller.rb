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

   
    get '/users/:id' do 
        @user = current_user
        erb :'users/home.html'
        
    end 

    get '/users/:id/edit' do 
        @user = current_user 
        erb :'users/edit.html'
    end 

    patch '/users/:id' do 
      @user = User.find_by_id(session[:user_id])
      @user.update(params[:user])
      @user.save
      redirect "/users/#{@user.id}"
    end 

    delete '/users/:id' do 
        @user = current_user 
        @user.destroy 
        redirect '/login'
    end 

end 