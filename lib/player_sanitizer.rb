class Player::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def sign_up
      default_params.permit(auth_keys + [:username, :email, :password, :password_confirmation])
    end

    def account_update
        default_params.permit(:username, :email, :password, :password_confirmation, :current_password)
    end
end