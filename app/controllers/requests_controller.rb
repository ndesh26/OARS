class RequestsController < ApplicationController
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
end
