class Course < ApplicationRecord
    has_many :passive_enrollments, class_name: 'Enrollment',
                                   foreign_key: 'course_id',
                                   dependent:   :destroy
    has_many :takingusers, through: :passive_enrollments, source: :user
end
