class MyPropertyListing < ApplicationRecord
    has_one_attached :property_image

    belongs_to :user
end
