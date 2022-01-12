class User < ApplicationRecord
  include Clearance::User

  has_many :keywords, dependent: :destroy

  validates :email, presence: true
end
