class UserController < ApplicationController
  
  def signup
    @user = User.new
  end

  def register
    @user = User.new(name: params[:name], password: params[:password])
    if @user.save
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to('/top')
    else
      render('user/signup')
    end
  end

  #ログイン画面へ
  def login_form
    @user = User.new
  end
  
  def login
    #名前の一致したデータを取得
    @user = User.find_by(name: params[:name])
    #パスワードの一致を確認
    if @user && @user.authenticate(params[:password])
      #セッションにユーザーIDを保存
      session[:id] = @user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to("/")
    else
      @logerror = "名前またはパスワードが間違っています"
      render("user/login_form")
    end
  end
  
  def logout
    #セッションのユーザーIDを削除
    session[:id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

end
