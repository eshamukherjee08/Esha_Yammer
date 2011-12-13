class Users::SessionsController < Devise::SessionsController
  
  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      root_path
    else
      user_path(current_user.id)
    end
  end

end