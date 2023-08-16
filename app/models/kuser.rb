class Kuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :kposts
    has_many :kcomments
    has_one_attached :avatar
    enum :role, [:normal_kuser, :author]
end
