class Gallery < ApplicationRecord
  belongs_to :user

  has_many :albums, dependent: :destroy
  has_many :photos, dependent: :destroy
end
