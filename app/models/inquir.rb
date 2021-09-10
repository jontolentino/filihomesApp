class Inquir < ApplicationRecord
    validates :name, :email, :message, presence: true
    belongs_to :my_property_listing
    # belongs_to :user
end
