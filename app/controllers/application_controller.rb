class ApplicationController < ActionController::Base
  ##アクション名「configure_permitted_parameters」は慣習としてつけるアクション名
  ##devise_controller?は「もしdeviseコントローラーが動けば」というヘルパーメソッドだからdeviseコントローラーが動かないと発動されないbefore_actionなのだ
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  ##configure=設定、permitted=許可
  def configure_permitted_parameters
    ##devise_parameter_sanitizer=デバイスのパラメーターみたいなもん
    ##permitメソッドの第一引数は処理名（sign_upとか）、第二引数は配列でキーを指定して情報の取得を許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:encrypted_password, :name, :profile, :occupation, :position])
  end
end
