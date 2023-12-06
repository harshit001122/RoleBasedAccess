class Admin < ApplicationRecord
  has_secure_password

  has_many :tasks
  belongs_to :manager
end
