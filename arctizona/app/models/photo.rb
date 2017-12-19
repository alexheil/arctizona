class Photo < ApplicationRecord
  belongs_to :gallery
  belongs_to :album
  belongs_to :user
end
