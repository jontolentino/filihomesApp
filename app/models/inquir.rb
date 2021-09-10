class Inquir < ApplicationRecord
    belongs_to :my_property_listing
    belongs_to :user
end
