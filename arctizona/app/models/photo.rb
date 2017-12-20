class Photo < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  include ImageUploader[:image]

  belongs_to :album
  belongs_to :user

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
