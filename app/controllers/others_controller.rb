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
end
