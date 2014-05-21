class User < ActiveRecord::Base
  has_and_belongs_to_many :coverage_reports
  has_secure_password
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, :length => {
    :within => 8..25,
    :too_short => "Your password is too short. It must be between 8 and 25 characters.",
    :too_long => "Your password is too long. It must be between 8 and 25 characters."
    }
end
