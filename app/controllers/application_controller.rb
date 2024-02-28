class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private

  def record_not_found exception
    render json: {errors: exception.message}, status: :unprocessable_entity
  end
end
