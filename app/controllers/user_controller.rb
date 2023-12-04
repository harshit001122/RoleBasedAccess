class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    puts "user = #{@user.usertype}"
    if @user.usertype == "admin"
      @admin = Admin.new(user_params)
      if @admin.save
        redirect_to  login_path
      else
        render :new
      end
    elsif @user.usertype == "manager"
      @manager = Manager.new(user_params)
      if @manager.save
        redirect_to login_path
      else
        puts "Manager save failed: #{@manager.errors.full_messages}"
        render :new
      end
    else
      @employee = Employee.new(user_params)
      if @employee.save
        redirect_to login_path
      else
        render :new
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :usertype, :password, :password_confirmation)
  end
end
