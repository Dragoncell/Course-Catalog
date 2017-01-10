class EnrollmentsController < ApplicationController
    def create
        course = Course.find(params[:course_id])
        current_user.enroll(course)
        redirect_to current_user
     end

    def destroy
        course = Enrollment.find(params[:id]).course
        current_user.unenroll(course)
        redirect_to current_user
    end
end
