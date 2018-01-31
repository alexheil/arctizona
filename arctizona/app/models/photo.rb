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
  
  before_save :reset_photo_options
  before_save :reset
  before_save :total_price_calculator
  before_save :should_generate_new_friendly_id?, if: :title_changed?

  def photo_resolution
   # get photo resolution from metadata
  end

  protected

    def is_for_sale
      self.for_sale == 1
    end

    def reset_photo_options
      if self.is_art == 1
        self.resolution = ""
        self.camera = ""
        self.lens = ""
        self.aperture = ""
        self.exposure = ""
        self.flash = ""
        self.focal_length = ""
        self.iso = ""
      end
    end

    def reset_art_options
      if self.is_photo == 1 && is_art == 0
        self.tool = ""
        self.medium = ""
        self.surface = ""
        self.size = ""
        self.style = ""
      end
    end

    def total_price_calculator
      self.total_price = base_price + shipping_price if self.for_sale == 1
    end

    def should_generate_new_friendly_id?
      title_changed?
    end

end
