class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def self.guest #クラスメソッド
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  enum occupation:{
    "---":0,
    "営業":1,"企画・マーケティング":2,"販売・サービス関連":3,"一般事務":4,"専門職(コンサルタント・金融・不動産等)":5,
    "経理・財務":6,"人事":7,"総務":8,"技術系(ITエンジニア)":9,"技術系(メディカル、科学、食品、医療)":10,"技術系(電気、電子、機械、自動車)":11,
    "技術系(建築、土木関連)":12,"クリエイティブ関連":13,"専門職(インターネット)関連":14,"その他":15
  }




end
