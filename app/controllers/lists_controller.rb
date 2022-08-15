class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list =List.new
  end

  def create
    #データ受け取り&新規登録のインスタンス作成
    list = List.new(list_params)
    #データをデータベースに保存（Saveメソッド）
    list.save
    #詳細画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    #listテーブルに保存されている全てのデータを取得→取得データは@list(インスタンス変数)に格納
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  private
  #ストロングパラメータ(データ保護のセキュリティ強化)#「ここから下はこのcontrollerの中でしか呼び出せません」
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
