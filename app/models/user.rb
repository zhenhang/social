class User < ActiveRecord::Base  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable,# :confirmable,
         :lockable, :timeoutable, :omniauthable,omniauth_providers: [:weibo]

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :saying, :sex, :location, :avatar, :rate, :state
  
  has_attached_file :avatar, :default_url => "/images/missing.png"

  has_many :topics
  has_many :replies
  has_many :favs
  has_many :shares

end