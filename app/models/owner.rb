class Owner < ApplicationRecord
  # Concerns
  include Parameterizable

  # Associations
  has_many :movies, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true
end
