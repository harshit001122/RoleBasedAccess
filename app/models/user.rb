class User < ApplicationRecord
  enum usertype: [:employee, :manager, :admin]

  has_secure_password

  has_many :tasks
  has_many :managed_tasks, class_name: 'Task', foreign_key: 'manager_id'
  after_create :assign_default_role

  private

  def assign_default_role
    add_role(:employee)
  end

  has_one :admin, dependent: :destroy
  has_one :manager, dependent: :destroy
  has_one :employee, dependent: :destroy


  def admin?
    admin.present?
  end

  def manager?
    manager.present?
  end

  def employee?
    employee.present?
  end
end
