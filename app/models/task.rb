class Task < ApplicationRecord

  belongs_to :admin
  belongs_to :manager
  belongs_to :employee
end
