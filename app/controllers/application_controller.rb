require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "life_route" 
  end

  get "/" do
    erb :welcome
  end

  post '/user_login' do 
    redirect '/login'
  end 




  helpers do 

    def logged_in? 
      !!current_user
    end 

    def current_user 
      @current_user ||= User.find_by(email: session[:email]) if session[:email]
    end 

    def true? 
      !!self
    end 

    def login(email, password) 

      user = User.find_by(email: email)
      if user && user.authenticate(password)
        session[:email] = user.email
        session[:user_id] = user.id
      else 
        redirect '/login'
        
      end 
    end 

  end 

end
