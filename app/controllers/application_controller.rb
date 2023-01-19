class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    mypages_home_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :occupation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

  #ゲストユーザ特定するためresourceを用いる
  #パスワード再設定メール機能はログインする前にできるので、フォームに書いたemailアドレスがゲストユーザかどうかをチェックするのでparams
  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザの編集・削除はできません。'
    end
  end


end
