class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    # Returns the hash digest of the given string.
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    has_many :active_enrollments, class_name: 'Enrollment',
                                  foreign_key: 'user_id',
                                  dependent:   :destroy
    has_many :takingcourses, through: :active_enrollments, source: :course

    def enroll(course)
        takingcourses << course
    end

    def unenroll(course)
        takingcourses.delete(course)
    end

    def enroll?(course)
        takingcourses.include?(course)
    end
end
