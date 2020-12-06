class GoalsController < ApplicationController 
    
    get '/goals' do 
        @user = current_user
        erb :'goals/index.html'
    end 

    get '/goals/new' do 
        @user = current_user
        erb :'/goals/new.html'
    end 

    post '/goals' do 
        #creates the new goal
    end 

    get '/goals/:id' do 
        #shows single goal 
        erb :'/goals/show.html' 
    end 

    get '/goals/:id/edit' do 

        erb :'/goals/edit.html'
    end 

    patch '/goals/:id' do 

    end 

    delete '/goals/:id' do 

    end 
end 