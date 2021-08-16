class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      flash[:notice] = "ログインに成功しました" 
      admin_genres_path
    end
    def after_sign_out_path_for(resource)
      flash[:notice] = "ログアウトしました" 
      new_admin_session_path
    end
end
