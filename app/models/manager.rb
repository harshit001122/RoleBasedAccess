class Manager < ApplicationRecord
  has_secure_password

  has_many :tasks
  belongs_to :user
end
