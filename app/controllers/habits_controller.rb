class HabitsController < ApplicationController 

    get '/habits' do 
        @user = current_user 
        @habits = current_user.habits
        erb :'habits/index.html'
    end 

    get '/habits/new' do 
        @user = current_user 
        @habits = current_user.habits 
        @routine = Routine.find_by_id(session[:routine_id])
        erb :'habits/new.html'
    end 

    post '/habits' do 

        @habit = Habit.new(name: params[:name], why: params[:why], when: params[:when], where: params[:where], duration: params[:duration], routine_id: session[:routine_id], user_id: session[:user_id])
        
        if @habit.save 
            flash[:message] = "You have added a habit! keep it up!"
            redirect "/routines/#{ session[:routine_id]}"
        else 
            flash[:error] = "Habit creation failed: #{@habit.errors.full_messages.to_sentence}"
            redirect "/habits/new" 
        end 
        
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
        if can_edit_habit(@habit)
            erb :'habits/edit.html'
        else 
            flash[:error] = "Cannot edit this Habit, it is not yours!"
            redirect "/habits"
        end 
        
    end 

    patch '/habits/:id' do 
        @habit = Habit.find_by_id(params[:id])
        @habit.update(params["habit"])
        redirect '/habits'
    end 

    delete '/habits/:id' do 
        @habit = Habit.find_by_id(params[:id])
        if can_edit_habit(@habit) 
            @habit.destroy
            redirect '/habits'
        else 
            flash[:error] = "Cannot delete another users habit" 
            redirect '/habits' 
        end 
    end 
end 