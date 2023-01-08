class Genre < ApplicationRecord
  # Concerns
  include Parameterizable

  # Associations
  has_and_belongs_to_many :movies, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true
end
