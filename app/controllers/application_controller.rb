class ApplicationController < ActionController::Base

  def current_user
    token = session[:usertype]
    if token.present?
      user_info = JsonWebToken.decode(token)
      user_id = user_info[:email]
      if user_id.present?
        @current_user = User.find_by(email: user_id)
      else
        @current_user = nil
      end
    else
      @current_user = nil
    end
  end
end
