class AppealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appeals = current_user.appeals
  end

  def new
    @appeal = current_user.appeals.new
  end

  def create
    @appeal = current_user.appeals.new(appeal_params)
    if @appeal.save
      redirect_to appeals_path, notice: "Appeal submitted successfully"
    else
      render 'edit'
    end
  end

private
  def appeal_params
    params.require(:appeal).permit(:appeal_type, :department, :subject, :description, :private)
  end
end