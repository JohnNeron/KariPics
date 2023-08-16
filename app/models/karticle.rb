class Karticle < ApplicationRecord
  belongs_to :kuser
  has_many :kcomments
  has_many_attached :kimages
end
