class Movie < ApplicationRecord
  # Concerns
  include Parameterizable

  # Associations
  belongs_to :owner
  has_and_belongs_to_many :genres

  # Validations
  validates :name, :thumbnail, :image, :market_price, presence: true
  validates :name, uniqueness: { scope: :owner_id }
  validates :thumbnail, :image, url: true
end
