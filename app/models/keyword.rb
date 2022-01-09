class Keyword < ApplicationRecord
  belongs_to :user
  has_many :links

  validates :name, presence: true
  enum search_status: { in_progress: 0, successful: 1, failed: 2 }

  scope :search, ->(query) { where('LOWER(name) LIKE LOWER(?)', "#{query}%") }
end
