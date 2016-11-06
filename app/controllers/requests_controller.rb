class RequestsController < ApplicationController
    before_action :logged_in_user
    before_action :correct_user
    def create
        user = User.find(params[:user_id])
        course = Course.find(params[:course_id])
        user.request(course)
        redirect_to request_course_user_path(user)
    end

    def destroy
        request = Request.find(params[:id])
        user = request.user
        course =request.course
        user.delete_request(course)
        redirect_to request_course_user_path(user)
    end
	
    def update
        request = Request.find(params[:id])
        request.update_attribute('status', params[:status])
    end

    private
    def logged_in_user
        unless logged_in?
            store_location
            redirect_to login_url
        end
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end


end
