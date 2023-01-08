class Genre < ApplicationRecord
  # Associations
  has_and_belongs_to_many :movies, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true

  # Filters
  before_save :set_parameterized_name

  # Private methods
  private

  def set_parameterized_name
    self.parameterized_name = name.parameterize
  end
end
