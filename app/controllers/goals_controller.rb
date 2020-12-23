class GoalsController < ApplicationController 
    
    get '/goals' do 
        @user = current_user
        @goals = current_user.goals
        
        erb :'goals/index.html'
    end 

    get '/goals/new' do 
        @user = current_user
        erb :'/goals/new.html'
    end 

    post '/goals' do 
        @goal = Goal.new(name: params[:name], deadline: params[:deadline], why: params[:why], how: params[:how], user_id: session[:user_id])
        
        if @goal.save
            flash[:message] = "Hooray! A new goal. Lets create a routine to help you achieve it!"
            redirect '/goals'
        else 
            flash[:error] = "Could not create goal: #{@goal.errors.full_messages.to_sentence}"
            redirect '/goals/new' 
        end 
    end 

    get '/goals/:id' do 
        @user = current_user
        @goal = Goal.find_by_id(params[:id])
        if can_edit_goal(@goal)
            session[:goal_id] = @goal.id  
            erb :'/goals/show.html' 
        else 
            flash[:error] = "Cannot view another users goal"
            redirect "/users/#{@user.id}"
        end 
    end 

    get '/goals/:id/edit' do 
        @user = current_user
        @goal = Goal.find_by_id(session[:goal_id])
        
        if can_edit_goal(@goal)
            erb :'/goals/edit.html'
        else 
            flash[:error] = "Cannot edit this goal, it is not yours!"
            redirect "/users/#{@user.id}"
        end 
    end 

    patch '/goals/:id' do 
        @goal = Goal.find_by_id(params[:id])
        if can_edit_goal(@goal)
            @goal.update(name: params[:name], deadline: params[:deadline], why: params[:why], how: params[:how])
            redirect '/goals'
        else
            flash[:error] = "Cannot edit another users goal."
            redirect '/goals'
        end 
    end 

    delete '/goals/:id' do 
        @goal = Goal.find_by_id(params[:id])
        if can_edit_goal(@goal) 
            @goal.destroy 
            redirect '/goals'
        else 
            flash[:error] = "Cannot delete another users goal."
            redirect '/goals'
        end 
        
    end 

end 