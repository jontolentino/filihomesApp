class MyPropertyListing < ApplicationRecord
    validates :title, :location_name, :lot_area, :floor_area, :bedroom_count, :bathroom_count, :details, :property_image, presence: true
    has_one_attached :property_image

    belongs_to :user
    has_many :inquirs, dependent: :destroy
end
