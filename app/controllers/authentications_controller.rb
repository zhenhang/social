class AuthenticationsController < Devise::OmniauthCallbacksController
  def weibo
    omniauth_process
  end
  protected
  def omniauth_process
    omniauth = request.env['omniauth.auth']
    authentication = Authentication.where(provider: omniauth.provider, uid: omniauth.uid.to_s).first

    if authentication && authentication.user
      set_flash_message(:notice,:sign_in)
      sign_in(:user, authentication.user)
      redirect_to root_path
    elsif current_user
      authentication = Authentication.create_from_hash(current_user.id, omniauth)
      set_flash_message(:notice, :add_provider_success)
      redirect_to authentications_path
    else
      @authentication = Authentication.create_from_hash(nil, omniauth)
      session[:authentication_id] = @authentication.id
      session[:avatar] = omniauth.info.image
      session[:location] = omniauth.info.location
      session[:name] = omniauth.info.name
      redirect_to signup_by_weibo_path
    end
  end

  def after_omniauth_failure_path_for(scope)
    new_user_registration_path
  end
  
end
