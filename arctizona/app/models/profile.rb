class Profile < ApplicationRecord
  belongs_to :user

  include ImageUploader[:image]

  #biography 200 characters
end
