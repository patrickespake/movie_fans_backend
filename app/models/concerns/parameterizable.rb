module Parameterizable
  extend ActiveSupport::Concern

  included do
    # Filters
    before_save :set_parameterized_name
  end

  # Private methods
  private

  def set_parameterized_name
    self.parameterized_name = name.parameterize
  end
end
