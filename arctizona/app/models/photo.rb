class Photo < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  include ImageUploader[:image]

  default_scope -> { order('id DESC') }

  belongs_to :album
  belongs_to :user

  has_many :votes, dependent: :destroy

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
