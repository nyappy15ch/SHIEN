class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :team_users
  has_many :teams, through: :team_users
  
  validates :name, presence: true

  password_vali = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: password_vali, message: 'should include English and numbers,and can be used only in half-width'}


  # 簡単ログイン用のユーザー情報
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
