class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_current_action
    before_action :set_current_user
  
    #ユーザー情報を取得
    def set_current_user
        @current_user = User.find_by(id: session[:id])
    end

    def set_current_action
        @current_action = action_name
    end
end