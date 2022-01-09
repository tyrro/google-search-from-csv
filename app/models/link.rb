class Link < ApplicationRecord
  belongs_to :keyword

  validates :url, presence: true
end
