class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list =List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def index
    #listテーブルに保存されている全てのデータを取得→取得データは@list(インスタンス変数)に格納
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データを取得
    list.destroy #データを削除
    redirect_to '/lists'
  end

  private
  #ストロングパラメータ(データ保護のセキュリティ強化)#「ここから下はこのcontrollerの中でしか呼び出せません」
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
