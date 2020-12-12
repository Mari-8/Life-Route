class SessionsController < ApplicationController

    get '/login' do 
        erb :'/sessions/login.html'
    end 

    post '/sessions' do 
        login(params[:email], params[:password])
        @user = User.find_by_id(session[:user_id])
        redirect "/users/#{@user.id}"
    end 

    get '/logout' do 
        session.clear
        redirect '/'
    end 


end 