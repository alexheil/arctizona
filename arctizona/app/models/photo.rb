class Photo < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  include ImageUploader[:image]

  default_scope -> { order('id DESC') }

  belongs_to :album
  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :purchases

  validates :base_price, presence: true, if: :is_for_sale
  validates :shipping_price, presence: true, length: { maximum: 6 }, numericality: { greater_than: 0}, if: :is_for_sale
  validates :currency, presence: true, length: { maximum: 6 }, numericality: { greater_than: -1}, if: :is_for_sale
  validates :quantity, presence: true, if: :is_for_sale
  validates :total_price, presence: true, if: :is_for_sale
  
  before_save :total_price_calculator
  before_save :should_generate_new_friendly_id?, if: :title_changed?

  def photo_resolution
   # get photo resolution from metadata
  end

  private

    def is_for_sale
      self.for_sale == 1
    end

    def is_art
      #  if it's art reset photo settings
    end

    def is_photo
      #  if it's photo reset art settings
    end

    def total_price_calculator
      self.total_price = base_price + shipping_price
    end

    def should_generate_new_friendly_id?
      title_changed?
    end

end
