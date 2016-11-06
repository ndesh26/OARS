class SessionsController < ApplicationController
  def new
  end

  def create
    #render 'new'
    user = User.find_by(email: params[:session][:email].downcase)
    instructor = Instructor.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        # Log the user in and redirect to the user's show page.
        log_in user
        redirect_back_or user
    else if instructor && instructor.authenticate(param[:session][:password])
        log_in instructor
        redirect_back_or instructor
    else
        flash[:danger] = 'invaild login';
        # Create an error message.
        render 'new'
    end
  end

  def destroy
      log_out
      redirect_to root_url
  end
end
