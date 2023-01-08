class ApplicationController < ActionController::API
  # Private methods
  private

  def size_per_page
    params[:per_page] || 10
  end
end
