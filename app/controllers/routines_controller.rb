class RoutinesController < ApplicationController 

    get '/routines' do 
        @user = current_user 
        @routines = current_user.routines
        erb :'routines/index.html'
    end 

    get '/routines/new' do 
        @user = current_user
        @routines = current_user.routines 
        erb :'/routines/new.html'
    end 

    post '/routines' do 
        routine = Routine.new(name: params[:name], why: params[:why], duration: params[:duration], user_id: session[:user_id])
    
        if routine.save
            flash[:message] = "Nice! New routine! Let's add some habits!"
            redirect "/routines/#{routine.id}"
        else 
            flash[:error] = "Cannot create routine: #{routine.errors.full_messages.to_sentence}"
            redirect '/routines/new' 
        end 
    end 


    get '/routines/:id' do 
        @user = current_user 
        @routine = Routine.find_by_id(params[:id])
        if can_edit_routine(@routine) 
            session[:routine_id] = @routine[:id] 
            erb :'routines/show.html'
        else 
            flash[:error] = "cannot view another users routine" 
            redirect '/routines' 
        end 
    end 

    get '/routines/:id/edit' do 
        @routine = Routine.find_by_id(params[:id])
        if can_edit_routine(@routine)
            erb :'routines/edit.html'
        else 
            flash[:error] = "Cannot edit this Routine, it is not yours!"
            redirect "/routines"
        end 

    end 

    patch '/routines/:id' do 
        routine = Routine.find_by_id(params[:id])
        if can_edit_routine(routine) 
            routine.update(params[:routine]) 
            redirect '/routines'
        else 
            flash[:error] = "cannot delete another users routine" 
            redirect '/routines' 
        end 
    end 

    delete '/routines/:id' do 
        routine = Routine.find_by_id(params[:id])

        if can_edit_routine(routine) 
            routine.destroy 
            redirect '/routines'
        else 
            flash[:error] = "cannot delete another users routine"
            redirect '/routines' 
        end 
    end 
end 