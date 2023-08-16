class Kimage < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
