class Gallery < ApplicationRecord
  belongs_to :user

  has_many :photo_albums
end
