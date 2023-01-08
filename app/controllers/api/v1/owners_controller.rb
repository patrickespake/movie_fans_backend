class Api::V1::OwnersController < ApplicationController
  def index
    owners = Owner.ransack(params[:q]).result.includes(:movies).page(params[:page])
    render json: owners
  end

  def show
    owner = Owner.find(params[:id])
    render json: owner
  end
end