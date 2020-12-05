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
        @routine = Routine.new 
        @routine.name = params[:name] 
        @routine.why = params[:why] 
        @routine.duration = params[:duration]
        @routine.user_id = current_user.id
        @routine.save
        
        redirect '/routines'
    end 




    get '/routines/:id' do 
        @user = current_user 
        @routines = current_user.routines
        
        erb :'routines/show.html'
    end 

    get '/routines/:id/edit' do 

    end 

    patch '/routines/:id/edit' do 

    end 

    delete '/routines/:id' do 

    end 
end 