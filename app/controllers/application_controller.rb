class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end

    def authorize_request(kind = nil)
        unless kind.include?(current_kuser.role)
            redirect_to karticles_path, notice: "Solo puedes ver"
        end
    end
end
