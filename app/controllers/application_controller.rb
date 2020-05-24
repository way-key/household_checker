class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :nickname])
  end

  def after_sign_in_path_for(resource)
    if resource.instance_of?(Admin)
      admins_path
    elsif resource.instance_of?(User)
      users_buy_lists_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif resource == :user
      root_path
    end
  end

end
