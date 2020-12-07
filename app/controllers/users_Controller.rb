class UsersController < ApplicationController 

    get '/users/new' do 
        @user = current_user 
        erb :'/users/new.html'
    end 

    post '/users' do 
        @user = User.new(name: params[:name], email: params[:email], password: params[:password])
        
        if @user.save 
            flash[:message] = "Successfully created new account. Take a look at the guide!"
            redirect '/login'
        else 
            flash[:error] = "Cannot create user: #{@user.errors.full_messages.to_sentence}"
            redirect '/users/new'
        end
    end 

   
    get '/users/:id' do 
        @user = current_user
        if can_edit_user(@user)  
            erb :'users/home.html'
        else 
            flash[:error] = "Can not view another users dashboard" 
            redirect "/login"
        end 
        
    end 

    get '/users/:id/edit' do 
        @user = current_user 
        if can_edit_user(@user) 
            erb :'users/edit.html'
        else 
            flash[:error] = "Cannot edit another users information"
            redirect '/'
        end 
    end 

    patch '/users/:id' do 
      @user = User.find_by_id(session[:user_id])
      @user.update(params[:user])

      redirect "/users/#{@user.id}"
    end 

    delete '/users/:id' do 
        
        @user = current_user 
        if can_edit_user(@user) 
             @user.destroy 
            redirect '/login'
        else 
            flash[:error] = "Cannot edit another users profile" 
            redirect "/users/#{ current_user.id }" 
        end 
    end 

end 