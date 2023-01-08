class Api::V1::OwnersController < ApplicationController
  # Concerns
  include Api::V1::Docs::Owners

  def index
    owners = Owner.ransack(params[:q]).result.includes(:movies).page(params[:page]).per_page(size_per_page)
    render json: owners
  end

  def show
    owner = Owner.find(params[:id])
    render json: owner
  end
end