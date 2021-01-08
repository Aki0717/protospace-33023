class PrototypesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :destroy]
  before_action :move_to_index, only: :edit

  def index
    ##Prototypeモデルの全てのテーブルレコードを取得
    @prototype = Prototype.includes(:user)
  end

  def new
    ##Prototypeモデルの全てのテーブルレコードを取得
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    ##urlに含んだユーザーIDでparamsの（ID）番目のデータだけを@prototypeに入れてる
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    ##この処理内容どうなっているか知りたい（prototypeっていうキーは来てるはずだから、.find(params[:id])をしてprototypeに代入するっていう理由は何？置き換え？？）
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    ##この処理内容どうなっているか知りたい（prototypeっていうキーは来てるはずだから、
    prototype = Prototype.find(params[:id])
    if prototype.destroy
      redirect_to root_path
    else
      render :destroy
    end
  end
  

  private
  def prototype_params
    ##paramsのなかの「prototype」大きな箱情報の「image」というデータをuser_id(current_userにidつけて)と一緒に出してっていう内容
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
