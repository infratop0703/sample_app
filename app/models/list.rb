class List < ApplicationRecord
  #Listモデルに画像を扱うためのimageカラムを追記
  has_one_attached :image

  # バリデーション設定（入力されていなければFalseを返す
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
