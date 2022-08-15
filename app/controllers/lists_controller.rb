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
    #トップ画面へリダイレクト
    redirect_to '/top'
  end

  def index
    #listテーブルに保存されている全てのデータを取得→取得データは@list(インスタンス変数)に
    @lists = List.all
  end

  def show
  end

  def edit
  end

  private
  #ストロングパラメータ(データ保護のセキュリティ強化)#「ここから下はこのcontrollerの中でしか呼び出せません」
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
