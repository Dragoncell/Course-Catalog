class OthersController < ApplicationController
    def courses
        @courses = Course.all
    end

    def subjects
        @subjects = Subject.all
    end

    def instructors
        @instructors = Instructor.all
    end

    def search
        @subjects = Subject.all
    end

    def searchCourse
        course = params[:course]
        subject = params[:subject]
        if !subject.eql?('Filter by Subjects')
            @courses = Course.where(name: course).where(subject: subject)
        else
            @courses = Course.where(name: course)
        end
    end
end
