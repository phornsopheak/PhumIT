class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :set_search

  def set_search
    @q = Article.ransack(params[:q])
  end

  protected
  def configure_permitted_parameters
  end
end
