require './config/environment'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "life_route" 
    set :show_exceptions, false
    register Sinatra::Flash 
  end

  get "/" do
    erb :welcome
  end

  post '/user_login' do 
    redirect '/login'
  end 

  get '/guide' do 
    erb :'/guide.html'
  end 


  not_found do 
    status 404 
    erb :'users/error.html'
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

    def can_edit_habit(habit) 
      habit.user_id == current_user.id 
    end 

    def can_edit_routine(routine) 
      routine.user_id == current_user.id 
    end 

    def can_edit_goal(goal) 
      goal.user_id == current_user.id
    end 

    def can_edit_user(user)
      user.id == session[:user_id]
    end 

    def login(email, password) 

      user = User.find_by(email: email)
      if user && user.authenticate(password)
        session[:email] = user.email
        session[:user_id] = user.id
      else 
        flash[:invalid_login] = "Invalid credentials, try again!"
        redirect '/login'
        
      end 
    end 

  end 

end
