class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new 
  end
  
  def create
    @user = User.new(params.require(:user).permit(:user_name, :email, :password, :introduction, :avatar_url))
    if @user.save
      flash[:notice] = "登録しました"
      redirect_to :users
    else
      flash[:notice] = "登録できませんでした"
      render "new"
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  # def edit2
  #   @user = User.find(params[:id])
  # end

  def update
    # @user = User.find(params[:id])
    # if @user.update(params.require(:user).permit(:user_name, :email, :password, :introduction, :avatar_url))
    #   flash[:notice] = "スケジュールIDが｛#{@user.id}｝の情報を更新しました"
    #   redirect_to :users
      
    #   @user = User.find(user_in_session.id)
    #   upload_file = params[:user][:upload_file]
    #   if upload_file.present?
    #     # アップロードファイルの元の名前
    #     upload_file_name = upload_file.original_filename
    #   end
    # else
    #   render "edit"
    # end
    
    # def update
    # # セッション中のユーザーに対する処理
    # @user = User.find(user_in_session.id)
 
    # # アップロードファイル <- file_field
    # upload_file = params[:user][:upload_file]
    # if upload_file.present?
    #   # アップロードファイルの元の名前
    #   upload_file_name = upload_file.original_filename
    # end
    def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:user_name, :email, :password, :introduction, :avatar_url))
      flash[:notice] = "スケジュールIDが｛#{@user.id}｝の情報を更新しました"
      redirect_to :users
    else
      render "edit"
    end
    
  end
  end
end
