class HabitsController < ApplicationController 

    get '/habits' do 
        @user = current_user 
        @habits = current_user.habits
        erb :'habits/index.html'
    end 

    get '/habits/new' do 
        @user = current_user 
        @habits = current_user.habits 
        erb :'habits/new.html'
    end 

    post '/habits' do 
        @habit = Habit.new
        @habit.name = params[:name]
        @habit.why = params[:why] 
        @habit.when = params[:when] 
        @habit.where = params[:where] 
        @habit.duration = params[:duration]
        @habit.routine_id = session[:routine_id] 
        @habit.user_id = session[:user_id]
        @habit.save
       
        redirect "/routines/#{ session[:routine_id]}"
    end 

    get '/habits/:id' do 
        @routine = Routine.find_by_id(session[:routine_id])
        @user = current_user
        @habit = Habit.find_by_id(params[:id])

        erb :'habits/show.html'
    end 

    get '/habits/:id/edit' do 
        @user = current_user
        @habit = Habit.find_by_id(params[:id])
        erb :'habits/edit.html'
    end 

    patch '/habits/:id' do 
        @habit = Habit.find_by_id(params[:id])
        @habit.update(params["habit"])
        redirect '/habits'
    end 

    delete '/habits/:id' do 
        @habit = Habit.find_by_id(params[:id])
        @habit.destroy
        redirect '/habits'
    end 
end 