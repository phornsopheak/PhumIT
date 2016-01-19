class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :set_search
  before_action :web_detail

  def after_sign_in_path_for(resource)
    rails_admin.dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end

  protected
  def configure_permitted_parameters
  end

  def set_search
    @q = Article.ransack(title_cont: check_search_params)
  end

  def web_detail
    @web_detail = WebDetail.first
  end

  private
  def check_search_params
    params[:q].nil? ? "" : params[:q][:title]
  end
end
