class Profile < ApplicationRecord
  belongs_to :user

  include ImageUploader[:image]
end
