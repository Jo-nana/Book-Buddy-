class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # def after_sign_in_path_for(resource_or_scope)
  #   request.referer
  # end
  # def require_no_authentication
  #   assert_is_devise_resource!
  #   return unless is_navigational_format?
  #   no_input = devise_mapping.no_input_strategies

  #   authenticated = if no_input.present?
  #     args = no_input.dup.push scope: resource_name
  #     warden.authenticate?(*args)
  #   else
  #     warden.authenticated?(resource_name)
  #   end

  #   if authenticated && resource = warden.user(resource_name)
  #     set_flash_message(:alert, 'already_authenticated', scope: 'devise.failure')
  #      redirect_back(fallback_location: root_path)
  #   end
  # end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :username, tags: []])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :username, tags: []])
  end
end

def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end
