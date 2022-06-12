class MainController < ApplicationController
  
  #投稿内容取得用フック
  before_action :set_post, only: [:edit, :update, :delete, :destroy]

  def top
    #PostモデルとUserモデルの結合
    @posts = Post.all.includes(:user).order(created_at: :desc)
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content])

    #現在ログインしているユーザーのid
    @post.user_id = @current_user.id
    if @post.save
      flash[:notice] = '投稿が完了しました'
      redirect_to('/top')
    else
      #PostモデルとUserモデルの結合
      @posts = Post.all.includes(:user).order(created_at: :desc)
      render('top')
    end
  end

  def edit

  end

  def update
    #投稿内容の更新
    @post.content = params[:content]
    if @post.save
      flash[:notice] = '投稿の更新が完了しました'
      redirect_to('/top')
    else
      render('edit')
    end
  end

  def delete

  end


  def destroy
    if @post.destroy
      flash[:notice] = '投稿の削除が完了しました'
      redirect_to('/top')
    else
      render('delete')
    end
  end

  #投稿内容の取得
  def set_post
    @post = Post.find_by(id: params[:id])
  end

end