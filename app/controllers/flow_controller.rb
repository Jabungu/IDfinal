class FlowController < ApplicationController
    def home
        render 'home'
        
    end
    def reroute

        if @user=User.find_by(email: params[:email]).try(:authenticate, password: params[:psw]) 
            session[:id]= @user["id"]
            puts "this is what we found"
            puts @user 
            flash[:errors] = []
            redirect_to '/welcome'
        else
            flash[:errors] = "Login failed. Please try again."
            redirect_to '/login'
        end
    end
    def welcome
        session[:total] = 0
        for i in Claim.where(user_id:session[:user]["id"])
            session[:total]+= i.amount
        end
        render 'home'
    end
    def regPage
        render 'registration'
    end
    def registration
        @newUser = User.create(first_name:params[:fn], last_name:params[:ln], company:params[:com], address: params[:ad], city:params[:city], state:params[:state], zip:params[:zip], title:params[:title], email:params[:email], password:params[:psw], subsidiaries:params[:sub], POB:params[:pob], phone:params[:phone] )
        puts "New user Created"
        session[:user] = User.find_by(email: params[:email])
        redirect_to '/welcome'
    end
    def logout
        session.clear
        render 'index'
    end
    def reset
        render 'reset'
    end
    def resetting  
        newReset = Reset.create(email:params[:email])
        redirect_to '/logout'

    end

end
