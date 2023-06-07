class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_path

  def get_path
    @path = request.fullpath
    @beforePath = request.referer
  end



  protected

    def configure_permitted_parameters
        if resource_class == User
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name,
                                                              :email,
                                                              :created_at,
                                                              :updated_at])
          devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
          devise_parameter_sanitizer.permit(:account_ipdate, keys: [:name,
                                                                    :email,
                                                                    :created_at,
                                                                    :updated_at])
        elsif resource_class == Admin
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name,
                                                             :email,
                                                             :created_at,
                                                             :updated_at])
          devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
          devise_parameter_sanitizer.permit(:account_ipdate, keys: [:name,
                                                                    :email,
                                                                    :created_at,
                                                                    :updated_at])
        end
    end

    def after_sign_in_path_for(resource)
      case resource
          when Admin
            report_books_path
          when User
            books_path
      end
    end
end
