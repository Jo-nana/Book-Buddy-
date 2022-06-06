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

  def after_sign_in_path_for(resource)
    if request.referer
      if Rails.application.routes.recognize_path(URI(request.referer).path)[:id].present?
        page_id = Rails.application.routes.recognize_path(URI(request.referer).path)[:id].to_i
      end
    end
    if request.referer == "http://localhost:3000/books/#{page_id}"
      @book = Book.find(page_id)
      event_path(@book)
    elsif request.referer == "http://localhost:3000/editions/#{page_id}" || request.referer == "https://www.independentresearchforum.com/editions/#{page_id}"
      edition = Edition.find_by(number: page_id)
      edition_path(edition.number)
    else
      root_path
    end
  end


end
