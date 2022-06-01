class HotelsController < ApplicationController
  def index
    #allメソッドはhotelsテーブルのレコードを全て取得できるメソッド
    @hotels = Hotel.all
  end
  
  def new
    @hotel = Hotel.new
  end
  def create
    @hotel = Hotel.new(params.require(:hotel).permit(:roomname, :place, :price, :introduction, :picture))
    if @hotel.save
      flash[:notice] = "登録しました"
      redirect_to :hotels
    else
      flash[:notice] = "登録できませんでした"
      render "new"
    end
  end
  def show
    @hotel = Hotel.find(params[:id])

  end
end
