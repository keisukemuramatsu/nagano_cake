class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      case resource
        when Customer
          public_customers_path
        when Admin
          admin_genres_path
      end
    end
    def after_sign_out_path_for(resource)
        new_admin_session_path
    end
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number])
  end
  
end
