module SessionsHelper
    def log_in(user)
        session[:user_id] = user.email
    end
    # Logs out the current user.
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
    # Returns the current logged-in user (if any).
    def current_user
        @current_user = @current_user|| User.find_by(email: session[:user_id]) ||Instructor.find_by(email: session[:user_id])

    end
    def current_user?(user)
        (user == current_user) || (current_user.admin?)
    end

    def instructor_right?(course)
        course.email == session[:user_id]
    end
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    def current_user_admin?
        current_user.admin?
    end

    # Redirects to stored location (or to the default).
    def redirect_back_or(default)
        @user = User.find_by(email: session[:user_id]) ||Instructor.find_by(email: session[:user_id])
        redirect_to( session[:forwarding_url] || @user)
        session.delete(:forwarding_url)
    end

    # Stores the URL trying to be accessed.
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
end
