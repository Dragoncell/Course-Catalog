class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @courses = @user.takingcourses
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = 'Welcome to the Course Catalog!'
            redirect_to @user
        else
            render 'new'
        end
  end

    def searchCourse
        @user ||= User.find_by(id: session[:user_id])
        course = params[:course]
        subject = params[:subject]
        if !subject.eql?('Filter by Subjects')
            @searchcourses = Course.where(name: course).where(subject: subject)
        else
            @searchcourses = Course.where(name: course)
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
    end
end
