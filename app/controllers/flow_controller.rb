class FlowController < ApplicationController
    def home
        flash[:errors].clear
        render 'home'
        
    end
    def reroute

        @user=User.find_by(email: params[:email]).try(:authenticate, params[:psw]) 
        if @user        
            session[:user]=@user
            session[:id]= @user["id"]
            puts "this is what we found"
            puts @user
        else
            flash[:errors] = "Login failed. Please try again."
            redirect_to '/login'
        end
        if session[:user]== User.find_by(email:"goderoh@yahoo.com")
                redirect_to '/admin'
        else          
                redirect_to '/welcome'
        end
            
        
    end
    def welcome
        session[:total] = 0
        if Claim.where(user_id: session[:user][:id])
            for i in Claim.where(user_id:session[:user][:id])
                session[:total]+= i.amount
            end
        end
        render 'home'
    end
    def regPage
        render 'registration'
    end
    def registration
        @newUser = User.create(first_name:params[:fn], last_name:params[:ln], company:params[:com], address: params[:ad], city:params[:city], state:params[:state], zip:params[:zip], title:params[:title], email:params[:email], password:params[:psw], subsidiaries:params[:sub], POB:params[:pob], phone:params[:phone] )
        puts "New user Created"
        session[:user] = @newUser
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
    def admin 
            for i in Claim.all
                session[:total]=0
                session[:total]+= i.amount
            end

            render 'claimadmin'
        

    end
    def addClaim        
        @newClaim = Claim.create(owner_name:params[:Owner_Name], amount:params[:Amount], property_id:params[:pi], property_type:params[:pt], year_reported:params[:yp], address: params[:address], city: params[:city], state: params[:state], zip:params[:zip], user_id: params[:UID] )
        redirect_to '/admin'
    end

end
