class Movie < ApplicationRecord
  # Associations
  belongs_to :owner
  has_and_belongs_to_many :genres

  # Validations
  validates :name, :thumbnail, :image, :market_price, presence: true
  validates :name, uniqueness: { scope: :owner_id }
  validates :thumbnail, :image, url: true

  # Filters
  before_save :set_parameterized_name

  # Private methods
  private

  def set_parameterized_name
    self.parameterized_name = name.parameterize
  end
end
